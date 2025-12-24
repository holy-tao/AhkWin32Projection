#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_HDR_METADATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_HDR_METADATA_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_HDR_METADATA_TYPE_HDR10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_HDR_METADATA_TYPE_HDR10PLUS => 2
}
