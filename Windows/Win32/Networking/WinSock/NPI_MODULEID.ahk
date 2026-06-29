#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\NPI_MODULEID_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class NPI_MODULEID extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {NPI_MODULEID_TYPE}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(8, this)
            return this.__Guid
        }
    }

    /**
     * @type {LUID}
     */
    IfLuid {
        get {
            if(!this.HasProp("__IfLuid"))
                this.__IfLuid := LUID(8, this)
            return this.__IfLuid
        }
    }
}
