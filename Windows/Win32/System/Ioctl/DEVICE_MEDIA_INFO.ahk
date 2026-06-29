#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_MEDIA_TYPE.ahk" { STORAGE_MEDIA_TYPE }
#Import "..\..\Storage\FileSystem\STORAGE_BUS_TYPE.ahk" { STORAGE_BUS_TYPE }

/**
 * Provides information about the media supported by a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_media_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_MEDIA_INFO {
    #StructPack 8


    struct _DeviceSpecific {

        struct _DiskInfo {
            Cylinders : Int64

            MediaType : STORAGE_MEDIA_TYPE

            TracksPerCylinder : UInt32

            SectorsPerTrack : UInt32

            BytesPerSector : UInt32

            NumberMediaSides : UInt32

            MediaCharacteristics : UInt32

        }

        struct _RemovableDiskInfo {
            Cylinders : Int64

            MediaType : STORAGE_MEDIA_TYPE

            TracksPerCylinder : UInt32

            SectorsPerTrack : UInt32

            BytesPerSector : UInt32

            NumberMediaSides : UInt32

            MediaCharacteristics : UInt32

        }

        struct _TapeInfo {

            struct _BusSpecificData {

                struct _ScsiInformation {
                    MediumType : Int8

                    DensityCode : Int8

                }

                ScsiInformation : DEVICE_MEDIA_INFO._DeviceSpecific._TapeInfo._BusSpecificData._ScsiInformation

            }

            MediaType : STORAGE_MEDIA_TYPE

            MediaCharacteristics : UInt32

            CurrentBlockSize : UInt32

            BusType : STORAGE_BUS_TYPE

            BusSpecificData : DEVICE_MEDIA_INFO._DeviceSpecific._TapeInfo._BusSpecificData

        }

        DiskInfo : DEVICE_MEDIA_INFO._DeviceSpecific._DiskInfo

        static __New() {
            DefineProp(this.Prototype, 'RemovableDiskInfo', { type: DEVICE_MEDIA_INFO._DeviceSpecific._RemovableDiskInfo, offset: 0 })
            DefineProp(this.Prototype, 'TapeInfo', { type: DEVICE_MEDIA_INFO._DeviceSpecific._TapeInfo, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * A union that contains the following members.
     */
    DeviceSpecific : DEVICE_MEDIA_INFO._DeviceSpecific

}
