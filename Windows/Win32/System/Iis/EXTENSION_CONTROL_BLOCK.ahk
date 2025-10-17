#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    ConnID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
    lpszMethod {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {PSTR}
     */
    lpszQueryString {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {PSTR}
     */
    lpszPathInfo {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {PSTR}
     */
    lpszPathTranslated {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
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
    lpszContentType {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<PFN_IIS_GETSERVERVARIABLE>}
     */
    GetServerVariable {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<PFN_IIS_WRITECLIENT>}
     */
    WriteClient {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<PFN_IIS_READCLIENT>}
     */
    ReadClient {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<PFN_IIS_SERVERSUPPORTFUNCTION>}
     */
    ServerSupportFunction {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 272
    }
}
