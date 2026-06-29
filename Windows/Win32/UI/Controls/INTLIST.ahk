#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an array or list of int data items from a visual style.
 * @remarks
 * The lists are returned by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemeintlist">GetThemeIntList</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-intlist
 * @namespace Windows.Win32.UI.Controls
 */
export default struct INTLIST {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * Number of values in the list.
     */
    iValueCount : Int32

    /**
     * Type: <b>int[MAX_INTLIST_COUNT]</b>
     * 
     * List of integers. The constant MAX_INTLIST_COUNT, by definition, is equal to 402 under Windows Vista, but only 10 under earlier versions of Windows.
     */
    iValues : Int32[402]

}
