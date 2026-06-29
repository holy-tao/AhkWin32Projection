#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MCA_EXCEPTION_TYPE.ahk" { MCA_EXCEPTION_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCA_EXCEPTION {
    #StructPack 8


    struct _u {

        struct _Mca {
            BankNumber : Int8

            Reserved2 : Int8[7]

            Status : IntPtr

            Address : IntPtr

            Misc : Int64

        }

        struct _Mce {
            Address : Int64

            Type : Int64

        }

        Mca : MCA_EXCEPTION._u._Mca

        static __New() {
            DefineProp(this.Prototype, 'Mce', { type: MCA_EXCEPTION._u._Mce, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    VersionNumber : UInt32

    ExceptionType : MCA_EXCEPTION_TYPE

    TimeStamp : Int64

    ProcessorNumber : UInt32

    Reserved1 : UInt32

    u : MCA_EXCEPTION._u

    ExtCnt : UInt32

    Reserved3 : UInt32

    ExtReg : Int64[24]

}
