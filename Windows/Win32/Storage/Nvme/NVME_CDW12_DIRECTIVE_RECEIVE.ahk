#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES.ahk" { NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES }

/**
 * Contains a parameter for allocating stream resources for the Directive Receive command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_receive
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_DIRECTIVE_RECEIVE {
    #StructPack 4

    /**
     * A [NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES](ns-nvme-nvme_cdw12_directive_receive_streams_allocate_resources.md) structure that specifies the number of namespace streams requested.
     */
    AllocateResources : NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
