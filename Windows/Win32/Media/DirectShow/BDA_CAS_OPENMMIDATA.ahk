#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_CAS_OPENMMIDATA {
    #StructPack 4

    ulDialogNumber : UInt32

    ulDialogRequest : UInt32

    uuidDialogType : Guid

    usDialogDataLength : UInt16

    argbDialogData : Int8[1]

}
