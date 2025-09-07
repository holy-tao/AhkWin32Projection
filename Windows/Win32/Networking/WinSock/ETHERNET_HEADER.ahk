#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DL_OUI.ahk
#Include .\DL_EI48.ahk
#Include .\DL_EUI48.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ETHERNET_HEADER extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {DL_EUI48}
     */
    Destination{
        get {
            if(!this.HasProp("__Destination"))
                this.__Destination := DL_EUI48(this.ptr + 0)
            return this.__Destination
        }
    }

    /**
     * @type {DL_EUI48}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := DL_EUI48(this.ptr + 24)
            return this.__Source
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }
}
