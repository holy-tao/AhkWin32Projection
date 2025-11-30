#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class COUNTED_REASON_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ResourceFileName{
        get {
            if(!this.HasProp("__ResourceFileName"))
                this.__ResourceFileName := UNICODE_STRING(8, this)
            return this.__ResourceFileName
        }
    }

    /**
     * @type {Integer}
     */
    ResourceReasonId {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    StringCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    ReasonStrings {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {UNICODE_STRING}
     */
    SimpleString{
        get {
            if(!this.HasProp("__SimpleString"))
                this.__SimpleString := UNICODE_STRING(8, this)
            return this.__SimpleString
        }
    }
}
