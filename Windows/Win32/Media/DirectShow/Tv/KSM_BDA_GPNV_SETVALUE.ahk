#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_GPNV_SETVALUE {
    #StructPack 8

    Method : KSIDENTIFIER

    ulDialogRequest : UInt32

    cLanguage : CHAR[12]

    ulNameLength : UInt32

    ulValueLength : UInt32

    argbName : Int8[1]

}
