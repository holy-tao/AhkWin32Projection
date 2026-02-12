#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IValidateAllNodesUpdateRecipeResult.ahk
#Include .\IValidateAllNodesUpdateRecipeResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ValidateAllNodesUpdateRecipeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IValidateAllNodesUpdateRecipeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IValidateAllNodesUpdateRecipeResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {Boolean} areUpdatesApproved 
     * @param {IVectorView<UpdateValidationLogMessage>} validationMessages 
     * @returns {ValidateAllNodesUpdateRecipeResult} 
     */
    static CreateInstance(result_, areUpdatesApproved, validationMessages) {
        if (!ValidateAllNodesUpdateRecipeResult.HasProp("__IValidateAllNodesUpdateRecipeResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.ValidateAllNodesUpdateRecipeResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IValidateAllNodesUpdateRecipeResultFactory.IID)
            ValidateAllNodesUpdateRecipeResult.__IValidateAllNodesUpdateRecipeResultFactory := IValidateAllNodesUpdateRecipeResultFactory(factoryPtr)
        }

        return ValidateAllNodesUpdateRecipeResult.__IValidateAllNodesUpdateRecipeResultFactory.CreateInstance(result_, areUpdatesApproved, validationMessages)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {UpdateTaskResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {Boolean} 
     */
    AreUpdatesApproved {
        get => this.get_AreUpdatesApproved()
    }

    /**
     * @type {IVectorView<UpdateValidationLogMessage>} 
     */
    ValidationMessages {
        get => this.get_ValidationMessages()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UpdateTaskResult} 
     */
    get_Result() {
        if (!this.HasProp("__IValidateAllNodesUpdateRecipeResult")) {
            if ((queryResult := this.QueryInterface(IValidateAllNodesUpdateRecipeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateAllNodesUpdateRecipeResult := IValidateAllNodesUpdateRecipeResult(outPtr)
        }

        return this.__IValidateAllNodesUpdateRecipeResult.get_Result()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreUpdatesApproved() {
        if (!this.HasProp("__IValidateAllNodesUpdateRecipeResult")) {
            if ((queryResult := this.QueryInterface(IValidateAllNodesUpdateRecipeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateAllNodesUpdateRecipeResult := IValidateAllNodesUpdateRecipeResult(outPtr)
        }

        return this.__IValidateAllNodesUpdateRecipeResult.get_AreUpdatesApproved()
    }

    /**
     * 
     * @returns {IVectorView<UpdateValidationLogMessage>} 
     */
    get_ValidationMessages() {
        if (!this.HasProp("__IValidateAllNodesUpdateRecipeResult")) {
            if ((queryResult := this.QueryInterface(IValidateAllNodesUpdateRecipeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateAllNodesUpdateRecipeResult := IValidateAllNodesUpdateRecipeResult(outPtr)
        }

        return this.__IValidateAllNodesUpdateRecipeResult.get_ValidationMessages()
    }

;@endregion Instance Methods
}
