#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_RELOAD_DEFAULTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11ReloadWEPKeys => 0
}
