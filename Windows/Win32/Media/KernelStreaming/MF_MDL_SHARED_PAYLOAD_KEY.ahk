#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct MF_MDL_SHARED_PAYLOAD_KEY {
    #StructPack 8


    struct _combined {
        pHandle : UInt32

        fHandle : UInt32

        uPayload : Int64

    }

    combined : MF_MDL_SHARED_PAYLOAD_KEY._combined

    static __New() {
        DefineProp(this.Prototype, 'GMDLHandle', { type: Guid, offset: 0 })
        this.DeleteProp("__New")
    }
}
