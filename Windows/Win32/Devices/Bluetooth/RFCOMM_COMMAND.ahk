#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RFCOMM_MSC_DATA.ahk" { RFCOMM_MSC_DATA }
#Import ".\RFCOMM_RPN_DATA.ahk" { RFCOMM_RPN_DATA }
#Import ".\RFCOMM_RLS_DATA.ahk" { RFCOMM_RLS_DATA }

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct RFCOMM_COMMAND {
    #StructPack 4


    struct _Data {
        MSC : RFCOMM_MSC_DATA

        static __New() {
            DefineProp(this.Prototype, 'RLS', { type: RFCOMM_RLS_DATA, offset: 0 })
            DefineProp(this.Prototype, 'RPN', { type: RFCOMM_RPN_DATA, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    CmdType : UInt32

    Data : RFCOMM_COMMAND._Data

}
