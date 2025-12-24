#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES.ahk

/**
 * Contains a parameter for allocating stream resources for the Directive Receive command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_receive
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW12_DIRECTIVE_RECEIVE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A [NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES](ns-nvme-nvme_cdw12_directive_receive_streams_allocate_resources.md) structure that specifies the number of namespace streams requested.
     * @type {NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES}
     */
    AllocateResources{
        get {
            if(!this.HasProp("__AllocateResources"))
                this.__AllocateResources := NVME_CDW12_DIRECTIVE_RECEIVE_STREAMS_ALLOCATE_RESOURCES(0, this)
            return this.__AllocateResources
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
