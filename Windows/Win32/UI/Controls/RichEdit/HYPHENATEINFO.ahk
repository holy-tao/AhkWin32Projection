#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about hyphenation in a Microsoft Rich Edit control.
 * @remarks
 * This structure is used with the <a href="https://msdn.microsoft.com/70ccb698-e440-493b-8f38-2bf7f32e4b26">EM_GETHYPHENATEINFO</a> and <a href="https://msdn.microsoft.com/67126cb8-ab50-49a9-b32f-2245debf2fe3">EM_SETHYPHENATEINFO</a> messages.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphenateinfo
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct HYPHENATEINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Size of the <b>HYPHENATEINFO</b> structure, in bytes.
     */
    cbSize : Int16 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Size, in TWIPS (one TWIP is 1/1440 inch), of the area near the margin that excludes hyphenation. If a space character is closer to the margin than this value, do not hyphenate the following word.
     */
    dxHyphenateZone : Int16

    /**
     * Type: <b>PFNHYPHENATEPROC</b>
     * 
     * The client-defined <a href="https://docs.microsoft.com/windows/win32/api/richedit/nf-richedit-hyphenateproc">HyphenateProc</a> callback function.
     */
    pfnHyphenate : IntPtr

}
