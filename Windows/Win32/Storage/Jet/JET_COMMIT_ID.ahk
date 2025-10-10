#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LOGTIME.ahk
#Include .\JET_SIGNATURE.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_COMMIT_ID extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {JET_SIGNATURE}
     */
    signLog{
        get {
            if(!this.HasProp("__signLog"))
                this.__signLog := JET_SIGNATURE(this.ptr + 0)
            return this.__signLog
        }
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    commitId {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
