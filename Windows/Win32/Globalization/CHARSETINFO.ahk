#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONTSIGNATURE.ahk" { FONTSIGNATURE }

/**
 * Contains information about a character set.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-charsetinfo
 * @namespace Windows.Win32.Globalization
 */
export default struct CHARSETINFO {
    #StructPack 4

    /**
     * Character set value.
     */
    ciCharset : UInt32

    /**
     * Windows ANSI code page identifier. For a list of identifiers, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-identifiers">Code Page Identifiers</a>.
     */
    ciACP : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-fontsignature">FONTSIGNATURE</a> structure that identifies the Unicode subrange and the specific Windows ANSI character set/code page. Only one code page will be set when this structure is set by the function.
     */
    fs : FONTSIGNATURE

}
