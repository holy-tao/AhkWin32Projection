#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMStarterGPOCollection interface contains methods that enable applications to access a collection of Group Policy Objects (GPOs) when using the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nn-gpmgmt-igpmstartergpocollection
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMStarterGPOCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMStarterGPOCollection
     * @type {Guid}
     */
    static IID => Guid("{2e522729-2219-44ad-933a-64dfd650c423}")

    /**
     * The class identifier for GPMStarterGPOCollection
     * @type {Guid}
     */
    static CLSID => Guid("{82f8aa8b-49ba-43b2-956e-3397f9b94c3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Returns the number of GPOs in the collection. (IGPMStarterGPOCollection.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpocollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Given an index, returns a pointer to an IGPMGPO interface from the collection.
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpocollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Retrieves an enumerator for the collection. (IGPMStarterGPOCollection.get__NewEnum)
     * @returns {IEnumVARIANT} Pointer to an <b>IEnumVARIANT</b> interface of an enumerator object for the collection. <b>IEnumVARIANT</b> provides a number of methods that you can use to iterate through the collection. For more information about <b>IEnumVARIANT</b>, see the COM documentation in the Platform SDK.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmstartergpocollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppIGPMTemplates := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumVARIANT(ppIGPMTemplates)
    }
}
