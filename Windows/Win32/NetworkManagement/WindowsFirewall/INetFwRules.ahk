#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Collection of firewall rules.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwrules
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRules extends IDispatch{
    /**
     * The interface identifier for INetFwRules
     * @type {Guid}
     */
    static IID => Guid("{9c4c6277-5027-441e-afae-ca1f542da009}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwRule>} rule 
     * @returns {HRESULT} 
     */
    Add(rule) {
        result := ComCall(8, this, "ptr", rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    Remove(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<INetFwRule>} rule 
     * @returns {HRESULT} 
     */
    Item(name, rule) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr", rule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(newEnum) {
        result := ComCall(11, this, "ptr", newEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
