#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_receive_streams_operations
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATIONS{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_RETURN_PARAMETERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_GET_STATUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_ALLOCATE_RESOURCES => 3
}
