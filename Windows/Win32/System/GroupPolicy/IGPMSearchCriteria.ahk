#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSearchCriteria interface allows you to define the criteria to use for search operations when using the Group Policy Management Console (GPMC) interfaces. To create a GPMSearchCriteria object, call the IGPM::CreateSearchCriteria method.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsearchcriteria
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSearchCriteria extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSearchCriteria
     * @type {Guid}
     */
    static IID => Guid("{d6f11c42-829b-48d4-83f5-3615b67dfc22}")

    /**
     * The class identifier for GPMSearchCriteria
     * @type {Guid}
     */
    static CLSID => Guid("{17aaca26-5ce0-44fa-8cc0-5259e6483566}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add"]

    /**
     * 
     * @param {Integer} searchProperty 
     * @param {Integer} searchOperation 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsearchcriteria-add
     */
    Add(searchProperty, searchOperation, varValue) {
        result := ComCall(7, this, "int", searchProperty, "int", searchOperation, "ptr", varValue, "HRESULT")
        return result
    }
}
