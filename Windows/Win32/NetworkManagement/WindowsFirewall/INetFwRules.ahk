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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Add", "Remove", "Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-get_count
     */
    get_Count(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetFwRule} rule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-add
     */
    Add(rule) {
        result := ComCall(8, this, "ptr", rule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-remove
     */
    Remove(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<INetFwRule>} rule 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-item
     */
    Item(name, rule) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "ptr*", rule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwrules-get__newenum
     */
    get__NewEnum(newEnum) {
        result := ComCall(11, this, "ptr*", newEnum, "HRESULT")
        return result
    }
}
