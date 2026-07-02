#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KS_AMVPSIZE.ahk" { KS_AMVPSIZE }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSVPSIZE_PROP {
    #StructPack 8

    Property : KSIDENTIFIER

    Size : KS_AMVPSIZE

}
