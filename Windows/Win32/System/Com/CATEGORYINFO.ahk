#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a component category.
 * @see https://learn.microsoft.com/windows/win32/api/comcat/ns-comcat-categoryinfo
 * @namespace Windows.Win32.System.Com
 */
export default struct CATEGORYINFO {
    #StructPack 4

    /**
     * The category identifier for the component.
     */
    catid : Guid

    /**
     * The locale identifier. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifier-constants-and-strings">Language Identifier Constants and Strings</a>.
     */
    lcid : UInt32

    /**
     * The description of the category (cannot exceed 128 characters).
     */
    szDescription : WCHAR[128]

}
