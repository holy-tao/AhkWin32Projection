#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the identifiers of streams that are currently open.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_streams_get_status_data
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_STREAMS_GET_STATUS_DATA {
    #StructPack 2

    /**
     * The number of currently open streams.
     */
    OpenStreamCount : UInt16

    /**
     * An array of stream IDs that indicate which streams are currently open.
     * 
     * The array is of size **NVME_STREAMS_GET_STATUS_MAX_IDS**.
     */
    StreamIdentifiers : UInt16[65535]

}
