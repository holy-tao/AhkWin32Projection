#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class ImgErrorInfo extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    description {
        get {
            if(!this.HasProp("__description"))
                this.__description := BSTR(0, this)
            return this.__description
        }
    }

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(8, this)
            return this.__guid
        }
    }

    /**
     * @type {Integer}
     */
    helpContext {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BSTR}
     */
    helpFile {
        get {
            if(!this.HasProp("__helpFile"))
                this.__helpFile := BSTR(32, this)
            return this.__helpFile
        }
    }

    /**
     * @type {BSTR}
     */
    source {
        get {
            if(!this.HasProp("__source"))
                this.__source := BSTR(40, this)
            return this.__source
        }
    }

    /**
     * @type {BSTR}
     */
    devDescription {
        get {
            if(!this.HasProp("__devDescription"))
                this.__devDescription := BSTR(48, this)
            return this.__devDescription
        }
    }

    /**
     * @type {Guid}
     */
    errorID {
        get {
            if(!this.HasProp("__errorID"))
                this.__errorID := Guid(56, this)
            return this.__errorID
        }
    }

    /**
     * @type {Integer}
     */
    cUserParameters {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    aUserParameters {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {BSTR}
     */
    userFallback {
        get {
            if(!this.HasProp("__userFallback"))
                this.__userFallback := BSTR(88, this)
            return this.__userFallback
        }
    }

    /**
     * @type {Integer}
     */
    exceptionID {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
