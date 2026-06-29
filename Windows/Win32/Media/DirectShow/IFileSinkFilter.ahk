#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IFileSinkFilter interface is implemented on filters that write media streams to a file.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter2">IFileSinkFilter2</a> interface extends <b>IFileSinkFilter</b>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ifilesinkfilter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFileSinkFilter extends IUnknown {
    /**
     * The interface identifier for IFileSinkFilter
     * @type {Guid}
     */
    static IID := Guid("{a2104830-7c70-11cf-8bce-00aa00a3f1a6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFileSinkFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFileName : IntPtr
        GetCurFile  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFileSinkFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetFileName method sets the name of the file into which media samples will be written.
     * @remarks
     * If the <i>pszFileName</i> parameter names a nonexistent file, the file will be created. If it names an existing file, the sink filter will overwrite the file without first deleting it.
     * @param {PWSTR} pszFileName Pointer to the name of the file to receive the media samples.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the type of media samples to be written to the file, and the media type of the sink filter's input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter-setfilename
     */
    SetFileName(pszFileName, pmt) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(3, this, "ptr", pszFileName, AM_MEDIA_TYPE.Ptr, pmt, "HRESULT")
        return result
    }

    /**
     * The GetCurFile method retrieves the name and media type of the current file. (IFileSinkFilter.GetCurFile)
     * @remarks
     * If the filter has not opened a file, the method might succeed but return <b>NULL</b> in the <i>ppszFileName</i> parameter. Check the value when the method returns.
     * 
     * The method allocates the memory for the string returned in <i>ppszFileName</i>, and the memory for the format block in the media type (if any). The caller must free them by calling <b>CoTaskMemFree</b>. For the media type, you can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/freemediatype">FreeMediaType</a> function in the base class library.
     * @param {Pointer<PWSTR>} ppszFileName Address of a pointer that receives the name of the file, as an <b>OLESTR</b> type.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that receives the media type. This parameter can by <b>NULL</b>, in which case the method does not return the media type.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No file is opened.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument in <i>ppszFileName</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifilesinkfilter-getcurfile
     */
    GetCurFile(ppszFileName, pmt) {
        ppszFileNameMarshal := ppszFileName is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppszFileNameMarshal, ppszFileName, AM_MEDIA_TYPE.Ptr, pmt, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFileSinkFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFileName := CallbackCreate(GetMethod(implObj, "SetFileName"), flags, 3)
        this.vtbl.GetCurFile := CallbackCreate(GetMethod(implObj, "GetCurFile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFileName)
        CallbackFree(this.vtbl.GetCurFile)
    }
}
