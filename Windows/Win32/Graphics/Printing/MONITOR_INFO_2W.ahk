#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class MONITOR_INFO_2W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 0)
            return this.__pName
        }
    }

    /**
     * @type {PWSTR}
     */
    pEnvironment{
        get {
            if(!this.HasProp("__pEnvironment"))
                this.__pEnvironment := PWSTR(this.ptr + 8)
            return this.__pEnvironment
        }
    }

    /**
     * @type {PWSTR}
     */
    pDLLName{
        get {
            if(!this.HasProp("__pDLLName"))
                this.__pDLLName := PWSTR(this.ptr + 16)
            return this.__pDLLName
        }
    }
}
