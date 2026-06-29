#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BUTTON_IMAGELIST_ALIGN.ahk" { BUTTON_IMAGELIST_ALIGN }
#Import ".\HIMAGELIST.ahk" { HIMAGELIST }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about an image list that is used with a button control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-button_imagelist
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BUTTON_IMAGELIST {
    #StructPack 8

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to the image list. The provider retains ownership of the image list and is ultimately responsible for its disposal. Under Windows Vista, you can pass BCCL_NOGLYPH in this parameter to indicate that no glyph should be displayed.
     */
    himl : HIMAGELIST

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that specifies the margin around the icon.
     */
    margin : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    uAlign : BUTTON_IMAGELIST_ALIGN

}
