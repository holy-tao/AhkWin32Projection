#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Domain options for tessellator data.
 * @remarks
 * The data domain defines the type of data. This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/ns-d3d11shader-d3d11_shader_desc">D3D11_SHADER_DESC</a>.
 * 
 * The <b>D3D11_TESSELLATOR_DOMAIN</b>     enumeration is type defined in the  D3D11Shader.h header file as a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_tessellator_domain">D3D_TESSELLATOR_DOMAIN</a> enumeration, which is fully defined in the  D3DCommon.h header file.
 * 
 * 
 * ```
 * 
 * typedef D3D_TESSELLATOR_DOMAIN D3D11_TESSELLATOR_DOMAIN;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_domain
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_TESSELLATOR_DOMAIN extends Win32Enum {

    /**
     * Native name: D3D_TESSELLATOR_DOMAIN_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: D3D_TESSELLATOR_DOMAIN_ISOLINE
     * @type {Integer (Int32)}
     */
    static ISOLINE => 1

    /**
     * Native name: D3D_TESSELLATOR_DOMAIN_TRI
     * @type {Integer (Int32)}
     */
    static TRI => 2

    /**
     * Native name: D3D_TESSELLATOR_DOMAIN_QUAD
     * @type {Integer (Int32)}
     */
    static QUAD => 3

    /**
     * The data type is undefined.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_DOMAIN_UNDEFINED => 0

    /**
     * Isoline data.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_DOMAIN_ISOLINE => 1

    /**
     * Triangle data.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_DOMAIN_TRI => 2

    /**
     * Quad data.
     * @type {Integer (Int32)}
     */
    static D3D11_TESSELLATOR_DOMAIN_QUAD => 3
}
