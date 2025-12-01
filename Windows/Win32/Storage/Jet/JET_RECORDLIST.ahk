#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\StructuredStorage\JET_TABLEID.ahk

/**
 * Learn more about: JET_RECORDLIST constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-recordlist-constructor
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_RECORDLIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {JET_TABLEID}
     */
    tableid{
        get {
            if(!this.HasProp("__tableid"))
                this.__tableid := JET_TABLEID(8, this)
            return this.__tableid
        }
    }

    /**
     * @type {Integer}
     */
    cRecord {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    columnidBookmark {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
