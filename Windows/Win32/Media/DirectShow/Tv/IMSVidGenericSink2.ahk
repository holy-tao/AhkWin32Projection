#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMSVidGenericSink.ahk" { IMSVidGenericSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. The IMSVidGenericSink2 interface represents a generic output device that supports streaming output. It is implemented by the MSVidGenericSink object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGenericSink2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidgenericsink2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidGenericSink2 extends IMSVidGenericSink {
    /**
     * The interface identifier for IMSVidGenericSink2
     * @type {Guid}
     */
    static IID := Guid("{6b5a28f3-47f1-4092-b168-60cabec08f1c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidGenericSink2 interfaces
    */
    struct Vtbl extends IMSVidGenericSink.Vtbl {
        AddFilter       : IntPtr
        ResetFilterList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidGenericSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. .
     * @remarks
     * Use this method to insert additional filters to the graph other than the sink filter. To specify the sink filter, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidgenericsink-setsinkfilter">IMSVidGenericSink::SetSinkFilter</a>.
     * @param {BSTR} bstrName <b>BSTR</b> that contains the CLSID of the filter. The <b>BSTR</b> must use the following format: <c>{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}</c>
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgenericsink2-addfilter
     */
    AddFilter(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(19, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 or later. .
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgenericsink2-resetfilterlist
     */
    ResetFilterList() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidGenericSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFilter := CallbackCreate(GetMethod(implObj, "AddFilter"), flags, 2)
        this.vtbl.ResetFilterList := CallbackCreate(GetMethod(implObj, "ResetFilterList"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFilter)
        CallbackFree(this.vtbl.ResetFilterList)
    }
}
