#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KBUGCHECK_CALLBACK_RECORD extends Win32Struct
{
    static sizeof => 64

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
     * @type {Pointer<PKBUGCHECK_CALLBACK_ROUTINE>}
     */
    CallbackRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    Component {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    Checksum {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }
}
