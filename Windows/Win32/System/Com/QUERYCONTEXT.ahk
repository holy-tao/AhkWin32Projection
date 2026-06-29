#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CSPLATFORM.ahk" { CSPLATFORM }

/**
 * Contains a list of attributes used to look up a class implementation.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-querycontext
 * @namespace Windows.Win32.System.Com
 */
export default struct QUERYCONTEXT {
    #StructPack 4

    /**
     * The execution context.
     */
    dwContext : UInt32

    /**
     * The operating system platform and processor architecture. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-csplatform">CSPLATFORM</a>.
     */
    Platform : CSPLATFORM

    /**
     * The locale identifier. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     */
    Locale : UInt32

    /**
     * The high version number.
     */
    dwVersionHi : UInt32

    /**
     * The low version number.
     */
    dwVersionLo : UInt32

}
