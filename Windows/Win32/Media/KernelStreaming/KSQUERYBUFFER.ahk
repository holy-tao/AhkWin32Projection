#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSQUERYBUFFER {
    #StructPack 8

    Event : KSIDENTIFIER

    EventData : KSEVENTDATA.Ptr

    Reserved : IntPtr

}
