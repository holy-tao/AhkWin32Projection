#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_BYTE_RANGE.ahk

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
     * @type {Pointer<HANDLE>}
     */
    FileHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    FragmentNameLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pFragmentName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pFragmentName1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
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
