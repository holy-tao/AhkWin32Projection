#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\DS_SELECTION.ahk" { DS_SELECTION }

/**
 * The DS_SELECTION_LIST structure contains data about the objects the user selected from an object picker dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-ds_selection_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_SELECTION_LIST {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>aDsSelection</b> array.
     */
    cItems : UInt32

    /**
     * Contains the number of elements returned in the <b>pvarFetchedAttributes</b> member of each 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-ds_selection">DS_SELECTION</a> structure.
     */
    cFetchedAttributes : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-ds_selection">DS_SELECTION</a> structures, one for each object selected by the user. The <b>cItems</b> member indicates the number of elements in this array.
     */
    aDsSelection : DS_SELECTION[1]

}
