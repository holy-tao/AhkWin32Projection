#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DROPIMAGETYPE.ahk" { DROPIMAGETYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the image and accompanying text for a drop object.
 * @remarks
 * Some UI coloring is applied to the text in <b>szInsert</b> if used by specifying %1 in <b>szMessage</b>. The characters %% and %1 are the subset of <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> markers that are processed here.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dropdescription
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DROPDESCRIPTION {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-dropimagetype">DROPIMAGETYPE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ne-shlobj_core-dropimagetype">DROPIMAGETYPE</a> indicating the stock image to use.
     */
    type : DROPIMAGETYPE

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * Text such as "Move to %1".
     */
    szMessage : WCHAR[260]

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * Text such as "Documents", inserted as specified by <b>szMessage</b>.
     */
    szInsert : WCHAR[260]

}
