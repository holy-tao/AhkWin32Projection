#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateRecipeNodeValidationInfoRecord.ahk
#Include .\IUpdateRecipeNodeValidationInfoRecordFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateRecipeNodeValidationInfoRecord extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateRecipeNodeValidationInfoRecord

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateRecipeNodeValidationInfoRecord.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} nodeName 
     * @param {HSTRING} recipeValidationInfo 
     * @param {IVectorView<UpdateScanRecord>} scanResults 
     * @returns {UpdateRecipeNodeValidationInfoRecord} 
     */
    static CreateInstance(nodeName, recipeValidationInfo, scanResults) {
        if (!UpdateRecipeNodeValidationInfoRecord.HasProp("__IUpdateRecipeNodeValidationInfoRecordFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateRecipeNodeValidationInfoRecord")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateRecipeNodeValidationInfoRecordFactory.IID)
            UpdateRecipeNodeValidationInfoRecord.__IUpdateRecipeNodeValidationInfoRecordFactory := IUpdateRecipeNodeValidationInfoRecordFactory(factoryPtr)
        }

        return UpdateRecipeNodeValidationInfoRecord.__IUpdateRecipeNodeValidationInfoRecordFactory.CreateInstance(nodeName, recipeValidationInfo, scanResults)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    NodeName {
        get => this.get_NodeName()
    }

    /**
     * @type {HSTRING} 
     */
    RecipeValidationInfo {
        get => this.get_RecipeValidationInfo()
    }

    /**
     * @type {IVectorView<UpdateScanRecord>} 
     */
    ScanResults {
        get => this.get_ScanResults()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NodeName() {
        if (!this.HasProp("__IUpdateRecipeNodeValidationInfoRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateRecipeNodeValidationInfoRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateRecipeNodeValidationInfoRecord := IUpdateRecipeNodeValidationInfoRecord(outPtr)
        }

        return this.__IUpdateRecipeNodeValidationInfoRecord.get_NodeName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RecipeValidationInfo() {
        if (!this.HasProp("__IUpdateRecipeNodeValidationInfoRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateRecipeNodeValidationInfoRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateRecipeNodeValidationInfoRecord := IUpdateRecipeNodeValidationInfoRecord(outPtr)
        }

        return this.__IUpdateRecipeNodeValidationInfoRecord.get_RecipeValidationInfo()
    }

    /**
     * 
     * @returns {IVectorView<UpdateScanRecord>} 
     */
    get_ScanResults() {
        if (!this.HasProp("__IUpdateRecipeNodeValidationInfoRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateRecipeNodeValidationInfoRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateRecipeNodeValidationInfoRecord := IUpdateRecipeNodeValidationInfoRecord(outPtr)
        }

        return this.__IUpdateRecipeNodeValidationInfoRecord.get_ScanResults()
    }

;@endregion Instance Methods
}
