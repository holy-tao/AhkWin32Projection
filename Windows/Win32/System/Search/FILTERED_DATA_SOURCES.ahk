#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies parameters for a Shell data source for which a filter is loaded.
 * @remarks
 * A filter, also known as a filter handler, is an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface.
 * 
 * <b>FILTERED_DATA_SOURCES</b> can hold one file content identifier of each type. CLSIDs are always searched first, followed by the  file name extension, then MIME type, and finally the path.
 * @see https://learn.microsoft.com/windows/win32/api/filtereg/ns-filtereg-filtered_data_sources
 * @namespace Windows.Win32.System.Search
 */
export default struct FILTERED_DATA_SOURCES {
    #StructPack 8

    /**
     * Pointer to a buffer that contains a file name extension.
     */
    pwcsExtension : PWSTR

    /**
     * Pointer to a buffer that contains the name of a MIME type.
     */
    pwcsMime : PWSTR

    /**
     * Pointer to a CLSID that identifies the content type.
     */
    pClsid : Guid.Ptr

    /**
     * Not implemented.
     */
    pwcsOverride : PWSTR

}
