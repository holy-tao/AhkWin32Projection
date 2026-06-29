#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_AUX_SYMBOL_TOKEN_DEF.ahk" { IMAGE_AUX_SYMBOL_TOKEN_DEF }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_AUX_SYMBOL {
    #StructPack 4


    struct _Sym {

        struct _Misc {

            struct _LnSz {
                Linenumber : UInt16

                Size : UInt16

            }

            LnSz : IMAGE_AUX_SYMBOL._Sym._Misc._LnSz

            static __New() {
                DefineProp(this.Prototype, 'TotalSize', { type: UInt32, offset: 0 })
                this.DeleteProp("__New")
            }
        }

        struct _FcnAry {

            struct _Function {
                PointerToLinenumber : UInt32

                PointerToNextFunction : UInt32

            }

            struct _Array {
                Dimension : UInt16[4]

            }

            Function : IMAGE_AUX_SYMBOL._Sym._FcnAry._Function

            static __New() {
                DefineProp(this.Prototype, 'Array', { type: IMAGE_AUX_SYMBOL._Sym._FcnAry._Array, offset: 0 })
                this.DeleteProp("__New")
            }
        }

        TagIndex : UInt32

        Misc : IMAGE_AUX_SYMBOL._Sym._Misc

        FcnAry : IMAGE_AUX_SYMBOL._Sym._FcnAry

        TvIndex : UInt16

    }

    struct _File {
        Name : Int8[18]

    }

    struct _Section {
        Length : UInt32

        NumberOfRelocations : UInt16

        NumberOfLinenumbers : UInt16

        CheckSum : UInt32

        Number : Int16

        Selection : Int8

        bReserved : Int8

        HighNumber : Int16

    }

    struct _CRC {
        crc : UInt32

        rgbReserved : Int8[14]

    }

    Sym : IMAGE_AUX_SYMBOL._Sym

    static __New() {
        DefineProp(this.Prototype, 'File', { type: IMAGE_AUX_SYMBOL._File, offset: 0 })
        DefineProp(this.Prototype, 'Section', { type: IMAGE_AUX_SYMBOL._Section, offset: 0 })
        DefineProp(this.Prototype, 'TokenDef', { type: IMAGE_AUX_SYMBOL_TOKEN_DEF, offset: 0 })
        DefineProp(this.Prototype, 'CRC', { type: IMAGE_AUX_SYMBOL._CRC, offset: 0 })
        this.DeleteProp("__New")
    }
}
