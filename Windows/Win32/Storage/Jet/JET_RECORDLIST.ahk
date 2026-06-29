#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }

/**
 * Learn more about: JET_RECORDLIST constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-recordlist-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_RECORDLIST {
    #StructPack 8

    cbStruct : UInt32

    tableid : JET_TABLEID

    cRecord : UInt32

    columnidBookmark : UInt32

}
