#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that indicate the location of a shader
 * @remarks
 * 
 * You pass a <b>D3D_INCLUDE_TYPE</b>-typed value to the  <i>IncludeType</i> parameter in a call to the  <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nf-d3dcommon-id3dinclude-open">ID3DInclude::Open</a> method to indicate the location of the #include file.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_include_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_INCLUDE_TYPE{

    /**
     * The local directory.
     * @type {Integer (Int32)}
     */
    static D3D_INCLUDE_LOCAL => 0

    /**
     * The system directory.
     * @type {Integer (Int32)}
     */
    static D3D_INCLUDE_SYSTEM => 1

    /**
     * The local directory.
     * @type {Integer (Int32)}
     */
    static D3D10_INCLUDE_LOCAL => 0

    /**
     * The system directory.
     * @type {Integer (Int32)}
     */
    static D3D10_INCLUDE_SYSTEM => 1
}
