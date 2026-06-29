#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct KCRM_MARSHAL_HEADER {
    #StructPack 4

    VersionMajor : UInt32

    VersionMinor : UInt32

    NumProtocols : UInt32

    Unused : UInt32

}
