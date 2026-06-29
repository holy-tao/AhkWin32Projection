#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_RESOURCE_LIST {
    #StructPack 8

    Count : UInt32

    List : IntPtr[1]

}
