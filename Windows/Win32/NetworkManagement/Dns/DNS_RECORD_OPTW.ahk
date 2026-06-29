#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_RECORD_FLAGS.ahk" { DNS_RECORD_FLAGS }
#Import ".\DNS_HEADER_EXT.ahk" { DNS_HEADER_EXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_OPT_DATA.ahk" { DNS_OPT_DATA }
#Import ".\DNS_RECORDW.ahk" { DNS_RECORDW }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_RECORD_OPTW {
    #StructPack 8


    struct _Flags {
        DW : UInt32

        static __New() {
            DefineProp(this.Prototype, 'S', { type: DNS_RECORD_FLAGS, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Data {
        OPT : DNS_OPT_DATA

        static __New() {
            DefineProp(this.Prototype, 'Opt1', { type: DNS_OPT_DATA, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    pNext : DNS_RECORDW.Ptr

    pName : PWSTR

    wType : UInt16

    wDataLength : UInt16

    Flags : DNS_RECORD_OPTW._Flags

    ExtHeader : DNS_HEADER_EXT

    wPayloadSize : UInt16

    wReserved : UInt16

    Data : DNS_RECORD_OPTW._Data

}
