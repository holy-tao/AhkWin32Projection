#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_FILESYSTEM_TYPE.ahk" { FLT_FILESYSTEM_TYPE }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct INSTANCE_AGGREGATE_STANDARD_INFORMATION {
    #StructPack 4


    struct _Type {

        struct _MiniFilter {
            Flags : UInt32

            FrameID : UInt32

            VolumeFileSystemType : FLT_FILESYSTEM_TYPE

            InstanceNameLength : UInt16

            InstanceNameBufferOffset : UInt16

            AltitudeLength : UInt16

            AltitudeBufferOffset : UInt16

            VolumeNameLength : UInt16

            VolumeNameBufferOffset : UInt16

            FilterNameLength : UInt16

            FilterNameBufferOffset : UInt16

            SupportedFeatures : UInt32

        }

        struct _LegacyFilter {
            Flags : UInt32

            AltitudeLength : UInt16

            AltitudeBufferOffset : UInt16

            VolumeNameLength : UInt16

            VolumeNameBufferOffset : UInt16

            FilterNameLength : UInt16

            FilterNameBufferOffset : UInt16

            SupportedFeatures : UInt32

        }

        MiniFilter : INSTANCE_AGGREGATE_STANDARD_INFORMATION._Type._MiniFilter

        static __New() {
            DefineProp(this.Prototype, 'LegacyFilter', { type: INSTANCE_AGGREGATE_STANDARD_INFORMATION._Type._LegacyFilter, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    NextEntryOffset : UInt32

    Flags : UInt32

    Type : INSTANCE_AGGREGATE_STANDARD_INFORMATION._Type

}
