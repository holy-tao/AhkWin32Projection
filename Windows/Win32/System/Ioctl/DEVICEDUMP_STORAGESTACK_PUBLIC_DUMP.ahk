#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICEDUMP_STRUCTURE_VERSION.ahk" { DEVICEDUMP_STRUCTURE_VERSION }
#Import ".\DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD.ahk" { DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_STORAGESTACK_PUBLIC_DUMP {
    #StructPack 8

    Descriptor : DEVICEDUMP_STRUCTURE_VERSION

    dwReasonForCollection : UInt32

    cDriverName : Int8[16]

    uiNumRecords : UInt32

    RecordArray : DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD[1]

}
