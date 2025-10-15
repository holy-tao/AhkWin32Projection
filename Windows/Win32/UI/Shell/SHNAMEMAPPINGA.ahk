#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHNAMEMAPPINGA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pszOldPath{
        get {
            if(!this.HasProp("__pszOldPath"))
                this.__pszOldPath := PSTR(this.ptr + 0)
            return this.__pszOldPath
        }
    }

    /**
     * @type {PSTR}
     */
    pszNewPath{
        get {
            if(!this.HasProp("__pszNewPath"))
                this.__pszNewPath := PSTR(this.ptr + 8)
            return this.__pszNewPath
        }
    }

    /**
     * @type {Integer}
     */
    cchOldPath {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cchNewPath {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
