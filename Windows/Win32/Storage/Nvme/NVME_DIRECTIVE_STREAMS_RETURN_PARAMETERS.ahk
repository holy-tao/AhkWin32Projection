#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains return parameters for the Streams Directive.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_streams_return_parameters
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_STREAMS_RETURN_PARAMETERS {
    #StructPack 4

    /**
     * The maximum streams limit.
     */
    MSL : UInt16

    /**
     * The number of available NVM Subsystem streams.
     */
    NSSA : UInt16

    /**
     * The number of NVM Subsystem streams that are open.
     */
    NSSO : UInt16

    Reserved0 : Int8[10]

    /**
     * The stream write size.
     */
    SWS : UInt32

    /**
     * The stream granularity size.
     */
    SGS : UInt16

    /**
     * The number of namespace streams that are allocated.
     */
    NSA : UInt16

    /**
     * The number of namespace streams that are open.
     */
    NSO : UInt16

    Reserved1 : Int8[6]

}
