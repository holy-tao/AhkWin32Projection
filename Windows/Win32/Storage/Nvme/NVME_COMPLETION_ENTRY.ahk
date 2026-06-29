#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_COMMAND_STATUS.ahk" { NVME_COMMAND_STATUS }

/**
 * Specifies an entry in the Completion Queue that is 16 bytes in size.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMPLETION_ENTRY {
    #StructPack 4


    struct _DW2 {
        SQHD : UInt16

        SQID : UInt16

        static __New() {
            DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _DW3 {
        CID : UInt16

        Status : NVME_COMMAND_STATUS

        static __New() {
            DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The contents of Dword 0 contain command specific information.
     * 
     * If a command uses Dword 0, then the definition of this Dword is contained within the associated command definition. If a command does not use Dword 0, then this field is reserved.
     */
    DW0 : UInt32

    DW1 : UInt32

    /**
     * A union that contains the information in Dword 2.
     */
    DW2 : NVME_COMPLETION_ENTRY._DW2

    /**
     * A union that contains the information in Dword 3.
     */
    DW3 : NVME_COMPLETION_ENTRY._DW3

}
