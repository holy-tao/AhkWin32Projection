#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to context object properties.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icontextproperties
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IContextProperties extends IUnknown{
    /**
     * The interface identifier for IContextProperties
     * @type {Guid}
     */
    static IID => Guid("{d396da85-bf8f-11d1-bbae-00c04fc2fa5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    Count(plCount) {
        result := ComCall(3, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    GetProperty(name, pProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNames>} ppenum 
     * @returns {HRESULT} 
     */
    EnumNames(ppenum) {
        result := ComCall(5, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {VARIANT} property 
     * @returns {HRESULT} 
     */
    SetProperty(name, property) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(6, this, "ptr", name, "ptr", property, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    RemoveProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
