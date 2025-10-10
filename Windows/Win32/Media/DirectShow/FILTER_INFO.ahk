#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FILTER_INFO structure contains information about a filter.
 * @remarks
 * 
  * If the <b>pGraph</b> member is not <b>NULL</b>, the application should release the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface when it is finished using it.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-filter_info
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class FILTER_INFO extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * Null-terminated string containing the name of the filter.
     * @type {String}
     */
    achName {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * If the filter is member of a filter graph, contains a pointer to the filter graph's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltergraph">IFilterGraph</a> interface. If the filter is not a member of a filter graph, this value of this member is <b>NULL</b>.
     * @type {Pointer<IFilterGraph>}
     */
    pGraph {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }
}
