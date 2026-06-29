#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_GPNV_GETVALUE {
    #StructPack 8

    Method : KSIDENTIFIER

    ulNameLength : UInt32

    cLanguage : CHAR[12]

    argbData : Int8[1]

}
