#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct INSTANCE_FULL_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    InstanceNameLength : UInt16

    InstanceNameBufferOffset : UInt16

    AltitudeLength : UInt16

    AltitudeBufferOffset : UInt16

    VolumeNameLength : UInt16

    VolumeNameBufferOffset : UInt16

    FilterNameLength : UInt16

    FilterNameBufferOffset : UInt16

}
