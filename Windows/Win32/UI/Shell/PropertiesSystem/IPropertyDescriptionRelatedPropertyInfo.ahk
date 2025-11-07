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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelatedProperty"]

    /**
     * 
     * @param {PWSTR} pszRelationshipName 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionrelatedpropertyinfo-getrelatedproperty
     */
    GetRelatedProperty(pszRelationshipName, riid) {
        pszRelationshipName := pszRelationshipName is String ? StrPtr(pszRelationshipName) : pszRelationshipName

        result := ComCall(24, this, "ptr", pszRelationshipName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
