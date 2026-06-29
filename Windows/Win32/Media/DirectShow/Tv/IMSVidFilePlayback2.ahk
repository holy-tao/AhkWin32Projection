#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidFilePlayback.ahk" { IMSVidFilePlayback }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFilePlayback2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidfileplayback2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidFilePlayback2 extends IMSVidFilePlayback {
    /**
     * The interface identifier for IMSVidFilePlayback2
     * @type {Guid}
     */
    static IID := Guid("{2f7e44af-6e52-4660-bc08-d8d542587d72}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidFilePlayback2 interfaces
    */
    struct Vtbl extends IMSVidFilePlayback.Vtbl {
        put__SourceFilter  : IntPtr
        put___SourceFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidFilePlayback2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    _SourceFilter {
        set => this.put__SourceFilter(value)
    }

    /**
     * @type {Guid} 
     */
    __SourceFilter {
        set => this.put___SourceFilter(value)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
     * @remarks
     * If the CLSID is GUID_NULL, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfileplaybackdevice">MSVidFilePlaybackDevice</a> object uses the default source filter for the file name given in <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidfileplayback-put_filename">IMSVidFilePlayback::put_FileName</a>.
     * @param {BSTR} FileName <b>BSTR</b> that contains the CLSID of the source filter. The <b>BSTR</b> must use the following format: <c>{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}</c>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback2-put__sourcefilter
     */
    put__SourceFilter(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(34, this, BSTR, FileName, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later.
     * @remarks
     * If the CLSID is GUID_NULL, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfileplaybackdevice">MSVidFilePlaybackDevice</a> object uses the default source filter for the file name given in <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidfileplayback-put_filename">IMSVidFilePlayback::put_FileName</a>.
     * @param {Guid} FileName Specifies the CLSID of the source filter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidfileplayback2-put___sourcefilter
     */
    put___SourceFilter(FileName) {
        result := ComCall(35, this, Guid, FileName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidFilePlayback2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put__SourceFilter := CallbackCreate(GetMethod(implObj, "put__SourceFilter"), flags, 2)
        this.vtbl.put___SourceFilter := CallbackCreate(GetMethod(implObj, "put___SourceFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put__SourceFilter)
        CallbackFree(this.vtbl.put___SourceFilter)
    }
}
