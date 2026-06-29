#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_SLOT_INFO {
    #StructPack 8


    struct _Revision {
        Info : Int8[8]

        static __New() {
            DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    SlotNumber : Int8

    ReadOnly : BOOLEAN

    Reserved : Int8[6]

    Revision : STORAGE_FIRMWARE_SLOT_INFO._Revision

}
