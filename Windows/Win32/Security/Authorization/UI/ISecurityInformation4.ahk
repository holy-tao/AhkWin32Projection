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
     * 
     * @param {Pointer<SECURITY_OBJECT>} pSecurityObjects 
     * @param {Pointer<UInt32>} pSecurityObjectCount 
     * @returns {HRESULT} 
     */
    GetSecondarySecurity(pSecurityObjects, pSecurityObjectCount) {
        result := ComCall(3, this, "ptr", pSecurityObjects, "uint*", pSecurityObjectCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
