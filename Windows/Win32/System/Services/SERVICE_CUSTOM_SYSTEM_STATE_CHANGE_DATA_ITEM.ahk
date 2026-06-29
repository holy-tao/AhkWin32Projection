#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_TRIGGER_CUSTOM_STATE_ID.ahk" { SERVICE_TRIGGER_CUSTOM_STATE_ID }

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM {
    #StructPack 4


    struct _u {

        struct _s {
            DataOffset : UInt32

            Data : Int8[1]

        }

        CustomStateId : SERVICE_TRIGGER_CUSTOM_STATE_ID

        static __New() {
            DefineProp(this.Prototype, 's', { type: SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM._u._s, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    u : SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM._u

}
