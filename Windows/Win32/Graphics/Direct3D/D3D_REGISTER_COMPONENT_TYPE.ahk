#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that identify the data types that can be stored in a register.
 * @remarks
 * 
  * A register component type is specified in the <b>ComponentType</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_signature_parameter_desc">D3D11_SIGNATURE_PARAMETER_DESC</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_register_component_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_REGISTER_COMPONENT_TYPE{

    /**
     * The data type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_UNKNOWN => 0

    /**
     * 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_UINT32 => 1

    /**
     * 32-bit signed integer.
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_SINT32 => 2

    /**
     * 32-bit floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_FLOAT32 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_UINT16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_SINT16 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_FLOAT16 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_UINT64 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_SINT64 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D_REGISTER_COMPONENT_FLOAT64 => 9

    /**
     * The data type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_UNKNOWN => 0

    /**
     * 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_UINT32 => 1

    /**
     * 32-bit signed integer.
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_SINT32 => 2

    /**
     * 32-bit floating-point number.
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_FLOAT32 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_UINT16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_SINT16 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_FLOAT16 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_UINT64 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_SINT64 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_REGISTER_COMPONENT_FLOAT64 => 9
}
