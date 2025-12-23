#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of flags for use with the CATEGORY_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CATEGORYINFO_FLAGS extends Win32BitflagEnum{

    /**
     * 0x00000000. Applies default properties for the category.
     * @type {Integer (Int32)}
     */
    static CATINFO_NORMAL => 0

    /**
     * 0x00000001. The category should appear as collapsed
     * @type {Integer (Int32)}
     */
    static CATINFO_COLLAPSED => 1

    /**
     * 0x00000002. The category should appear as hidden.
     * @type {Integer (Int32)}
     */
    static CATINFO_HIDDEN => 2

    /**
     * 0x00000004. The category should appear as expanded.
     * @type {Integer (Int32)}
     */
    static CATINFO_EXPANDED => 4

    /**
     * 0x00000008. The category has no header.
     * @type {Integer (Int32)}
     */
    static CATINFO_NOHEADER => 8

    /**
     * 0x00000010. The category cannot be collapsed.
     * @type {Integer (Int32)}
     */
    static CATINFO_NOTCOLLAPSIBLE => 16

    /**
     * 0x00000020. The count of items in the category should not be displayed in the header.
     * @type {Integer (Int32)}
     */
    static CATINFO_NOHEADERCOUNT => 32

    /**
     * 0x00000040. <b>Windows 7 and later</b>. The category should appear subsetted.
     * @type {Integer (Int32)}
     */
    static CATINFO_SUBSETTED => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CATINFO_SEPARATE_IMAGES => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CATINFO_SHOWEMPTY => 256
}
