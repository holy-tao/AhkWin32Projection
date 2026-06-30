#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include StructuredStorage\IStorage.ahk
#Include ..\..\Security\SECURITY_ATTRIBUTES.ahk
#Include ..\..\Foundation\HGLOBAL.ahk
#Include .\STGMEDIUM.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk
#Include .\IUnknown.ahk
#Include .\IStream.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class BINDINFO extends Win32Struct {
    static sizeof => 128

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
    szExtraInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {STGMEDIUM}
     */
    stgmedData {
        get {
            if(!this.HasProp("__stgmedData"))
                this.__stgmedData := STGMEDIUM(16, this)
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
    szCustomVerb {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
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
    securityAttributes {
        get {
            if(!this.HasProp("__securityAttributes"))
                this.__securityAttributes := SECURITY_ATTRIBUTES(72, this)
            return this.__securityAttributes
        }
    }

    /**
     * @type {Guid}
     */
    iid {
        get {
            if(!this.HasProp("__iid"))
                this.__iid := Guid(96, this)
            return this.__iid
        }
    }

    /**
     * @type {IUnknown}
     */
    pUnk {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 128
    }
}
