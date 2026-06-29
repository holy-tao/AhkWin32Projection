#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_MEMORY_PARTITION_INFORMATION {
    #StructPack 8


    struct _Flags {
        NoCrossPartitionAccess : Int8

        Spare : Int8[3]

        static __New() {
            DefineProp(this.Prototype, 'AllFlags', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    OwnerPartitionHandle : IntPtr

    Flags : FILE_MEMORY_PARTITION_INFORMATION._Flags

}
