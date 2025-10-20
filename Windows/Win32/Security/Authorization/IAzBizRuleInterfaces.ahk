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
     * 
     * @param {BSTR} bstrInterfaceName 
     * @param {Integer} lInterfaceFlag 
     * @param {VARIANT} varInterface 
     * @returns {HRESULT} 
     */
    AddInterface(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(7, this, "ptr", bstrInterfaceName, "int", lInterfaceFlag, "ptr", varInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varInterfaceNames 
     * @param {VARIANT} varInterfaceFlags 
     * @param {VARIANT} varInterfaces 
     * @returns {HRESULT} 
     */
    AddInterfaces(varInterfaceNames, varInterfaceFlags, varInterfaces) {
        result := ComCall(8, this, "ptr", varInterfaceNames, "ptr", varInterfaceFlags, "ptr", varInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceName 
     * @param {Pointer<Int32>} lInterfaceFlag 
     * @param {Pointer<VARIANT>} varInterface 
     * @returns {HRESULT} 
     */
    GetInterfaceValue(bstrInterfaceName, lInterfaceFlag, varInterface) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(9, this, "ptr", bstrInterfaceName, "int*", lInterfaceFlag, "ptr", varInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceName 
     * @returns {HRESULT} 
     */
    Remove(bstrInterfaceName) {
        bstrInterfaceName := bstrInterfaceName is String ? BSTR.Alloc(bstrInterfaceName).Value : bstrInterfaceName

        result := ComCall(10, this, "ptr", bstrInterfaceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(12, this, "uint*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
