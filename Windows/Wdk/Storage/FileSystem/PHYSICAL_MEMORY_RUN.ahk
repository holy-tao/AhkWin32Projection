#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PHYSICAL_MEMORY_RUN {
    #StructPack 4

    BasePage : UInt32

    PageCount : UInt32

}
