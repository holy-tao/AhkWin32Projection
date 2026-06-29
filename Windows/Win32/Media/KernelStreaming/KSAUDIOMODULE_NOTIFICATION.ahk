#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOMODULE_NOTIFICATION {
    #StructPack 8


    struct _ProviderId {
        DeviceId : Guid

        ClassId : Guid

        InstanceId : UInt32

        Reserved : UInt32

    }

    ProviderId : KSAUDIOMODULE_NOTIFICATION._ProviderId

    static __New() {
        DefineProp(this.Prototype, 'Alignment', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
