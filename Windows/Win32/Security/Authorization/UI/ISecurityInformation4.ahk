#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the access control editor (ACE) to obtain the share's security descriptor to initialize the share page.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityinformation4
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityInformation4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInformation4
     * @type {Guid}
     */
    static IID => Guid("{ea961070-cd14-4621-ace4-f63c03e583e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecondarySecurity"]

    /**
     * Returns additional security contexts that may impact access to the resource.
     * @param {Pointer<Pointer<SECURITY_OBJECT>>} pSecurityObjects An array of <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-security_object">SECURITY_OBJECT</a> structures that contain the secondary security objects associated with the resources that are set on success. The array is owned by the caller and is freed by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function. The <b>pwszName</b> member is also freed by using <b>LocalFree</b>. If the <b>cbData</b> or <b>cbData2</b> members of the <b>SECURITY_OBJECT</b> structure are not zero, then the caller must free the corresponding <b>pData</b> or <b>pData2</b> by using <b>LocalFree</b>. If either of those members are zero, then the corresponding <b>pData</b> and <b>pData2</b> members are owned by the resource manager and must remain valid until the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-editsecurity">EditSecurity</a> function returns
     * @param {Pointer<Integer>} pSecurityObjectCount The number of security objects in the <i>pSecurityObjects</i> parameter that are set on success.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation4-getsecondarysecurity
     */
    GetSecondarySecurity(pSecurityObjects, pSecurityObjectCount) {
        pSecurityObjectsMarshal := pSecurityObjects is VarRef ? "ptr*" : "ptr"
        pSecurityObjectCountMarshal := pSecurityObjectCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pSecurityObjectsMarshal, pSecurityObjects, pSecurityObjectCountMarshal, pSecurityObjectCount, "HRESULT")
        return result
    }
}
