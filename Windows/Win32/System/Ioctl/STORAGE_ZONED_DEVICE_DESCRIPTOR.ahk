#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ZONED_DEVICE_TYPES.ahk" { STORAGE_ZONED_DEVICE_TYPES }
#Import ".\STORAGE_ZONE_GROUP.ahk" { STORAGE_ZONE_GROUP }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_ZONE_TYPES.ahk" { STORAGE_ZONE_TYPES }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ZONED_DEVICE_DESCRIPTOR {
    #StructPack 8


    struct _ZoneAttributes {

        struct _SequentialRequiredZone {
            MaxOpenZoneCount : UInt32

            UnrestrictedRead : BOOLEAN

            Reserved : Int8[3]

        }

        struct _SequentialPreferredZone {
            OptimalOpenZoneCount : UInt32

            Reserved : UInt32

        }

        SequentialRequiredZone : STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes._SequentialRequiredZone

        static __New() {
            DefineProp(this.Prototype, 'SequentialPreferredZone', { type: STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes._SequentialPreferredZone, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Size : UInt32

    DeviceType : STORAGE_ZONED_DEVICE_TYPES

    ZoneCount : UInt32

    ZoneAttributes : STORAGE_ZONED_DEVICE_DESCRIPTOR._ZoneAttributes

    ZoneGroupCount : UInt32

    ZoneGroup : STORAGE_ZONE_GROUP[1]

}
