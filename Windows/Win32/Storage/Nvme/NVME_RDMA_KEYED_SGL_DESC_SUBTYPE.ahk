#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_RDMA_KEYED_SGL_DESC_SUBTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NvmeRdmaKeyedSglDescSubtypeInvalidate => 15
}
