#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the items of a collection of settings and attributes.
 * @remarks
 * 
 * SMI and SMI collections are not thread-safe. Modifying a collection will not invalidate an enumerator. Further operations on the enumerator do not result in exceptions, and could encounter an enumerator in an inconsistent state.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-iitemenumerator
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class IItemEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemEnumerator
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bb7-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Current", "MoveNext", "Reset"]

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-current
     */
    Current() {
        Item := VARIANT()
        result := ComCall(3, this, "ptr", Item, "HRESULT")
        return Item
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-movenext
     */
    MoveNext() {
        result := ComCall(4, this, "int*", &ItemValid := 0, "HRESULT")
        return ItemValid
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-iitemenumerator-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
