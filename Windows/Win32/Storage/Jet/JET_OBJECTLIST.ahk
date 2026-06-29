#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }

/**
 * Learn more about: JET_OBJECTLIST class
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-objectlist-class
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_OBJECTLIST {
    #StructPack 8

    cbStruct : UInt32

    tableid : JET_TABLEID

    cRecord : UInt32

    columnidcontainername : UInt32

    columnidobjectname : UInt32

    columnidobjtyp : UInt32

    columniddtCreate : UInt32

    columniddtUpdate : UInt32

    columnidgrbit : UInt32

    columnidflags : UInt32

    columnidcRecord : UInt32

    columnidcPage : UInt32

}
