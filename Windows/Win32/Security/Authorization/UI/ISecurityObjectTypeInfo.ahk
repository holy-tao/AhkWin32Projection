#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a means of determining the source of inherited access control entries (ACEs) in discretionary access control lists (DACLs) and system access control lists (SACLs).
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityobjecttypeinfo
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityObjectTypeInfo extends IUnknown{
    /**
     * The interface identifier for ISecurityObjectTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{fc3066eb-79ef-444b-9111-d18a75ebf2fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} si 
     * @param {Pointer<ACL>} pACL 
     * @param {Pointer<INHERITED_FROMA>} ppInheritArray 
     * @returns {HRESULT} 
     */
    GetInheritSource(si, pACL, ppInheritArray) {
        result := ComCall(3, this, "uint", si, "ptr", pACL, "ptr", ppInheritArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
