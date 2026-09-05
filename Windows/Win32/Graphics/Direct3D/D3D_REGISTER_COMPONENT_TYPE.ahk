#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that identify the data types that can be stored in a register.
 * @remarks
 * A register component type is specified in the <b>ComponentType</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_signature_parameter_desc">D3D11_SIGNATURE_PARAMETER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_register_component_type
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_REGISTER_COMPONENT_TYPE extends Win32Enum {

    /**
     * The data type is unknown.
     * Native name: D3D_REGISTER_COMPONENT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * 32-bit unsigned integer.
     * Native name: D3D_REGISTER_COMPONENT_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 1

    /**
     * 32-bit signed integer.
     * Native name: D3D_REGISTER_COMPONENT_SINT32
     * @type {Integer (Int32)}
     */
    static SINT32 => 2

    /**
     * 32-bit floating-point number.
     * Native name: D3D_REGISTER_COMPONENT_FLOAT32
     * @type {Integer (Int32)}
     */
    static FLOAT32 => 3

    /**
     * Native name: D3D_REGISTER_COMPONENT_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 4

    /**
     * Native name: D3D_REGISTER_COMPONENT_SINT16
     * @type {Integer (Int32)}
     */
    static SINT16 => 5

    /**
     * Native name: D3D_REGISTER_COMPONENT_FLOAT16
     * @type {Integer (Int32)}
     */
    static FLOAT16 => 6

    /**
     * Native name: D3D_REGISTER_COMPONENT_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 7

    /**
     * Native name: D3D_REGISTER_COMPONENT_SINT64
     * @type {Integer (Int32)}
     */
    static SINT64 => 8

    /**
     * Native name: D3D_REGISTER_COMPONENT_FLOAT64
     * @type {Integer (Int32)}
     */
    static FLOAT64 => 9

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
