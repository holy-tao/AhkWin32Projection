#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_UPDATEGPUVIRTUALADDRESS_MAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_UPDATEGPUVIRTUALADDRESS_UNMAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_UPDATEGPUVIRTUALADDRESS_COPY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_UPDATEGPUVIRTUALADDRESS_MAP_PROTECT => 3
}
