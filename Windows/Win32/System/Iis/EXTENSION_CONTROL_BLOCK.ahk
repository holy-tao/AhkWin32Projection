#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCONN.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class EXTENSION_CONTROL_BLOCK extends Win32Struct
{
    static sizeof => 272

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
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HCONN}
     */
    ConnID{
        get {
            if(!this.HasProp("__ConnID"))
                this.__ConnID := HCONN(this.ptr + 8)
            return this.__ConnID
        }
    }

    /**
     * @type {Integer}
     */
    dwHttpStatusCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    lpszLogData {
        get => StrGet(this.ptr + 20, 79, "UTF-16")
        set => StrPut(value, this.ptr + 20, 79, "UTF-16")
    }

    /**
     * @type {PSTR}
     */
    lpszMethod{
        get {
            if(!this.HasProp("__lpszMethod"))
                this.__lpszMethod := PSTR(this.ptr + 184)
            return this.__lpszMethod
        }
    }

    /**
     * @type {PSTR}
     */
    lpszQueryString{
        get {
            if(!this.HasProp("__lpszQueryString"))
                this.__lpszQueryString := PSTR(this.ptr + 192)
            return this.__lpszQueryString
        }
    }

    /**
     * @type {PSTR}
     */
    lpszPathInfo{
        get {
            if(!this.HasProp("__lpszPathInfo"))
                this.__lpszPathInfo := PSTR(this.ptr + 200)
            return this.__lpszPathInfo
        }
    }

    /**
     * @type {PSTR}
     */
    lpszPathTranslated{
        get {
            if(!this.HasProp("__lpszPathTranslated"))
                this.__lpszPathTranslated := PSTR(this.ptr + 208)
            return this.__lpszPathTranslated
        }
    }

    /**
     * @type {Integer}
     */
    cbTotalBytes {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    cbAvailable {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Pointer<Byte>}
     */
    lpbData {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {PSTR}
     */
    lpszContentType{
        get {
            if(!this.HasProp("__lpszContentType"))
                this.__lpszContentType := PSTR(this.ptr + 232)
            return this.__lpszContentType
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    GetServerVariable {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    WriteClient {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ReadClient {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ServerSupportFunction {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 272
    }
}
