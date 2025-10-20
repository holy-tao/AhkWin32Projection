#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Used to create shared property groups and to obtain access to existing shared property groups.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isharedpropertygroupmanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISharedPropertyGroupManager extends IDispatch{
    /**
     * The interface identifier for ISharedPropertyGroupManager
     * @type {Guid}
     */
    static IID => Guid("{2a005c0d-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The class identifier for SharedPropertyGroupManager
     * @type {Guid}
     */
    static CLSID => Guid("{2a005c11-a5de-11cf-9e66-00aa00a3f464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<Int32>} dwIsoMode 
     * @param {Pointer<Int32>} dwRelMode 
     * @param {Pointer<VARIANT_BOOL>} fExists 
     * @param {Pointer<ISharedPropertyGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    CreatePropertyGroup(Name, dwIsoMode, dwRelMode, fExists, ppGroup) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(7, this, "ptr", Name, "int*", dwIsoMode, "int*", dwRelMode, "ptr", fExists, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {Pointer<ISharedPropertyGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    get_Group(Name, ppGroup) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name

        result := ComCall(8, this, "ptr", Name, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(9, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
