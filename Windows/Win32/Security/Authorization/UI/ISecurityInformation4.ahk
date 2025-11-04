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
     * 
     * @param {Pointer<Pointer<SECURITY_OBJECT>>} pSecurityObjects 
     * @param {Pointer<Integer>} pSecurityObjectCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation4-getsecondarysecurity
     */
    GetSecondarySecurity(pSecurityObjects, pSecurityObjectCount) {
        pSecurityObjectsMarshal := pSecurityObjects is VarRef ? "ptr*" : "ptr"
        pSecurityObjectCountMarshal := pSecurityObjectCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pSecurityObjectsMarshal, pSecurityObjects, pSecurityObjectCountMarshal, pSecurityObjectCount, "HRESULT")
        return result
    }
}
