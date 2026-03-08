#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IClassFactory.ahk

/**
 * Enables a class factory object, in any sort of object server, to control object creation through licensing.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iclassfactory2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IClassFactory2 extends IClassFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClassFactory2
     * @type {Guid}
     */
    static IID => Guid("{b196b28f-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLicInfo", "RequestLicKey", "CreateInstanceLic"]

    /**
     * Retrieves information about the licensing capabilities of this class factory.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * E_NOTIMPL is not allowed as a return value because this method provides critical information for the client of a licensed class factory.
     * @param {Pointer<LICINFO>} pLicInfo A pointer to the caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-licinfo">LICINFO</a> structure to be filled on output.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED, as well as the following values.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-licinfo">LICINFO</a> structure was successfully filled in.
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
     * The address in <i>pLicInfo</i> is not valid. For example, it may be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-getlicinfo
     */
    GetLicInfo(pLicInfo) {
        result := ComCall(5, this, "ptr", pLicInfo, "HRESULT")
        return result
    }

    /**
     * Creates a license key that the caller can save and use later to create an instance of the licensed object.
     * @remarks
     * The caller can save the license key for subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-createinstancelic">IClassFactory2::CreateInstanceLic</a> to create objects on an otherwise unlicensed machine.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The caller must free the <b>BSTR</b> with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function when the key is no longer needed. The value of <i>fRuntimeKeyAvail</i> is returned through a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-getlicinfo">IClassFactory2::GetLicInfo</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method allocates the <b>BSTR</b> key with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstringlen">SysAllocStringLen</a>, and the caller becomes responsible for this <b>BSTR</b> after this method returns successfully.
     * 
     * This method need not be implemented when a class factory does not support run-time license keys.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {BSTR} A pointer to the caller-allocated variable that receives the callee-allocated license key on successful return from this method. This parameter is set to <b>NULL</b> on any failure.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-requestlickey
     */
    RequestLicKey(dwReserved) {
        pBstrKey := BSTR()
        result := ComCall(6, this, "uint", dwReserved, "ptr", pBstrKey, "HRESULT")
        return pBstrKey
    }

    /**
     * Creates an instance of the licensed object for the specified license key. This method is the only possible means to create an object on an otherwise unlicensed machine.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the class factory does not provide a license key (that is, <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-requestlickey">IClassFactory2::RequestLicKey</a> returns E_NOTIMPL and the <b>fRuntimeKeyAvail</b> member in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-licinfo">LICINFO</a> is set to <b>FALSE</b> in <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-getlicinfo">IClassFactory2::GetLicInfo</a>), then this method can also return E_NOTIMPL. In such cases, the class factory is implementing <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iclassfactory2">IClassFactory2</a> simply to specify whether the machine is licensed at all through the <b>fLicVerified</b> member of <b>LICINFO</b>.
     * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the outer unknown if this object is being created as part of an aggregate. If the object is not part of an aggregate, this parameter must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the newly created object.
     * @param {BSTR} bstrKey Run-time license key previously obtained from <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-requestlickey">IClassFactory2::RequestLicKey</a> that is required to create an object.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer. If an error occurs, the implementation must set *<i>ppvObj</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iclassfactory2-createinstancelic
     */
    CreateInstanceLic(pUnkOuter, riid, bstrKey) {
        static pUnkReserved := 0 ;Reserved parameters must always be NULL

        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pUnkReserved, "ptr", riid, "ptr", bstrKey, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }
}
