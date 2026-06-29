#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMStreamSelect interface selects from the available streams on a parser filter.
 * @remarks
 * The following filters implement this interface:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-1-stream-splitter-filter">MPEG-1 Stream Splitter</a> filter</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-2-splitter">MPEG-2 Splitter</a> filter</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/DirectShow/sami--cc--parser-filter">SAMI (CC) Parser</a> filter</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamstreamselect
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMStreamSelect extends IUnknown {
    /**
     * The interface identifier for IAMStreamSelect
     * @type {Guid}
     */
    static IID := Guid("{c1960960-17f5-11d1-abe1-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMStreamSelect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Count  : IntPtr
        Info   : IntPtr
        Enable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMStreamSelect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Count method retrieves the number of available streams.
     * @returns {Integer} Receives the number of streams.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-count
     */
    Count() {
        result := ComCall(3, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * The Info method retrieves information about a given stream.
     * @param {Integer} lIndex Zero-based index of the stream.
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt Address of a variable that receives a pointer to the stream's media type. This parameter is optional and can be <b>NULL</b>. If the value is non-<b>NULL</b>, the method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. The caller must delete the structure, including the format block. (You can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/deletemediatype">DeleteMediaType</a> function from the DirectShow base-class library.)
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} plcid Pointer to a variable that receives a locale context (LCID) value. If the stream is associated with a particular locale, the LCID is returned in this variable. Otherwise, the variable receives the value zero. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwGroup Pointer to a variable that receives the logical group with which the stream is associated. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppszName Address of a variable that receives a pointer to the stream name. The caller must free the returned string by calling the <b>CoTaskMemFree</b> function. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<IUnknown>} ppObject Address of a variable that receives an <b>IUnknown</b> interface pointer. The method might return a pointer to a pin or filter associated with the stream, or it might return the value <b>NULL</b>. If the method returns a non-<b>NULL</b> value, the caller must release the <b>IUnknown</b> pointer.
     * 
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamselect-enable">IAMStreamSelect::Enable</a> method might invalidate the object returned by this method.
     * 
     * This parameter is optional and can be <b>NULL</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-1-stream-splitter-filter">MPEG-1 Stream Splitter</a>, <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-2-splitter">MPEG-2 Splitter</a>, and <a href="https://docs.microsoft.com/windows/desktop/DirectShow/sami--cc--parser-filter">SAMI (CC) Parser</a> filters return a pointer to the pin associated with the selected stream.
     * @param {Pointer<IUnknown>} ppUnk Address of a variable that receives an <b>IUnknown</b> interface pointer. The method might return a pointer to an interface that is specific to the stream, or it might return the value <b>NULL</b>. If the method returns a non-<b>NULL</b> value, the caller must release the <b>IUnknown</b> pointer. This parameter is optional and can be <b>NULL</b>.
     * 
     * The MPEG-1 Stream Splitter, MPEG-2 Splitter, and SAMI (CC) Parser filters all return the value <b>NULL</b>. Third party filters might return a pointer to a custom filter interface.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The index is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-info
     */
    Info(lIndex, ppmt, pdwFlags, plcid, pdwGroup, ppszName, ppObject, ppUnk) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"
        pdwGroupMarshal := pdwGroup is VarRef ? "uint*" : "ptr"
        ppszNameMarshal := ppszName is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "int", lIndex, ppmtMarshal, ppmt, pdwFlagsMarshal, pdwFlags, plcidMarshal, plcid, pdwGroupMarshal, pdwGroup, ppszNameMarshal, ppszName, IUnknown.Ptr, ppObject, IUnknown.Ptr, ppUnk, "HRESULT")
        return result
    }

    /**
     * The Enable method enables or disables a given stream.
     * @param {Integer} lIndex Zero-based index of the stream.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream ID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter does not support the specified flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pins are not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamstreamselect-enable
     */
    Enable(lIndex, dwFlags) {
        result := ComCall(5, this, "int", lIndex, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMStreamSelect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Count := CallbackCreate(GetMethod(implObj, "Count"), flags, 2)
        this.vtbl.Info := CallbackCreate(GetMethod(implObj, "Info"), flags, 9)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Count)
        CallbackFree(this.vtbl.Info)
        CallbackFree(this.vtbl.Enable)
    }
}
