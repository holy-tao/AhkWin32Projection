#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how memory gets routed by a shader resource view (SRV).
 * @remarks
 * 
  * This enum allows the SRV to select how memory gets routed to the four return components in a shader after a memory fetch. The options for each shader component [0..3] (corresponding to RGBA) are: component 0..3 from the SRV fetch result or force 0 or force 1.        
  * 
  * The default 1:1 mapping can be indicated by specifying **D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING**, otherwise an arbitrary mapping can be specified using the macro **D3D12_ENCODE_SHADER_4_COMPONENT_MAPPING**.
  * 
  * See below.
  * 
  * Note the following defines.
  * 
  * ```cpp
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_shader_component_mapping
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_COMPONENT_MAPPING{

    /**
     * Indicates return component 0 (red).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_0 => 0

    /**
     * Indicates return component 1 (green).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_1 => 1

    /**
     * Indicates return component 2 (blue).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_2 => 2

    /**
     * Indicates return component 3 (alpha).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FROM_MEMORY_COMPONENT_3 => 3

    /**
     * Indicates forcing the resulting value to 0.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_0 => 4

    /**
     * Indicates forcing the resulting value 1. The value of forcing 1 is either 0x1 or 1.0f depending on the format type for that component in the source format.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_FORCE_VALUE_1 => 5
}
