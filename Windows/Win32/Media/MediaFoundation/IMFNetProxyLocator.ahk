#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Determines the proxy to use when connecting to a server.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfnetproxylocator
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFNetProxyLocator extends IUnknown {
    /**
     * The interface identifier for IMFNetProxyLocator
     * @type {Guid}
     */
    static IID := Guid("{e9cd0383-a268-4bb4-82de-658d53574d41}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFNetProxyLocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirstProxy      : IntPtr
        FindNextProxy       : IntPtr
        RegisterProxyResult : IntPtr
        GetCurrentProxy     : IntPtr
        Clone               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFNetProxyLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the proxy locator object.
     * @param {PWSTR} pszHost Null-terminated wide-character string containing the hostname of the destination server.
     * @param {PWSTR} pszUrl Null-terminated wide-character string containing the destination URL.
     * @param {BOOL} fReserved Reserved. Set to <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocator-findfirstproxy
     */
    FindFirstProxy(pszHost, pszUrl, fReserved) {
        pszHost := pszHost is String ? StrPtr(pszHost) : pszHost
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(3, this, "ptr", pszHost, "ptr", pszUrl, BOOL, fReserved, "HRESULT")
        return result
    }

    /**
     * Determines the next proxy to use.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more proxy objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocator-findnextproxy
     */
    FindNextProxy() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Keeps a record of the success or failure of using the current proxy.
     * @param {HRESULT} hrOp <b>HRESULT</b> specifying the result of using the current proxy for connection.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocator-registerproxyresult
     */
    RegisterProxyResult(hrOp) {
        result := ComCall(5, this, "int", hrOp, "HRESULT")
        return result
    }

    /**
     * Retrieves the current proxy information including hostname and port.
     * @param {PWSTR} pszStr Pointer to a buffer that receives a null-terminated string containing the proxy hostname and port. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pcchStr On input, specifies the number of elements in the <i>pszStr</i> array. On output, receives the required size of the buffer.
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
     * <dt><b>E_NOT_SUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer specified in <i>pszStr</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocator-getcurrentproxy
     */
    GetCurrentProxy(pszStr, pcchStr) {
        pszStr := pszStr is String ? StrPtr(pszStr) : pszStr

        pcchStrMarshal := pcchStr is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszStr, pcchStrMarshal, pcchStr, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of the default proxy locator.
     * @returns {IMFNetProxyLocator} Receives a pointer to the new proxy locator object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfnetproxylocator">IMFNetProxyLocator</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfnetproxylocator-clone
     */
    Clone() {
        result := ComCall(7, this, "ptr*", &ppProxyLocator := 0, "HRESULT")
        return IMFNetProxyLocator(ppProxyLocator)
    }

    Query(iid) {
        if (IMFNetProxyLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirstProxy := CallbackCreate(GetMethod(implObj, "FindFirstProxy"), flags, 4)
        this.vtbl.FindNextProxy := CallbackCreate(GetMethod(implObj, "FindNextProxy"), flags, 1)
        this.vtbl.RegisterProxyResult := CallbackCreate(GetMethod(implObj, "RegisterProxyResult"), flags, 2)
        this.vtbl.GetCurrentProxy := CallbackCreate(GetMethod(implObj, "GetCurrentProxy"), flags, 3)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirstProxy)
        CallbackFree(this.vtbl.FindNextProxy)
        CallbackFree(this.vtbl.RegisterProxyResult)
        CallbackFree(this.vtbl.GetCurrentProxy)
        CallbackFree(this.vtbl.Clone)
    }
}
