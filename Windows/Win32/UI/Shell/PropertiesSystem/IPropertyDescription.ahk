#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate and retrieve individual property description details.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> in the system; it is provided by the Shell. 
  * 
  * To obtain this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescriptionbyname">PSGetPropertyDescriptionByName</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-ipropertydescriptionlist-getat">IPropertyDescriptionList::GetAt</a>.
  * 
  * Only one property description exists for each property in the system.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescription
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescription
     * @type {Guid}
     */
    static IID => Guid("{6f79d558-3e96-4549-a1d1-7d75d2288814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyKey", "GetCanonicalName", "GetPropertyType", "GetDisplayName", "GetEditInvitation", "GetTypeFlags", "GetViewFlags", "GetDefaultColumnWidth", "GetDisplayType", "GetColumnState", "GetGroupingRange", "GetRelativeDescriptionType", "GetRelativeDescription", "GetSortDescription", "GetSortDescriptionLabel", "GetAggregationType", "GetConditionType", "GetEnumTypeList", "CoerceToCanonicalValue", "FormatForDisplay", "IsValueCanonical"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertykey
     */
    GetPropertyKey(pkey) {
        result := ComCall(3, this, "ptr", pkey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcanonicalname
     */
    GetCanonicalName(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pvartype 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertytype
     */
    GetPropertyType(pvartype) {
        pvartypeMarshal := pvartype is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pvartypeMarshal, pvartype, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplayname
     */
    GetDisplayName(ppszName) {
        result := ComCall(6, this, "ptr", ppszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszInvite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-geteditinvitation
     */
    GetEditInvitation(ppszInvite) {
        result := ComCall(7, this, "ptr", ppszInvite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mask 
     * @param {Pointer<Integer>} ppdtFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-gettypeflags
     */
    GetTypeFlags(mask, ppdtFlags) {
        ppdtFlagsMarshal := ppdtFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", mask, ppdtFlagsMarshal, ppdtFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ppdvFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getviewflags
     */
    GetViewFlags(ppdvFlags) {
        ppdvFlagsMarshal := ppdvFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, ppdvFlagsMarshal, ppdvFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcxChars 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdefaultcolumnwidth
     */
    GetDefaultColumnWidth(pcxChars) {
        pcxCharsMarshal := pcxChars is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pcxCharsMarshal, pcxChars, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdisplaytype 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplaytype
     */
    GetDisplayType(pdisplaytype) {
        pdisplaytypeMarshal := pdisplaytype is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pdisplaytypeMarshal, pdisplaytype, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcsFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcolumnstate
     */
    GetColumnState(pcsFlags) {
        pcsFlagsMarshal := pcsFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pcsFlagsMarshal, pcsFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getgroupingrange
     */
    GetGroupingRange(pgr) {
        pgrMarshal := pgr is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pgrMarshal, pgr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prdt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getrelativedescriptiontype
     */
    GetRelativeDescriptionType(prdt) {
        prdtMarshal := prdt is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, prdtMarshal, prdt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar1 
     * @param {Pointer<PROPVARIANT>} propvar2 
     * @param {Pointer<PWSTR>} ppszDesc1 
     * @param {Pointer<PWSTR>} ppszDesc2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getrelativedescription
     */
    GetRelativeDescription(propvar1, propvar2, ppszDesc1, ppszDesc2) {
        result := ComCall(15, this, "ptr", propvar1, "ptr", propvar2, "ptr", ppszDesc1, "ptr", ppszDesc2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} psd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescription
     */
    GetSortDescription(psd) {
        psdMarshal := psd is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, psdMarshal, psd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDescending 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescriptionlabel
     */
    GetSortDescriptionLabel(fDescending, ppszDescription) {
        result := ComCall(17, this, "int", fDescending, "ptr", ppszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} paggtype 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getaggregationtype
     */
    GetAggregationType(paggtype) {
        paggtypeMarshal := paggtype is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, paggtypeMarshal, paggtype, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcontype 
     * @param {Pointer<Integer>} popDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getconditiontype
     */
    GetConditionType(pcontype, popDefault) {
        pcontypeMarshal := pcontype is VarRef ? "int*" : "ptr"
        popDefaultMarshal := popDefault is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pcontypeMarshal, pcontype, popDefaultMarshal, popDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getenumtypelist
     */
    GetEnumTypeList(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-coercetocanonicalvalue
     */
    CoerceToCanonicalValue(ppropvar) {
        result := ComCall(21, this, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {Integer} pdfFlags 
     * @param {Pointer<PWSTR>} ppszDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-formatfordisplay
     */
    FormatForDisplay(propvar, pdfFlags, ppszDisplay) {
        result := ComCall(22, this, "ptr", propvar, "int", pdfFlags, "ptr", ppszDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-isvaluecanonical
     */
    IsValueCanonical(propvar) {
        result := ComCall(23, this, "ptr", propvar, "HRESULT")
        return result
    }
}
