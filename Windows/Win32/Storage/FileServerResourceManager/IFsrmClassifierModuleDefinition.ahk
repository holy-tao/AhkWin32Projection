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
     * @type {Pointer<SAFEARRAY>} 
     */
    PropertiesAffected {
        get => this.get_PropertiesAffected()
        set => this.put_PropertiesAffected(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    PropertiesUsed {
        get => this.get_PropertiesUsed()
        set => this.put_PropertiesUsed(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NeedsExplicitValue {
        get => this.get_NeedsExplicitValue()
        set => this.put_NeedsExplicitValue(value)
    }

    /**
     * The list of property names that the classifier can affect.
     * @remarks
     * 
     * This list is optional. Specify a list of properties only if you want to limit the properties that this classifier can affect; otherwise, if the list is empty, the classifier can affect any property in the file.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesaffected
     */
    get_PropertiesAffected() {
        result := ComCall(31, this, "ptr*", &propertiesAffected := 0, "HRESULT")
        return propertiesAffected
    }

    /**
     * The list of property names that the classifier can affect.
     * @remarks
     * 
     * This list is optional. Specify a list of properties only if you want to limit the properties that this classifier can affect; otherwise, if the list is empty, the classifier can affect any property in the file.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} propertiesAffected 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesaffected
     */
    put_PropertiesAffected(propertiesAffected) {
        result := ComCall(32, this, "ptr", propertiesAffected, "HRESULT")
        return result
    }

    /**
     * The list of property names that the classifier inspects.
     * @remarks
     * 
     * The classifier may inspect the properties to determine the property value or if it should perform other processes.
     * 
     * The list is optional. Specify a list of properties only if you want to limit the properties that this classifier can inspect; otherwise, if the list is empty, the classifier can inspect any property in the file.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_propertiesused
     */
    get_PropertiesUsed() {
        result := ComCall(33, this, "ptr*", &propertiesUsed := 0, "HRESULT")
        return propertiesUsed
    }

    /**
     * The list of property names that the classifier inspects.
     * @remarks
     * 
     * The classifier may inspect the properties to determine the property value or if it should perform other processes.
     * 
     * The list is optional. Specify a list of properties only if you want to limit the properties that this classifier can inspect; otherwise, if the list is empty, the classifier can inspect any property in the file.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} propertiesUsed 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_propertiesused
     */
    put_PropertiesUsed(propertiesUsed) {
        result := ComCall(34, this, "ptr", propertiesUsed, "HRESULT")
        return result
    }

    /**
     * Determines whether a rule that uses the classifier needs to provide the value for the classification property.
     * @remarks
     * 
     * If this value is <b>VARIANT_FALSE</b>, the classifier determines and provides the value.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-get_needsexplicitvalue
     */
    get_NeedsExplicitValue() {
        result := ComCall(35, this, "short*", &needsExplicitValue := 0, "HRESULT")
        return needsExplicitValue
    }

    /**
     * Determines whether a rule that uses the classifier needs to provide the value for the classification property.
     * @remarks
     * 
     * If this value is <b>VARIANT_FALSE</b>, the classifier determines and provides the value.
     * 
     * 
     * @param {VARIANT_BOOL} needsExplicitValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduledefinition-put_needsexplicitvalue
     */
    put_NeedsExplicitValue(needsExplicitValue) {
        result := ComCall(36, this, "short", needsExplicitValue, "HRESULT")
        return result
    }
}
