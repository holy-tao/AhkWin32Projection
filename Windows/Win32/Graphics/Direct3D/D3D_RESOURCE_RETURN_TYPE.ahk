#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates return value type.
 * @remarks
 * The    <b>D3D11_RESOURCE_RETURN_TYPE</b> enumeration is type defined in the  D3D11shader.h header file as a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type">D3D_RESOURCE_RETURN_TYPE</a> enumeration, which is fully defined in the  D3DCommon.h header file.
 * 
 * 
 * ```
 * 
 * typedef D3D_RESOURCE_RETURN_TYPE D3D11_RESOURCE_RETURN_TYPE;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_RESOURCE_RETURN_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_UNORM => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_SNORM => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_SINT => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_UINT => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_FLOAT => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_MIXED => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_DOUBLE => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D_RETURN_TYPE_CONTINUED => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_UNORM => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_SNORM => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_SINT => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_UINT => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_FLOAT => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_RETURN_TYPE_MIXED => 6

    /**
     * Return type is UNORM.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_UNORM => 1

    /**
     * Return type is SNORM.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_SNORM => 2

    /**
     * Return type is SINT.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_SINT => 3

    /**
     * Return type is UINT.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_UINT => 4

    /**
     * Return type is FLOAT.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_FLOAT => 5

    /**
     * Return type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_MIXED => 6

    /**
     * Return type is DOUBLE.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_DOUBLE => 7

    /**
     * Return type is a multiple-dword type, such as a double or uint64, and the component is continued from the previous component that was declared.  The first component represents the lower bits.
     * @type {Integer (Int32)}
     */
    static D3D11_RETURN_TYPE_CONTINUED => 8
}
