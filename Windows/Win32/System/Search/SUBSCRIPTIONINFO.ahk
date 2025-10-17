#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
    bMailNotification {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {BOOL}
     */
    bGleam {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    bChangesOnly {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    bNeedPassword {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
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
                this.__bstrUserName := BSTR(64, this)
            return this.__bstrUserName
        }
    }

    /**
     * @type {BSTR}
     */
    bstrPassword{
        get {
            if(!this.HasProp("__bstrPassword"))
                this.__bstrPassword := BSTR(72, this)
            return this.__bstrPassword
        }
    }

    /**
     * @type {BSTR}
     */
    bstrFriendlyName{
        get {
            if(!this.HasProp("__bstrFriendlyName"))
                this.__bstrFriendlyName := BSTR(80, this)
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

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 104
    }
}
