#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WINDOWS_IAS_SET {
    #StructPack 4


    struct _irdaAttribute {

        struct _irdaAttribOctetSeq {
            Len : UInt16

            OctetSeq : Int8[1024]

        }

        struct _irdaAttribUsrStr {
            Len : Int8

            CharSet : Int8

            UsrStr : Int8[256]

        }

        irdaAttribInt : Int32

        static __New() {
            DefineProp(this.Prototype, 'irdaAttribOctetSeq', { type: WINDOWS_IAS_SET._irdaAttribute._irdaAttribOctetSeq, offset: 0 })
            DefineProp(this.Prototype, 'irdaAttribUsrStr', { type: WINDOWS_IAS_SET._irdaAttribute._irdaAttribUsrStr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    irdaClassName : CHAR[64]

    irdaAttribName : CHAR[256]

    irdaAttribType : UInt32

    irdaAttribute : WINDOWS_IAS_SET._irdaAttribute

}
