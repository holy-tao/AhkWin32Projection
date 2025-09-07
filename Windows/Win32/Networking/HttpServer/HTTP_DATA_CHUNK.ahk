#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_BYTE_RANGE.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents an individual block of data either in memory, in a file, or in the HTTP Server API response-fragment cache.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_data_chunk
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_DATA_CHUNK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type of data store. This member can be one of the values from the <b>HTTP_DATA_CHUNK_TYPE</b> enumeration.
     * @type {Integer}
     */
    DataChunkType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BufferLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HTTP_BYTE_RANGE}
     */
    ByteRange{
        get {
            if(!this.HasProp("__ByteRange"))
                this.__ByteRange := HTTP_BYTE_RANGE(this.ptr + 8)
            return this.__ByteRange
        }
    }

    /**
     * @type {HANDLE}
     */
    FileHandle{
        get {
            if(!this.HasProp("__FileHandle"))
                this.__FileHandle := HANDLE(this.ptr + 24)
            return this.__FileHandle
        }
    }

    /**
     * @type {Integer}
     */
    FragmentNameLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pFragmentName{
        get {
            if(!this.HasProp("__pFragmentName"))
                this.__pFragmentName := PWSTR(this.ptr + 16)
            return this.__pFragmentName
        }
    }

    /**
     * @type {PWSTR}
     */
    pFragmentName1{
        get {
            if(!this.HasProp("__pFragmentName1"))
                this.__pFragmentName1 := PWSTR(this.ptr + 24)
            return this.__pFragmentName1
        }
    }

    /**
     * @type {Integer}
     */
    TrailerCount {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Pointer<HTTP_UNKNOWN_HEADER>}
     */
    pTrailers {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
