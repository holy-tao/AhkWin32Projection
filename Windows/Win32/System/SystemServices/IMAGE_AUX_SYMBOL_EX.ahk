#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_AUX_SYMBOL_TOKEN_DEF.ahk" { IMAGE_AUX_SYMBOL_TOKEN_DEF }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_AUX_SYMBOL_EX {
    #StructPack 4


    struct _Sym {
        WeakDefaultSymIndex : UInt32

        WeakSearchType : UInt32

        rgbReserved : Int8[12]

    }

    struct _File {
        Name : Int8[20]

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

        rgbReserved : Int8[2]

    }

    struct _CRC {
        crc : UInt32

        rgbReserved : Int8[16]

    }

    Sym : IMAGE_AUX_SYMBOL_EX._Sym

    rgbReserved : Int8[2]

    static __New() {
        DefineProp(this.Prototype, 'File', { type: IMAGE_AUX_SYMBOL_EX._File, offset: 0 })
        DefineProp(this.Prototype, 'Section', { type: IMAGE_AUX_SYMBOL_EX._Section, offset: 0 })
        DefineProp(this.Prototype, 'TokenDef', { type: IMAGE_AUX_SYMBOL_TOKEN_DEF, offset: 0 })
        DefineProp(this.Prototype, 'CRC', { type: IMAGE_AUX_SYMBOL_EX._CRC, offset: 0 })
        this.DeleteProp("__New")
    }
}
