#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_ENUMCOLUMNVALUE.ahk" { JET_ENUMCOLUMNVALUE }

/**
 * Learn more about: JET_ENUMCOLUMN class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-enumcolumn-class
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_ENUMCOLUMN {
    #StructPack 8

    columnid : UInt32

    err : Int32

    cEnumColumnValue : UInt32

    rgEnumColumnValue : JET_ENUMCOLUMNVALUE.Ptr

    static __New() {
        DefineProp(this.Prototype, 'cbData', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'pvData', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
