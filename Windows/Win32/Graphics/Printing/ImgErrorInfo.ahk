#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class ImgErrorInfo extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    description{
        get {
            if(!this.HasProp("__description"))
                this.__description := BSTR(0, this)
            return this.__description
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    helpContext {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BSTR}
     */
    helpFile{
        get {
            if(!this.HasProp("__helpFile"))
                this.__helpFile := BSTR(24, this)
            return this.__helpFile
        }
    }

    /**
     * @type {BSTR}
     */
    source{
        get {
            if(!this.HasProp("__source"))
                this.__source := BSTR(32, this)
            return this.__source
        }
    }

    /**
     * @type {BSTR}
     */
    devDescription{
        get {
            if(!this.HasProp("__devDescription"))
                this.__devDescription := BSTR(40, this)
            return this.__devDescription
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    errorID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cUserParameters {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<BSTR>}
     */
    aUserParameters {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {BSTR}
     */
    userFallback{
        get {
            if(!this.HasProp("__userFallback"))
                this.__userFallback := BSTR(72, this)
            return this.__userFallback
        }
    }

    /**
     * @type {Integer}
     */
    exceptionID {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
