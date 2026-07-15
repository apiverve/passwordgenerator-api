declare module '@apiverve/passwordgenerator' {
  export interface passwordgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface passwordgeneratorResponse {
    status: string;
    error: string | null;
    data: PasswordGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PasswordGeneratorData {
      passwords: Password[];
      count:     number | null;
  }
  
  interface Password {
      password: null | string;
      length:   number | null;
      metadata: Metadata;
      analysis: null;
  }
  
  interface Metadata {
      type:       Type | null;
      complexity: Complexity | null;
  }
  
  enum Complexity {
      Strong = "strong",
  }
  
  enum Type {
      Random = "random",
  }

  export default class passwordgeneratorWrapper {
    constructor(options: passwordgeneratorOptions);

    execute(callback: (error: any, data: passwordgeneratorResponse | null) => void): Promise<passwordgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: passwordgeneratorResponse | null) => void): Promise<passwordgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<passwordgeneratorResponse>;
  }
}
