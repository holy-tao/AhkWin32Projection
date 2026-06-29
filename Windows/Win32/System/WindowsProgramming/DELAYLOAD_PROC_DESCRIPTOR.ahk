#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DELAYLOAD_PROC_DESCRIPTOR {
    #StructPack 8


    struct _Description {
        Name : PSTR

        static __New() {
            DefineProp(this.Prototype, 'Ordinal', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ImportDescribedByName : UInt32

    Description : DELAYLOAD_PROC_DESCRIPTOR._Description

}
