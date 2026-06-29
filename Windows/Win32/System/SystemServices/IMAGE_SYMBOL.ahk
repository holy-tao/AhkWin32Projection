#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_SYMBOL {
    #StructPack 4


    struct _N {

        struct _Name {
            Short : UInt32

            Long : UInt32

        }

        ShortName : Int8[8]

        static __New() {
            DefineProp(this.Prototype, 'Name', { type: IMAGE_SYMBOL._N._Name, offset: 0 })
            DefineProp(this.Prototype, 'LongName', { type: UInt32[2], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    N : IMAGE_SYMBOL._N

    Value : UInt32

    SectionNumber : Int16

    Type : UInt16

    StorageClass : Int8

    NumberOfAuxSymbols : Int8

}
