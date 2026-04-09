#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_STATUS_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_802_11_STATUS_INDICATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {NDIS_802_11_STATUS_TYPE}
     */
    StatusType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
