#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class uCLSSPEC extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    tyspec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pFileExt{
        get {
            if(!this.HasProp("__pFileExt"))
                this.__pFileExt := PWSTR(this.ptr + 8)
            return this.__pFileExt
        }
    }

    /**
     * @type {PWSTR}
     */
    pMimeType{
        get {
            if(!this.HasProp("__pMimeType"))
                this.__pMimeType := PWSTR(this.ptr + 8)
            return this.__pMimeType
        }
    }

    /**
     * @type {PWSTR}
     */
    pProgId{
        get {
            if(!this.HasProp("__pProgId"))
                this.__pProgId := PWSTR(this.ptr + 8)
            return this.__pProgId
        }
    }

    /**
     * @type {PWSTR}
     */
    pFileName{
        get {
            if(!this.HasProp("__pFileName"))
                this.__pFileName := PWSTR(this.ptr + 8)
            return this.__pFileName
        }
    }

    /**
     * @type {PWSTR}
     */
    pPackageName{
        get {
            if(!this.HasProp("__pPackageName"))
                this.__pPackageName := PWSTR(this.ptr + 8)
            return this.__pPackageName
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    PolicyId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ObjectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
