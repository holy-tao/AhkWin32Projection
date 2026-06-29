#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CACHE_MANAGER_CALLBACKS_EX {
    #StructPack 8

    Version : UInt16

    Size : UInt16

    Functions : IntPtr

}
