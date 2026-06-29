#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IFilterGraph.ahk" { IFilterGraph }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The FILTER_INFO structure contains information about a filter.
 * @remarks
 * If the <b>pGraph</b> member is not <b>NULL</b>, the application should release the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface when it is finished using it.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-filter_info
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct FILTER_INFO {
    #StructPack 8

    /**
     * Null-terminated string containing the name of the filter.
     */
    achName : WCHAR[128]

    /**
     * If the filter is member of a filter graph, contains a pointer to the filter graph's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface. If the filter is not a member of a filter graph, this value of this member is <b>NULL</b>.
     */
    pGraph : IFilterGraph

}
