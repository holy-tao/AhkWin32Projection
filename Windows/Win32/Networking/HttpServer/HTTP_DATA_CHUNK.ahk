#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_BYTE_RANGE.ahk
#Include .\HTTP_WINHTTP_FAST_FORWARDING_DATA.ahk

/**
 * Represents an individual block of data either in memory, in a file, or in the HTTP Server API response-fragment cache.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_data_chunk
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_DATA_CHUNK extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type of data store. This member can be one of the values from the <b>HTTP_DATA_CHUNK_TYPE</b> enumeration.
     * @type {Integer}
     */
    DataChunkType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _FromMemory extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        pBuffer {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        BufferLength {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _FromFileHandle extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HTTP_BYTE_RANGE}
         */
        ByteRange{
            get {
                if(!this.HasProp("__ByteRange"))
                    this.__ByteRange := HTTP_BYTE_RANGE(this.ptr + 0)
                return this.__ByteRange
            }
        }
    
        /**
         * @type {Pointer<Void>}
         */
        FileHandle {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _FromFragmentCache extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FragmentNameLength {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pFragmentName {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _FromFragmentCacheEx extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HTTP_BYTE_RANGE}
         */
        ByteRange{
            get {
                if(!this.HasProp("__ByteRange"))
                    this.__ByteRange := HTTP_BYTE_RANGE(this.ptr + 0)
                return this.__ByteRange
            }
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pFragmentName {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _Trailers extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        TrailerCount {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Pointer<HTTP_UNKNOWN_HEADER>}
         */
        pTrailers {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _FromWinHttpFastForwarding extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {HTTP_WINHTTP_FAST_FORWARDING_DATA}
         */
        WhFastForwardingData{
            get {
                if(!this.HasProp("__WhFastForwardingData"))
                    this.__WhFastForwardingData := HTTP_WINHTTP_FAST_FORWARDING_DATA(this.ptr + 0)
                return this.__WhFastForwardingData
            }
        }
    
    }

    /**
     * @type {_FromMemory}
     */
    FromMemory{
        get {
            if(!this.HasProp("__FromMemory"))
                this.__FromMemory := %this.__Class%._FromMemory(this.ptr + 8)
            return this.__FromMemory
        }
    }

    /**
     * @type {_FromFileHandle}
     */
    FromFileHandle{
        get {
            if(!this.HasProp("__FromFileHandle"))
                this.__FromFileHandle := %this.__Class%._FromFileHandle(this.ptr + 8)
            return this.__FromFileHandle
        }
    }

    /**
     * @type {_FromFragmentCache}
     */
    FromFragmentCache{
        get {
            if(!this.HasProp("__FromFragmentCache"))
                this.__FromFragmentCache := %this.__Class%._FromFragmentCache(this.ptr + 8)
            return this.__FromFragmentCache
        }
    }

    /**
     * @type {_FromFragmentCacheEx}
     */
    FromFragmentCacheEx{
        get {
            if(!this.HasProp("__FromFragmentCacheEx"))
                this.__FromFragmentCacheEx := %this.__Class%._FromFragmentCacheEx(this.ptr + 8)
            return this.__FromFragmentCacheEx
        }
    }

    /**
     * @type {_Trailers}
     */
    Trailers{
        get {
            if(!this.HasProp("__Trailers"))
                this.__Trailers := %this.__Class%._Trailers(this.ptr + 8)
            return this.__Trailers
        }
    }

    /**
     * @type {_FromWinHttpFastForwarding}
     */
    FromWinHttpFastForwarding{
        get {
            if(!this.HasProp("__FromWinHttpFastForwarding"))
                this.__FromWinHttpFastForwarding := %this.__Class%._FromWinHttpFastForwarding(this.ptr + 8)
            return this.__FromWinHttpFastForwarding
        }
    }
}
