#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PARTITION_STYLE.ahk" { PARTITION_STYLE }

/**
 * Contains the disk partition information.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_partition_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_PARTITION_INFO {
    #StructPack 4


    struct _Mbr {
        Signature : UInt32

        CheckSum : UInt32

    }

    struct _Gpt {
        DiskId : Guid

    }

    /**
     * The size of this structure, in bytes.
     */
    SizeOfPartitionInfo : UInt32

    /**
     * The format of a partition.
     * 
     * For more information, see [PARTITION_STYLE](ne-winioctl-partition_style.md).
     */
    PartitionStyle : PARTITION_STYLE

    Mbr : DISK_PARTITION_INFO._Mbr

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: DISK_PARTITION_INFO._Gpt, offset: 8 })
        this.DeleteProp("__New")
    }
}
