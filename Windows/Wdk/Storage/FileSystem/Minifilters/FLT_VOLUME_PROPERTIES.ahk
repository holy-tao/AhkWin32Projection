#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_VOLUME_PROPERTIES {
    #StructPack 8

    DeviceType : UInt32

    DeviceCharacteristics : UInt32

    DeviceObjectFlags : UInt32

    AlignmentRequirement : UInt32

    SectorSize : UInt16

    Flags : UInt16

    FileSystemDriverName : IntPtr

    FileSystemDeviceName : IntPtr

    RealDeviceName : IntPtr

}
