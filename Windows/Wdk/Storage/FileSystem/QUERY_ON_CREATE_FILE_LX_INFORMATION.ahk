#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_ON_CREATE_FILE_LX_INFORMATION {
    #StructPack 4

    EffectiveAccess : UInt32

    LxFlags : UInt32

    LxUid : UInt32

    LxGid : UInt32

    LxMode : UInt32

    LxDeviceIdMajor : UInt32

    LxDeviceIdMinor : UInt32

}
