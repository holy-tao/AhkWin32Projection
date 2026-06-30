#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SUBSCRIPTIONTYPE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\SUBSCRIPTIONSCHEDULE.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class SUBSCRIPTIONINFO extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fUpdateFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {SUBSCRIPTIONSCHEDULE}
     */
    schedule {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    customGroupCookie {
        get {
            if(!this.HasProp("__customGroupCookie"))
                this.__customGroupCookie := Guid(12, this)
            return this.__customGroupCookie
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pTrigger {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwRecurseLevels {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    fWebcrawlerFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    bMailNotification {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    bGleam {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {BOOL}
     */
    bChangesOnly {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {BOOL}
     */
    bNeedPassword {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    fChannelFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {BSTR}
     */
    bstrUserName {
        get {
            if(!this.HasProp("__bstrUserName"))
                this.__bstrUserName := BSTR(72, this)
            return this.__bstrUserName
        }
    }

    /**
     * @type {BSTR}
     */
    bstrPassword {
        get {
            if(!this.HasProp("__bstrPassword"))
                this.__bstrPassword := BSTR(80, this)
            return this.__bstrPassword
        }
    }

    /**
     * @type {BSTR}
     */
    bstrFriendlyName {
        get {
            if(!this.HasProp("__bstrFriendlyName"))
                this.__bstrFriendlyName := BSTR(88, this)
            return this.__bstrFriendlyName
        }
    }

    /**
     * @type {Integer}
     */
    dwMaxSizeKB {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {SUBSCRIPTIONTYPE}
     */
    subType {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    fTaskFlags {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 112
    }
}
