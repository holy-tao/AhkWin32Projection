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
     * Gets the address of a pointer to the IPropertyDescription interface containing the primary sort column.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the identifier of the requested <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface for the calling object.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionaliasinfo-getsortbyalias
     */
    GetSortByAlias(riid) {
        result := ComCall(24, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the address of a pointer to the IPropertyDescriptionList interface, which contains additional sort column values.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the identifier of the requested <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionaliasinfo-getadditionalsortbyaliases
     */
    GetAdditionalSortByAliases(riid) {
        result := ComCall(25, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
