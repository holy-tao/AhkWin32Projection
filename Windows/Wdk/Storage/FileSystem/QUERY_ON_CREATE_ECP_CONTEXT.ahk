#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_ON_CREATE_ECP_CONTEXT {
    #StructPack 8

    RequestedClasses : UInt32

    ClassesProcessed : UInt32

    ClassesWithErrors : UInt32

    ClassesWithNoData : UInt32

    StatInformation : IntPtr

    LxInformation : IntPtr

    EaInformation : IntPtr

}
