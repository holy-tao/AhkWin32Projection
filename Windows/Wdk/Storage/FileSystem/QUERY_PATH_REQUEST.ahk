#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\IO_SECURITY_CONTEXT.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class QUERY_PATH_REQUEST extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PathNameLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<IO_SECURITY_CONTEXT>}
     */
    SecurityContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    FilePathName {
        get => StrGet(this.ptr + 16, 0, "UTF-16")
        set => StrPut(value, this.ptr + 16, 0, "UTF-16")
    }
}
