#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMP_MESSAGE {
    #StructPack 4


    struct _Data {
        Data32 : UInt32[1]

        static __New() {
            DefineProp(this.Prototype, 'Data16', { type: UInt16[2], offset: 0 })
            DefineProp(this.Prototype, 'Data8', { type: Int8[4], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Header : ICMP_HEADER

    Data : ICMP_MESSAGE._Data

}
