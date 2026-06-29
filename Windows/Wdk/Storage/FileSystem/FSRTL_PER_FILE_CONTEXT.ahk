#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_PER_FILE_CONTEXT {
    #StructPack 8

    Links : IntPtr

    OwnerId : IntPtr

    InstanceId : IntPtr

    FreeCallback : IntPtr

}
