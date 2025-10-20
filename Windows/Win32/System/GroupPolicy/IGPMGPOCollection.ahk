#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPOCollection interface contains methods that enable applications to access a collection of Group Policy Objects (GPOs) when using the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpocollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPOCollection extends IDispatch{
    /**
     * The interface identifier for IGPMGPOCollection
     * @type {Guid}
     */
    static IID => Guid("{f0f0d5cf-70ca-4c39-9e29-b642f8726c01}")

    /**
     * The class identifier for GPMGPOCollection
     * @type {Guid}
     */
    static CLSID => Guid("{7a057325-832d-4de3-a41f-c780436a4e09}")

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
     * @param {Pointer<IEnumVARIANT>} ppIGPMGPOs 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppIGPMGPOs) {
        result := ComCall(9, this, "ptr", ppIGPMGPOs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
