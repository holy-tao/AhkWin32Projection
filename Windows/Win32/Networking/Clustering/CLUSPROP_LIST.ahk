#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SZ.ahk" { CLUSPROP_SZ }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Accesses the beginning of a property list.
 * @remarks
 * For information about property lists, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">Property Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_list
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_LIST {
    #StructPack 4

    /**
     * Number of properties in the property list.
     */
    nPropertyCount : UInt32

    /**
     * Structure describing the name of the first property in the list.
     */
    PropertyName : CLUSPROP_SZ

}
