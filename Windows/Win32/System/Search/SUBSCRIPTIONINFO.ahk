#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SUBSCRIPTIONINFO extends Win32Struct
{
    static sizeof => 104

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
     * @type {Integer}
     */
    schedule {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    customGroupCookie {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    pTrigger {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwRecurseLevels {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    fWebcrawlerFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {BOOL}
     */
    bMailNotification{
        get {
            if(!this.HasProp("__bMailNotification"))
                this.__bMailNotification := BOOL(this.ptr + 40)
            return this.__bMailNotification
        }
    }

    /**
     * @type {BOOL}
     */
    bGleam{
        get {
            if(!this.HasProp("__bGleam"))
                this.__bGleam := BOOL(this.ptr + 44)
            return this.__bGleam
        }
    }

    /**
     * @type {BOOL}
     */
    bChangesOnly{
        get {
            if(!this.HasProp("__bChangesOnly"))
                this.__bChangesOnly := BOOL(this.ptr + 48)
            return this.__bChangesOnly
        }
    }

    /**
     * @type {BOOL}
     */
    bNeedPassword{
        get {
            if(!this.HasProp("__bNeedPassword"))
                this.__bNeedPassword := BOOL(this.ptr + 52)
            return this.__bNeedPassword
        }
    }

    /**
     * @type {Integer}
     */
    fChannelFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {BSTR}
     */
    bstrUserName{
        get {
            if(!this.HasProp("__bstrUserName"))
                this.__bstrUserName := BSTR(this.ptr + 64)
            return this.__bstrUserName
        }
    }

    /**
     * @type {BSTR}
     */
    bstrPassword{
        get {
            if(!this.HasProp("__bstrPassword"))
                this.__bstrPassword := BSTR(this.ptr + 72)
            return this.__bstrPassword
        }
    }

    /**
     * @type {BSTR}
     */
    bstrFriendlyName{
        get {
            if(!this.HasProp("__bstrFriendlyName"))
                this.__bstrFriendlyName := BSTR(this.ptr + 80)
            return this.__bstrFriendlyName
        }
    }

    /**
     * @type {Integer}
     */
    dwMaxSizeKB {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    subType {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    fTaskFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 104
    }
}
