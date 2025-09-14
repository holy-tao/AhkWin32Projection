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
    static sizeof => 28

    static packingSize => 1

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
                this.__logtimeCreate := JET_LOGTIME(this.ptr + 4)
            return this.__logtimeCreate
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szComputerName{
        get {
            if(!this.HasProp("__szComputerNameProxyArray"))
                this.__szComputerNameProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__szComputerNameProxyArray
        }
    }
}
