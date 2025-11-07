#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyDescription.ahk

/**
 * Exposes methods to get the &quot;sort by&quot; columns properties for an item. This interface is used by UI objects that want to retrieve the primary or secondary sort columns for a given property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescriptionaliasinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescriptionAliasInfo extends IPropertyDescription{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescriptionAliasInfo
     * @type {Guid}
     */
    static IID => Guid("{f67104fc-2af9-46fd-b32d-243c1404f3d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSortByAlias", "GetAdditionalSortByAliases"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionaliasinfo-getsortbyalias
     */
    GetSortByAlias(riid) {
        result := ComCall(24, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionaliasinfo-getadditionalsortbyaliases
     */
    GetAdditionalSortByAliases(riid) {
        result := ComCall(25, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
