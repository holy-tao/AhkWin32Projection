#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IClassFactory.ahk

/**
 * Enables a class factory object, in any sort of object server, to control object creation through licensing.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iclassfactory2
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
     * The <a href="/windows/desktop/api/ocidl/ns-ocidl-licinfo">LICINFO</a> structure was successfully filled in.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iclassfactory2-getlicinfo
     */
    GetLicInfo(pLicInfo) {
        result := ComCall(5, this, "ptr", pLicInfo, "HRESULT")
        return result
    }

    /**
     * Creates a license key that the caller can save and use later to create an instance of the licensed object.
     * @param {Integer} dwReserved This parameter is reserved and must be zero.
     * @returns {BSTR} A pointer to the caller-allocated variable that receives the callee-allocated license key on successful return from this method. This parameter is set to <b>NULL</b> on any failure.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iclassfactory2-requestlickey
     */
    RequestLicKey(dwReserved) {
        pBstrKey := BSTR()
        result := ComCall(6, this, "uint", dwReserved, "ptr", pBstrKey, "HRESULT")
        return pBstrKey
    }

    /**
     * Creates an instance of the licensed object for the specified license key. This method is the only possible means to create an object on an otherwise unlicensed machine.
     * @param {IUnknown} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the outer unknown if this object is being created as part of an aggregate. If the object is not part of an aggregate, this parameter must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the newly created object.
     * @param {BSTR} bstrKey Run-time license key previously obtained from <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-iclassfactory2-requestlickey">IClassFactory2::RequestLicKey</a> that is required to create an object.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer. If an error occurs, the implementation must set *<i>ppvObj</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iclassfactory2-createinstancelic
     */
    CreateInstanceLic(pUnkOuter, riid, bstrKey) {
        static pUnkReserved := 0 ;Reserved parameters must always be NULL

        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pUnkReserved, "ptr", riid, "ptr", bstrKey, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }
}
