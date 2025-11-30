#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Options for the amount of information to report about a device object's lifetime.
 * @remarks
 * 
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-reportlivedeviceobjects">ID3D11Debug::ReportLiveDeviceObjects</a>.
 *         
 * 
 * Several inline functions exist to combine the options using operators, see the D3D11SDKLayers.h header file for details.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RLDO_FLAGS extends Win32BitflagEnum{

    /**
     * Specifies to obtain a summary about a device object's lifetime.
     * @type {Integer (Int32)}
     */
    static D3D11_RLDO_SUMMARY => 1

    /**
     * Specifies to obtain detailed information about a device object's lifetime.
     * @type {Integer (Int32)}
     */
    static D3D11_RLDO_DETAIL => 2

    /**
     * This flag indicates to ignore objects which have no external refcounts keeping them alive. D3D objects are printed using an external refcount and an internal refcount. Typically, all objects are printed. This flag means ignore the objects whose external refcount is 0, because the application is not responsible for keeping them alive.
     * @type {Integer (Int32)}
     */
    static D3D11_RLDO_IGNORE_INTERNAL => 4
}
