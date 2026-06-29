#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CATEGORYINFO_FLAGS.ahk" { CATEGORYINFO_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains category information. A component category is a group of logically-related Component Object Model (COM) classes that share a common category identifier (CATID).
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-category_info
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CATEGORY_INFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags">CATEGORYINFO_FLAGS</a></b>
     * 
     * A flag from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags">CATEGORYINFO_FLAGS</a> that specifies the type of information to retrieve.
     */
    cif : CATEGORYINFO_FLAGS

    /**
     * Type: <b>WCHAR[260]</b>
     * 
     * A character array that specifies the name of the category.
     */
    wszName : WCHAR[260]

}
