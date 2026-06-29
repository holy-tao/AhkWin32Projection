#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_AGGREGATE_STANDARD_INFORMATION {
    #StructPack 4


    struct _Type {

        struct _MiniFilter {
            Flags : UInt32

            FrameID : UInt32

            NumberOfInstances : UInt32

            FilterNameLength : UInt16

            FilterNameBufferOffset : UInt16

            FilterAltitudeLength : UInt16

            FilterAltitudeBufferOffset : UInt16

        }

        struct _LegacyFilter {
            Flags : UInt32

            FilterNameLength : UInt16

            FilterNameBufferOffset : UInt16

            FilterAltitudeLength : UInt16

            FilterAltitudeBufferOffset : UInt16

        }

        MiniFilter : FILTER_AGGREGATE_STANDARD_INFORMATION._Type._MiniFilter

        static __New() {
            DefineProp(this.Prototype, 'LegacyFilter', { type: FILTER_AGGREGATE_STANDARD_INFORMATION._Type._LegacyFilter, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    NextEntryOffset : UInt32

    Flags : UInt32

    Type : FILTER_AGGREGATE_STANDARD_INFORMATION._Type

}
