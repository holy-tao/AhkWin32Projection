#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_AMLI_BAD_IO_ADDRESS_LIST {
    #StructPack 8

    BadAddrBegin : UInt32

    BadAddrSize : UInt32

    OSVersionTrigger : UInt32

    IOHandler : IntPtr

}
