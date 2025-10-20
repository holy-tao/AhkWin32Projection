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
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @returns {HRESULT} 
     */
    GetPropertyKey(pkey) {
        result := ComCall(3, this, "ptr", pkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetCanonicalName(ppszName) {
        result := ComCall(4, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pvartype 
     * @returns {HRESULT} 
     */
    GetPropertyType(pvartype) {
        result := ComCall(5, this, "ushort*", pvartype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    GetDisplayName(ppszName) {
        result := ComCall(6, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszInvite 
     * @returns {HRESULT} 
     */
    GetEditInvitation(ppszInvite) {
        result := ComCall(7, this, "ptr", ppszInvite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mask 
     * @param {Pointer<UInt32>} ppdtFlags 
     * @returns {HRESULT} 
     */
    GetTypeFlags(mask, ppdtFlags) {
        result := ComCall(8, this, "uint", mask, "uint*", ppdtFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ppdvFlags 
     * @returns {HRESULT} 
     */
    GetViewFlags(ppdvFlags) {
        result := ComCall(9, this, "int*", ppdvFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcxChars 
     * @returns {HRESULT} 
     */
    GetDefaultColumnWidth(pcxChars) {
        result := ComCall(10, this, "uint*", pcxChars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdisplaytype 
     * @returns {HRESULT} 
     */
    GetDisplayType(pdisplaytype) {
        result := ComCall(11, this, "int*", pdisplaytype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcsFlags 
     * @returns {HRESULT} 
     */
    GetColumnState(pcsFlags) {
        result := ComCall(12, this, "uint*", pcsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pgr 
     * @returns {HRESULT} 
     */
    GetGroupingRange(pgr) {
        result := ComCall(13, this, "int*", pgr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} prdt 
     * @returns {HRESULT} 
     */
    GetRelativeDescriptionType(prdt) {
        result := ComCall(14, this, "int*", prdt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar1 
     * @param {Pointer<PROPVARIANT>} propvar2 
     * @param {Pointer<PWSTR>} ppszDesc1 
     * @param {Pointer<PWSTR>} ppszDesc2 
     * @returns {HRESULT} 
     */
    GetRelativeDescription(propvar1, propvar2, ppszDesc1, ppszDesc2) {
        result := ComCall(15, this, "ptr", propvar1, "ptr", propvar2, "ptr", ppszDesc1, "ptr", ppszDesc2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} psd 
     * @returns {HRESULT} 
     */
    GetSortDescription(psd) {
        result := ComCall(16, this, "int*", psd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fDescending 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    GetSortDescriptionLabel(fDescending, ppszDescription) {
        result := ComCall(17, this, "int", fDescending, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} paggtype 
     * @returns {HRESULT} 
     */
    GetAggregationType(paggtype) {
        result := ComCall(18, this, "int*", paggtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcontype 
     * @param {Pointer<Int32>} popDefault 
     * @returns {HRESULT} 
     */
    GetConditionType(pcontype, popDefault) {
        result := ComCall(19, this, "int*", pcontype, "int*", popDefault, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetEnumTypeList(riid, ppv) {
        result := ComCall(20, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    CoerceToCanonicalValue(ppropvar) {
        result := ComCall(21, this, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {Integer} pdfFlags 
     * @param {Pointer<PWSTR>} ppszDisplay 
     * @returns {HRESULT} 
     */
    FormatForDisplay(propvar, pdfFlags, ppszDisplay) {
        result := ComCall(22, this, "ptr", propvar, "int", pdfFlags, "ptr", ppszDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     */
    IsValueCanonical(propvar) {
        result := ComCall(23, this, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
