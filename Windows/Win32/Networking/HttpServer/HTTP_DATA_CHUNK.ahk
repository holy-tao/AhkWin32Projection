#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import ".\HTTP_DATA_CHUNK_TYPE.ahk" { HTTP_DATA_CHUNK_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_WINHTTP_FAST_FORWARDING_DATA.ahk" { HTTP_WINHTTP_FAST_FORWARDING_DATA }
#Import ".\HTTP_BYTE_RANGE.ahk" { HTTP_BYTE_RANGE }

/**
 * Represents an individual block of data either in memory, in a file, or in the HTTP Server API response-fragment cache.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_data_chunk
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_DATA_CHUNK {
    #StructPack 8


    struct _FromMemory {
        pBuffer : IntPtr

        BufferLength : UInt32

    }

    struct _FromFileHandle {
        ByteRange : HTTP_BYTE_RANGE

        FileHandle : HANDLE

    }

    struct _FromFragmentCache {
        FragmentNameLength : UInt16

        pFragmentName : PWSTR

    }

    struct _FromFragmentCacheEx {
        ByteRange : HTTP_BYTE_RANGE

        pFragmentName : PWSTR

    }

    struct _Trailers {
        TrailerCount : UInt16

        pTrailers : HTTP_UNKNOWN_HEADER.Ptr

    }

    struct _FromWinHttpFastForwarding {
        WhFastForwardingData : HTTP_WINHTTP_FAST_FORWARDING_DATA

    }

    /**
     * Type of data store. This member can be one of the values from the <b>HTTP_DATA_CHUNK_TYPE</b> enumeration.
     */
    DataChunkType : HTTP_DATA_CHUNK_TYPE

    FromMemory : HTTP_DATA_CHUNK._FromMemory

    static __New() {
        DefineProp(this.Prototype, 'FromFileHandle', { type: HTTP_DATA_CHUNK._FromFileHandle, offset: 8 })
        DefineProp(this.Prototype, 'FromFragmentCache', { type: HTTP_DATA_CHUNK._FromFragmentCache, offset: 8 })
        DefineProp(this.Prototype, 'FromFragmentCacheEx', { type: HTTP_DATA_CHUNK._FromFragmentCacheEx, offset: 8 })
        DefineProp(this.Prototype, 'Trailers', { type: HTTP_DATA_CHUNK._Trailers, offset: 8 })
        DefineProp(this.Prototype, 'FromWinHttpFastForwarding', { type: HTTP_DATA_CHUNK._FromWinHttpFastForwarding, offset: 8 })
        this.DeleteProp("__New")
    }
}
