#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmPropertyDefinition.ahk

/**
 * Defines a property that you want to use to classify files.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyDefinition2 extends IFsrmPropertyDefinition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPropertyDefinition2
     * @type {Guid}
     */
    static IID => Guid("{47782152-d16c-4229-b4e1-0ddfe308b9f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyDefinitionFlags", "get_DisplayName", "put_DisplayName", "get_AppliesTo", "get_ValueDefinitions"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_propertydefinitionflags
     */
    get_PropertyDefinitionFlags() {
        result := ComCall(22, this, "int*", &propertyDefinitionFlags := 0, "HRESULT")
        return propertyDefinitionFlags
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_displayname
     */
    get_DisplayName() {
        name := BSTR()
        result := ComCall(23, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_appliesto
     */
    get_AppliesTo() {
        result := ComCall(25, this, "int*", &appliesTo := 0, "HRESULT")
        return appliesTo
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertydefinition2-get_valuedefinitions
     */
    get_ValueDefinitions() {
        result := ComCall(26, this, "ptr*", &valueDefinitions := 0, "HRESULT")
        return IFsrmCollection(valueDefinitions)
    }
}
