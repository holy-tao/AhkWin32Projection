#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_HDR_METADATA_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_HDR_METADATA_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3DDDI_HDR_METADATA_TYPE_HDR10
     * @type {Integer (Int32)}
     */
    static HDR10 => 1

    /**
     * Native name: D3DDDI_HDR_METADATA_TYPE_HDR10PLUS
     * @type {Integer (Int32)}
     */
    static HDR10PLUS => 2
}
