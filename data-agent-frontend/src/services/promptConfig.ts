/*
 * Copyright 2024-2026 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import axios from './axiosConfig';
import { ApiResponse } from './common';

export interface PromptConfig {
  id?: number;
  name?: string;
  promptType?: string;
  content?: string;
  enabled?: boolean;
  priority?: number;
  displayOrder?: number;
  agentId?: number;
  creator?: string;
  createdTime?: string;
  updatedTime?: string;
}

const API_BASE_URL = '/prompt-config';

class PromptConfigService {
  /**
   * 根据类型获取配置列表
   */
  async listByType(type: string, agentId?: number): Promise<PromptConfig[]> {
    const params: Record<string, any> = {};
    if (agentId) params.agentId = agentId;
    
    const response = await axios.get<ApiResponse<PromptConfig[]>>(`${API_BASE_URL}/list-by-type/${type}`, {
      params
    });
    return response.data.data || [];
  }

  /**
   * 保存配置
   */
  async save(config: Partial<PromptConfig>): Promise<PromptConfig> {
    const response = await axios.post<ApiResponse<PromptConfig>>(`${API_BASE_URL}/save`, config);
    return response.data.data;
  }

  /**
   * 启用配置
   */
  async enable(id: number): Promise<ApiResponse<void>> {
    const response = await axios.post<ApiResponse<void>>(`${API_BASE_URL}/${id}/enable`);
    return response.data;
  }

  /**
   * 禁用配置
   */
  async disable(id: number): Promise<ApiResponse<void>> {
    const response = await axios.post<ApiResponse<void>>(`${API_BASE_URL}/${id}/disable`);
    return response.data;
  }

  /**
   * 获取配置详情
   */
  async getById(id: number): Promise<PromptConfig> {
    const response = await axios.get<ApiResponse<PromptConfig>>(`${API_BASE_URL}/${id}`);
    return response.data.data;
  }

  /**
   * 批量启用配置
   */
  async batchEnable(ids: number[]): Promise<ApiResponse<void>> {
    const response = await axios.post<ApiResponse<void>>(`${API_BASE_URL}/batch-enable`, ids);
    return response.data;
  }

  /**
   * 批量禁用配置
   */
  async batchDisable(ids: number[]): Promise<ApiResponse<void>> {
    const response = await axios.post<ApiResponse<void>>(`${API_BASE_URL}/batch-disable`, ids);
    return response.data;
  }

  /**
   * 更新配置优先级
   */
  async updatePriority(id: number, priority: number): Promise<ApiResponse<void>> {
    const response = await axios.post<ApiResponse<void>>(`${API_BASE_URL}/${id}/priority`, { priority });
    return response.data;
  }

  /**
   * 删除配置
   */
  async delete(id: number): Promise<ApiResponse<void>> {
    const response = await axios.delete<ApiResponse<void>>(`${API_BASE_URL}/${id}`);
    return response.data;
  }
}

export default new PromptConfigService();
