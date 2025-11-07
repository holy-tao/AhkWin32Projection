#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPipelineModuleDefinition.ahk

/**
 * Defines a classifier module.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduledefinition
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmClassifierModuleDefinition extends IFsrmPipelineModuleDefinition{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmClassifierModuleDefinition
     * @type {Guid}
     */
    static IID => Guid("{bb36ea26-6318-4b8c-8592-f72dd602e7a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertiesAffected", "put_PropertiesAffected", "get_PropertiesUsed", "put_PropertiesUsed", "get_NeedsExplicitValue", "put_NeedsExplicitValue"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesaffected
     */
    get_PropertiesAffected() {
        result := ComCall(31, this, "ptr*", &propertiesAffected := 0, "HRESULT")
        return propertiesAffected
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} propertiesAffected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesaffected
     */
    put_PropertiesAffected(propertiesAffected) {
        result := ComCall(32, this, "ptr", propertiesAffected, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesused
     */
    get_PropertiesUsed() {
        result := ComCall(33, this, "ptr*", &propertiesUsed := 0, "HRESULT")
        return propertiesUsed
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} propertiesUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesused
     */
    put_PropertiesUsed(propertiesUsed) {
        result := ComCall(34, this, "ptr", propertiesUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_needsexplicitvalue
     */
    get_NeedsExplicitValue() {
        result := ComCall(35, this, "short*", &needsExplicitValue := 0, "HRESULT")
        return needsExplicitValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} needsExplicitValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_needsexplicitvalue
     */
    put_NeedsExplicitValue(needsExplicitValue) {
        result := ComCall(36, this, "short", needsExplicitValue, "HRESULT")
        return result
    }
}
