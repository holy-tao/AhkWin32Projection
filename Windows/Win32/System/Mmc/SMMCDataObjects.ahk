#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IDataObject.ahk" { IDataObject }

/**
 * The SMMCDataObjects structure defines the format of the data for the CCF_MULTI_SELECT_SNAPINS clipboard format.
 * @remarks
 * Each data object consists of the node types associated with a given snap-in. Data objects are passed using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a>.
 * 
 * The multiselection data objects hold a list that contains each node type represented in the set of selected items for that particular snap-in in the result pane. The list of node types from a particular multiselection data object can be retrieved as an array of node type GUIDs by calling <b>IDataObject::GetData</b> on that data object with the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-object-types-in-multi-select">CCF_OBJECT_TYPES_IN_MULTI_SELECT</a> clipboard format.
 * 
 * Each multiselection data object also holds a list that contains the selected items owned by a particular snap-in. Each snap-in is responsible for defining the format and method of retrieval of the list of its selected items.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-smmcdataobjects
 * @namespace Windows.Win32.System.Mmc
 */
export default struct SMMCDataObjects {
    #StructPack 8

    /**
     * The number of snap-ins whose items are selected in the result pane.
     */
    count : UInt32

    /**
     * Array of pointers to the multiselection data objects for each snap-in selected in the result pane.
     */
    lpDataObject : IDataObject[1]

}
