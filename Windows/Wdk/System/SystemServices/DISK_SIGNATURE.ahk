#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DISK_SIGNATURE {
    #StructPack 4


    struct _Mbr {
        Signature : UInt32

        CheckSum : UInt32

    }

    struct _Gpt {
        DiskId : Guid

    }

    PartitionStyle : UInt32

    Mbr : DISK_SIGNATURE._Mbr

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: DISK_SIGNATURE._Gpt, offset: 4 })
        this.DeleteProp("__New")
    }
}
