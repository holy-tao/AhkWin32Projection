#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\BOOL.ahk
#Include .\REMSECURITY_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class RemBINDINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    szExtraInfo{
        get {
            if(!this.HasProp("__szExtraInfo"))
                this.__szExtraInfo := PWSTR(this.ptr + 8)
            return this.__szExtraInfo
        }
    }

    /**
     * @type {Integer}
     */
    grfBindInfoF {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwBindVerb {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {PWSTR}
     */
    szCustomVerb{
        get {
            if(!this.HasProp("__szCustomVerb"))
                this.__szCustomVerb := PWSTR(this.ptr + 24)
            return this.__szCustomVerb
        }
    }

    /**
     * @type {Integer}
     */
    cbstgmedData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwOptionsFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwCodePage {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {REMSECURITY_ATTRIBUTES}
     */
    securityAttributes{
        get {
            if(!this.HasProp("__securityAttributes"))
                this.__securityAttributes := REMSECURITY_ATTRIBUTES(this.ptr + 48)
            return this.__securityAttributes
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    iid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
