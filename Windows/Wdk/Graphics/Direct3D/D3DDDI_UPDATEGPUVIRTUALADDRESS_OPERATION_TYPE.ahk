#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_UPDATEGPUVIRTUALADDRESS_MAP
     * @type {Integer (Int32)}
     */
    static MAP => 0

    /**
     * Native name: D3DDDI_UPDATEGPUVIRTUALADDRESS_UNMAP
     * @type {Integer (Int32)}
     */
    static UNMAP => 1

    /**
     * Native name: D3DDDI_UPDATEGPUVIRTUALADDRESS_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 2

    /**
     * Native name: D3DDDI_UPDATEGPUVIRTUALADDRESS_MAP_PROTECT
     * @type {Integer (Int32)}
     */
    static MAP_PROTECT => 3
}
