#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class SYSTEM_BASICPROCESS_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NextEntryOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    UniqueProcessId{
        get {
            if(!this.HasProp("__UniqueProcessId"))
                this.__UniqueProcessId := HANDLE(8, this)
            return this.__UniqueProcessId
        }
    }

    /**
     * @type {HANDLE}
     */
    InheritedFromUniqueProcessId{
        get {
            if(!this.HasProp("__InheritedFromUniqueProcessId"))
                this.__InheritedFromUniqueProcessId := HANDLE(16, this)
            return this.__InheritedFromUniqueProcessId
        }
    }

    /**
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ImageName{
        get {
            if(!this.HasProp("__ImageName"))
                this.__ImageName := UNICODE_STRING(32, this)
            return this.__ImageName
        }
    }
}
