#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_IPSEC_DELETE_UDPESP_SA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    OffloadHandle{
        get {
            if(!this.HasProp("__OffloadHandle"))
                this.__OffloadHandle := HANDLE(0, this)
            return this.__OffloadHandle
        }
    }

    /**
     * @type {HANDLE}
     */
    EncapTypeEntryOffldHandle{
        get {
            if(!this.HasProp("__EncapTypeEntryOffldHandle"))
                this.__EncapTypeEntryOffldHandle := HANDLE(8, this)
            return this.__EncapTypeEntryOffldHandle
        }
    }
}
