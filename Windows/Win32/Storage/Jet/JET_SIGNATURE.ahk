#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JET_LOGTIME.ahk

/**
 * Learn more about: JET_SIGNATURE Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-signature-structure
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_SIGNATURE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulRandom {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {JET_LOGTIME}
     */
    logtimeCreate{
        get {
            if(!this.HasProp("__logtimeCreate"))
                this.__logtimeCreate := JET_LOGTIME(this.ptr + 8)
            return this.__logtimeCreate
        }
    }

    /**
     * @type {String}
     */
    szComputerName {
        get => StrGet(this.ptr + 16, 15, "UTF-16")
        set => StrPut(value, this.ptr + 16, 15, "UTF-16")
    }
}
