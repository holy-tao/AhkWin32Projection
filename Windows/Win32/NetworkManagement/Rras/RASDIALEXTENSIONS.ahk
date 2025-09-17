#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RASEAPINFO.ahk
#Include .\RASDEVSPECIFICINFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASDIALEXTENSIONS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwfOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    hwndParent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    reserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    reserved1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {RASEAPINFO}
     */
    RasEapInfo{
        get {
            if(!this.HasProp("__RasEapInfo"))
                this.__RasEapInfo := RASEAPINFO(this.ptr + 32)
            return this.__RasEapInfo
        }
    }

    /**
     * @type {Integer}
     */
    fSkipPppAuth {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {RASDEVSPECIFICINFO}
     */
    RasDevSpecificInfo{
        get {
            if(!this.HasProp("__RasDevSpecificInfo"))
                this.__RasDevSpecificInfo := RASDEVSPECIFICINFO(this.ptr + 56)
            return this.__RasDevSpecificInfo
        }
    }
}
