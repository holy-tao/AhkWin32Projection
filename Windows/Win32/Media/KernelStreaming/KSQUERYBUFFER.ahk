#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSEVENTDATA.ahk" { KSEVENTDATA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSQUERYBUFFER {
    #StructPack 8

    Event : KSIDENTIFIER

    EventData : KSEVENTDATA.Ptr

    Reserved : IntPtr

}
