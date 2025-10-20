#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemPrivilegeSet extends IDispatch{
    /**
     * The interface identifier for ISWbemPrivilegeSet
     * @type {Guid}
     */
    static IID => Guid("{26ee67bf-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilegeSet
     * @type {Guid}
     */
    static CLSID => Guid("{26ee67be-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    Item(iPrivilege, objWbemPrivilege) {
        result := ComCall(8, this, "int", iPrivilege, "ptr", objWbemPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        result := ComCall(9, this, "int*", iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    Add(iPrivilege, bIsEnabled, objWbemPrivilege) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr", objWbemPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @returns {HRESULT} 
     */
    Remove(iPrivilege) {
        result := ComCall(11, this, "int", iPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    AddAsString(strPrivilege, bIsEnabled, objWbemPrivilege) {
        strPrivilege := strPrivilege is String ? BSTR.Alloc(strPrivilege).Value : strPrivilege

        result := ComCall(13, this, "ptr", strPrivilege, "short", bIsEnabled, "ptr", objWbemPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
