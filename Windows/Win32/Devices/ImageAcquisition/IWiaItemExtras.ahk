#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWiaItemExtras interface provides several methods that enable applications to communicate with hardware drivers.
 * @remarks
 * The <b>IWiaItemExtras</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwiaitemextras
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaItemExtras extends IUnknown {
    /**
     * The interface identifier for IWiaItemExtras
     * @type {Guid}
     */
    static IID := Guid("{6291ef2c-36ef-4532-876a-8e132593778d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaItemExtras interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExtendedErrorInfo : IntPtr
        Escape               : IntPtr
        CancelPendingIO      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaItemExtras.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWiaItemExtras::GetExtendedErrorInfo method gets a string from the device driver that contains information about the most recent error.
     * @remarks
     * Applications must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free the string to which <i>bstrErrorText</i> points.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Pointer to a string that contains the error information.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitemextras-getextendederrorinfo
     */
    GetExtendedErrorInfo() {
        bstrErrorText := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, bstrErrorText, "HRESULT")
        return bstrErrorText
    }

    /**
     * The IWiaItemExtras::Escape method sends a request for a vendor-specific I/O operation to a still image device.
     * @param {Integer} dwEscapeCode Type: <b>DWORD</b>
     * 
     * Calling application-supplied, vendor-defined, DWORD-sized value that represents an I/O operation.
     * @param {Pointer<Integer>} lpInData Type: <b>BYTE*</b>
     * 
     * Pointer to a calling application-supplied buffer that contains data to be sent to the device.
     * @param {Integer} cbInDataSize Type: <b>DWORD</b>
     * 
     * Calling application-supplied length, in bytes, of the data contained in the buffer pointed to by <i>lpInData</i>.
     * @param {Pointer<Integer>} pOutData Type: <b>BYTE*</b>
     * 
     * Pointer to a calling application-supplied memory buffer to receive data from the device.
     * @param {Integer} dwOutDataSize Type: <b>DWORD</b>
     * 
     * Calling application-supplied length, in bytes, of the buffer pointed to by <i>pOutData</i>.
     * @param {Pointer<Integer>} pdwActualDataSize Type: <b>DWORD*</b>
     * 
     * Receives the number of bytes actually written to <i>pOutData</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitemextras-escape
     */
    Escape(dwEscapeCode, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualDataSize) {
        lpInDataMarshal := lpInData is VarRef ? "char*" : "ptr"
        pOutDataMarshal := pOutData is VarRef ? "char*" : "ptr"
        pdwActualDataSizeMarshal := pdwActualDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwEscapeCode, lpInDataMarshal, lpInData, "uint", cbInDataSize, pOutDataMarshal, pOutData, "uint", dwOutDataSize, pdwActualDataSizeMarshal, pdwActualDataSize, "HRESULT")
        return result
    }

    /**
     * The IWiaItemExtras::CancelPendingIO method cancels all pending input/output operations on the driver.
     * @remarks
     * Drivers are not required to support this method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiaitemextras-cancelpendingio
     */
    CancelPendingIO() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaItemExtras.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtendedErrorInfo := CallbackCreate(GetMethod(implObj, "GetExtendedErrorInfo"), flags, 2)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 7)
        this.vtbl.CancelPendingIO := CallbackCreate(GetMethod(implObj, "CancelPendingIO"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtendedErrorInfo)
        CallbackFree(this.vtbl.Escape)
        CallbackFree(this.vtbl.CancelPendingIO)
    }
}
