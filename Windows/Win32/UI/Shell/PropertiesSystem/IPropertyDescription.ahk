#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\PROPERTYKEY.ahk
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
     * @returns {PROPERTYKEY} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertykey
     */
    GetPropertyKey() {
        pkey := PROPERTYKEY()
        result := ComCall(3, this, "ptr", pkey, "HRESULT")
        return pkey
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcanonicalname
     */
    GetCanonicalName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getpropertytype
     */
    GetPropertyType() {
        result := ComCall(5, this, "ushort*", &pvartype := 0, "HRESULT")
        return pvartype
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(6, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-geteditinvitation
     */
    GetEditInvitation() {
        result := ComCall(7, this, "ptr*", &ppszInvite := 0, "HRESULT")
        return ppszInvite
    }

    /**
     * 
     * @param {Integer} mask 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-gettypeflags
     */
    GetTypeFlags(mask) {
        result := ComCall(8, this, "uint", mask, "uint*", &ppdtFlags := 0, "HRESULT")
        return ppdtFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getviewflags
     */
    GetViewFlags() {
        result := ComCall(9, this, "int*", &ppdvFlags := 0, "HRESULT")
        return ppdvFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdefaultcolumnwidth
     */
    GetDefaultColumnWidth() {
        result := ComCall(10, this, "uint*", &pcxChars := 0, "HRESULT")
        return pcxChars
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getdisplaytype
     */
    GetDisplayType() {
        result := ComCall(11, this, "int*", &pdisplaytype := 0, "HRESULT")
        return pdisplaytype
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getcolumnstate
     */
    GetColumnState() {
        result := ComCall(12, this, "uint*", &pcsFlags := 0, "HRESULT")
        return pcsFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getgroupingrange
     */
    GetGroupingRange() {
        result := ComCall(13, this, "int*", &pgr := 0, "HRESULT")
        return pgr
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getrelativedescriptiontype
     */
    GetRelativeDescriptionType() {
        result := ComCall(14, this, "int*", &prdt := 0, "HRESULT")
        return prdt
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
        ppszDesc1Marshal := ppszDesc1 is VarRef ? "ptr*" : "ptr"
        ppszDesc2Marshal := ppszDesc2 is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "ptr", propvar1, "ptr", propvar2, ppszDesc1Marshal, ppszDesc1, ppszDesc2Marshal, ppszDesc2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescription
     */
    GetSortDescription() {
        result := ComCall(16, this, "int*", &psd := 0, "HRESULT")
        return psd
    }

    /**
     * 
     * @param {BOOL} fDescending 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getsortdescriptionlabel
     */
    GetSortDescriptionLabel(fDescending) {
        result := ComCall(17, this, "int", fDescending, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getaggregationtype
     */
    GetAggregationType() {
        result := ComCall(18, this, "int*", &paggtype := 0, "HRESULT")
        return paggtype
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-getenumtypelist
     */
    GetEnumTypeList(riid) {
        result := ComCall(20, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescription-formatfordisplay
     */
    FormatForDisplay(propvar, pdfFlags) {
        result := ComCall(22, this, "ptr", propvar, "int", pdfFlags, "ptr*", &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
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
