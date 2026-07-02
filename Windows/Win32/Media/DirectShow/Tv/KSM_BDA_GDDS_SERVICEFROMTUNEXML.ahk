#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_GDDS_SERVICEFROMTUNEXML {
    #StructPack 8

    Method : KSIDENTIFIER

    ulTuneXmlLength : UInt32

    argbTuneXml : Int8[1]

}
