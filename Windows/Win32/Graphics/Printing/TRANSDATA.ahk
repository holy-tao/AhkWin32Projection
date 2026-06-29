#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct TRANSDATA {
    #StructPack 2


    struct _uCode {
        sCode : Int16

        static __New() {
            DefineProp(this.Prototype, 'ubCode', { type: Int8, offset: 0 })
            DefineProp(this.Prototype, 'ubPairs', { type: Int8[2], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ubCodePageID : Int8

    ubType : Int8

    uCode : TRANSDATA._uCode

}
