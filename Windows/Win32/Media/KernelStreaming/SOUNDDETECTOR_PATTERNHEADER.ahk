#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct SOUNDDETECTOR_PATTERNHEADER {
    #StructPack 4

    Size : UInt32

    PatternType : Guid

}
