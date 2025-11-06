#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Provides methods and properties used to manage a list of IDispatch interfaces that can be called by business rule (BizRule) scripts.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazbizruleinterfaces
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzBizRuleInterfaces extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzBizRuleInterfaces
     * @type {Guid}
     */
    static IID => Guid("{e94128c7-e9da-44cc-b0bd-53036f3aab3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddInterface", "AddInterfaces", "GetInterfaceValue", "Remove", "RemoveAll", "get_Count"]

    /**
     * 
     * @param {BSTR} bstrInterfaceName 
     * @param {Integer} lInterfaceFlag 
     * @param {VARIANT} varInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-addinterface
     */
    AddInterface(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(7, this, "ptr", bstrInterfaceName, "int", lInterfaceFlag, "ptr", varInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varInterfaceNames 
     * @param {VARIANT} varInterfaceFlags 
     * @param {VARIANT} varInterfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-addinterfaces
     */
    AddInterfaces(varInterfaceNames, varInterfaceFlags, varInterfaces) {
        result := ComCall(8, this, "ptr", varInterfaceNames, "ptr", varInterfaceFlags, "ptr", varInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceName 
     * @param {Pointer<Integer>} lInterfaceFlag 
     * @param {Pointer<VARIANT>} varInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-getinterfacevalue
     */
    GetInterfaceValue(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        lInterfaceFlagMarshal := lInterfaceFlag is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", bstrInterfaceName, lInterfaceFlagMarshal, lInterfaceFlag, "ptr", varInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-remove
     */
    Remove(bstrInterfaceName) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(10, this, "ptr", bstrInterfaceName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-removeall
     */
    RemoveAll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazbizruleinterfaces-get_count
     */
    get_Count() {
        result := ComCall(12, this, "uint*", &plCount := 0, "HRESULT")
        return plCount
    }
}
