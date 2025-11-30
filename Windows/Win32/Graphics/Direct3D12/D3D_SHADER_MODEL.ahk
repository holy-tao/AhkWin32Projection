#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a shader model.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_shader_model">D3D12_FEATURE_DATA_SHADER_MODEL</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d_shader_model
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D_SHADER_MODEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_NONE => 0

    /**
     * Indicates shader model 5.1.
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_5_1 => 81

    /**
     * Indicates shader model 6.0.
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_0 => 96

    /**
     * Indicates shader model 6.1.
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_1 => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_2 => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_3 => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_4 => 100

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_5 => 101

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_6 => 102

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_7 => 103

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_8 => 104

    /**
     * @type {Integer (Int32)}
     */
    static D3D_SHADER_MODEL_6_9 => 105

    /**
     * @type {Integer (Int32)}
     */
    static D3D_HIGHEST_SHADER_MODEL => 105
}
