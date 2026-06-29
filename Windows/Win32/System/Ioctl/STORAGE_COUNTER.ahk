#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_COUNTER_TYPE.ahk" { STORAGE_COUNTER_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_COUNTER {
    #StructPack 8


    struct _Value {

        struct _ManufactureDate {
            Week : UInt32

            Year : UInt32

        }

        ManufactureDate : STORAGE_COUNTER._Value._ManufactureDate

        static __New() {
            DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : STORAGE_COUNTER_TYPE

    Value : STORAGE_COUNTER._Value

}
