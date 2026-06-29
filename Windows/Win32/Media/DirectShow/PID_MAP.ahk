#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEDIA_SAMPLE_CONTENT.ahk" { MEDIA_SAMPLE_CONTENT }

/**
 * The PID\_MAP structure contains identifies the contents of an MPEG-2 transport stream packet ID.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/pid-map
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PID_MAP {
    #StructPack 4

    /**
     * Specifies the packet ID (PID)
     */
    ulPID : UInt32

    /**
     * Specifies the contents of the packet payload, as a [**MEDIA\_SAMPLE\_CONTENT**](media-sample-content.md) enumeration type.
     */
    MediaSampleContent : MEDIA_SAMPLE_CONTENT

}
