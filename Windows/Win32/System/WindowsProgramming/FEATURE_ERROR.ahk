#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * This structure is intended for infrastructure use only.
 * @see https://docs.microsoft.com/windows/win32/api//featurestagingapi/ns-featurestagingapi-feature_error
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class FEATURE_ERROR extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Infrastructure use only.
     * @type {HRESULT}
     */
    hr {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    lineNumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    file{
        get {
            if(!this.HasProp("__file"))
                this.__file := PSTR(this.ptr + 8)
            return this.__file
        }
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    process{
        get {
            if(!this.HasProp("__process"))
                this.__process := PSTR(this.ptr + 16)
            return this.__process
        }
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    module{
        get {
            if(!this.HasProp("__module"))
                this.__module := PSTR(this.ptr + 24)
            return this.__module
        }
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    callerReturnAddressOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    callerModule{
        get {
            if(!this.HasProp("__callerModule"))
                this.__callerModule := PSTR(this.ptr + 40)
            return this.__callerModule
        }
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    message{
        get {
            if(!this.HasProp("__message"))
                this.__message := PSTR(this.ptr + 48)
            return this.__message
        }
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    originLineNumber {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    originFile{
        get {
            if(!this.HasProp("__originFile"))
                this.__originFile := PSTR(this.ptr + 64)
            return this.__originFile
        }
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    originModule{
        get {
            if(!this.HasProp("__originModule"))
                this.__originModule := PSTR(this.ptr + 72)
            return this.__originModule
        }
    }

    /**
     * Infrastructure use only.
     * @type {Integer}
     */
    originCallerReturnAddressOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    originCallerModule{
        get {
            if(!this.HasProp("__originCallerModule"))
                this.__originCallerModule := PSTR(this.ptr + 88)
            return this.__originCallerModule
        }
    }

    /**
     * Infrastructure use only.
     * @type {PSTR}
     */
    originName{
        get {
            if(!this.HasProp("__originName"))
                this.__originName := PSTR(this.ptr + 96)
            return this.__originName
        }
    }
}
