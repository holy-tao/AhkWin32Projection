#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_BOUND_FORWARDER_REF {
    #StructPack 4

    TimeDateStamp : UInt32

    OffsetModuleName : UInt16

    Reserved : UInt16

}
