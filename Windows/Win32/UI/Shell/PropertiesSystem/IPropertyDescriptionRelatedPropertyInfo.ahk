#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyDescription.ahk

/**
 * Provides a method that retrives an IPropertyDescription interface.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Do not implement this interface. There is only one implementation of <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionrelatedpropertyinfo">IPropertyDescriptionRelatedPropertyInfo</a> in the system; it is provided by the Shell. 
  * 
  * Only one property description exists for each property in the system.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescriptionrelatedpropertyinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescriptionRelatedPropertyInfo extends IPropertyDescription{
    /**
     * The interface identifier for IPropertyDescriptionRelatedPropertyInfo
     * @type {Guid}
     */
    static IID => Guid("{507393f4-2a3d-4a60-b59e-d9c75716c2dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * 
     * @param {PWSTR} pszRelationshipName 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetRelatedProperty(pszRelationshipName, riid, ppv) {
        pszRelationshipName := pszRelationshipName is String ? StrPtr(pszRelationshipName) : pszRelationshipName

        result := ComCall(24, this, "ptr", pszRelationshipName, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
