#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_PARTIAL_RESOURCE_LIST {
    #StructPack 8

    Version : UInt16

    Revision : UInt16

    Count : UInt32

    PartialDescriptors : IntPtr[1]

}
