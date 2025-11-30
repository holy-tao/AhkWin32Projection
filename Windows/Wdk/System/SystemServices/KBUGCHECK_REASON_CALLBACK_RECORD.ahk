#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KBUGCHECK_REASON_CALLBACK_RECORD extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    Entry{
        get {
            if(!this.HasProp("__Entry"))
                this.__Entry := LIST_ENTRY(0, this)
            return this.__Entry
        }
    }

    /**
     * @type {Pointer<PKBUGCHECK_REASON_CALLBACK_ROUTINE>}
     */
    CallbackRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Component {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    Checksum {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }
}
