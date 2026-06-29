#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_COUNTER_RESOURCE_LIST {
    #StructPack 8

    Count : UInt32

    Descriptors : IntPtr[1]

}
