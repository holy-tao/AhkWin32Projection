#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INSSBuffer interface is the basic interface of a buffer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct INSSBuffer extends IUnknown {
    /**
     * The interface identifier for INSSBuffer
     * @type {Guid}
     */
    static IID := Guid("{e1cd3524-03d7-11d2-9eed-006097d2d7cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INSSBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength          : IntPtr
        SetLength          : IntPtr
        GetMaxLength       : IntPtr
        GetBuffer          : IntPtr
        GetBufferAndLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INSSBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetLength method retrieves the size of the used portion of the buffer controlled by the buffer object.
     * @remarks
     * The allocated buffer may be larger than the used portion. To find the total size of the allocated buffer, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getmaxlength">INSSBuffer::GetMaxLength</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the length of the buffer, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The SetLength method specifies the size of the used portion of the buffer.
     * @param {Integer} dwLength <b>DWORD</b> containing the size of the used portion, in bytes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwLength</i> is greater than the buffer size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-setlength
     */
    SetLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * The GetMaxLength method retrieves the maximum size to which a buffer can be set.
     * @remarks
     * The maximum size of the buffer as returned by this method does not affect or reflect the size of any data unit extensions associated with the sample stored in the buffer.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the maximum length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(5, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The GetBuffer method retrieves the location of the buffer controlled by the buffer object.
     * @returns {Pointer<Integer>} Pointer to a pointer to the buffer.
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getbuffer
     */
    GetBuffer() {
        result := ComCall(6, this, "ptr*", &ppdwBuffer := 0, "HRESULT")
        return ppdwBuffer
    }

    /**
     * The GetBufferAndLength method retrieves the location and size of the used portion of the buffer controlled by the buffer object.
     * @param {Pointer<Pointer<Integer>>} ppdwBuffer Pointer to a pointer to the buffer.
     * @param {Pointer<Integer>} pdwLength Pointer to a <b>DWORD</b> containing the length of the buffer, in bytes.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppdwBuffer</i> or <i>pdwLength</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer-getbufferandlength
     */
    GetBufferAndLength(ppdwBuffer, pdwLength) {
        ppdwBufferMarshal := ppdwBuffer is VarRef ? "ptr*" : "ptr"
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, ppdwBufferMarshal, ppdwBuffer, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (INSSBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.SetLength := CallbackCreate(GetMethod(implObj, "SetLength"), flags, 2)
        this.vtbl.GetMaxLength := CallbackCreate(GetMethod(implObj, "GetMaxLength"), flags, 2)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 2)
        this.vtbl.GetBufferAndLength := CallbackCreate(GetMethod(implObj, "GetBufferAndLength"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.SetLength)
        CallbackFree(this.vtbl.GetMaxLength)
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.GetBufferAndLength)
    }
}
