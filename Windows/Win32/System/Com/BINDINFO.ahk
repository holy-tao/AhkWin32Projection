#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include .\STGMEDIUM.ahk
#Include ..\..\Security\SECURITY_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BINDINFO extends Win32Struct
{
    static sizeof => 120

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
     * @type {STGMEDIUM}
     */
    stgmedData{
        get {
            if(!this.HasProp("__stgmedData"))
                this.__stgmedData := STGMEDIUM(this.ptr + 16)
            return this.__stgmedData
        }
    }

    /**
     * @type {Integer}
     */
    grfBindInfoF {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwBindVerb {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {PWSTR}
     */
    szCustomVerb{
        get {
            if(!this.HasProp("__szCustomVerb"))
                this.__szCustomVerb := PWSTR(this.ptr + 48)
            return this.__szCustomVerb
        }
    }

    /**
     * @type {Integer}
     */
    cbstgmedData {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    dwOptionsFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwCodePage {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {SECURITY_ATTRIBUTES}
     */
    securityAttributes{
        get {
            if(!this.HasProp("__securityAttributes"))
                this.__securityAttributes := SECURITY_ATTRIBUTES(this.ptr + 72)
            return this.__securityAttributes
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    iid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<IUnknown>}
     */
    pUnk {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 120
    }
}
