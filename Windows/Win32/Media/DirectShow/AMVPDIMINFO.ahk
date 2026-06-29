#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The AMVPDIMINFO structure specifies the dimensional characteristics of a video port (VP) input stream.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ns-vptype-amvpdiminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVPDIMINFO {
    #StructPack 4

    /**
     * Field width of the data.
     */
    dwFieldWidth : UInt32

    /**
     * Field height of the data.
     */
    dwFieldHeight : UInt32

    /**
     * Width of the VBI data.
     */
    dwVBIWidth : UInt32

    /**
     * Height of the VBI data.
     */
    dwVBIHeight : UInt32

    /**
     * Valid rectangle, used for cropping.
     */
    rcValidRegion : RECT

}
