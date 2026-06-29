#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MP_DEVICE_DATA_SET_RANGE.ahk" { MP_DEVICE_DATA_SET_RANGE }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct DSM_NOTIFICATION_REQUEST_BLOCK {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    NotifyFlags : UInt32

    DataSetProfile : UInt32

    Reserved : UInt32[3]

    DataSetRangesCount : UInt32

    DataSetRanges : MP_DEVICE_DATA_SET_RANGE[1]

}
