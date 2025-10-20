#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPOLinksCollection interface contains methods that enable applications to access a collection of GPO links when using the Group Policy Management (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpolinkscollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPOLinksCollection extends IDispatch{
    /**
     * The interface identifier for IGPMGPOLinksCollection
     * @type {Guid}
     */
    static IID => Guid("{189d7b68-16bd-4d0d-a2ec-2e6aa2288c7f}")

    /**
     * The class identifier for GPMGPOLinksCollection
     * @type {Guid}
     */
    static CLSID => Guid("{f6ed581a-49a5-47e2-b771-fd8dc02b6259}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(7, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(lIndex, pVal) {
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} ppIGPMLinks 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIGPMLinks) {
        result := ComCall(9, this, "ptr", ppIGPMLinks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
