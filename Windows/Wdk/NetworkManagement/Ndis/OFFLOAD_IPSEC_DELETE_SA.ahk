#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_IPSEC_DELETE_SA extends Win32Struct
{
    static sizeof => 8

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
}
