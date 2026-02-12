#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IValidateClusterEnvironmentResult.ahk
#Include .\IValidateClusterEnvironmentResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ValidateClusterEnvironmentResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IValidateClusterEnvironmentResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IValidateClusterEnvironmentResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {Integer} approvalStatus 
     * @param {IVectorView<UpdateValidationLogMessage>} validationMessages 
     * @returns {ValidateClusterEnvironmentResult} 
     */
    static CreateInstance(result_, approvalStatus, validationMessages) {
        if (!ValidateClusterEnvironmentResult.HasProp("__IValidateClusterEnvironmentResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.ValidateClusterEnvironmentResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IValidateClusterEnvironmentResultFactory.IID)
            ValidateClusterEnvironmentResult.__IValidateClusterEnvironmentResultFactory := IValidateClusterEnvironmentResultFactory(factoryPtr)
        }

        return ValidateClusterEnvironmentResult.__IValidateClusterEnvironmentResultFactory.CreateInstance(result_, approvalStatus, validationMessages)
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
     * @type {Integer} 
     */
    ApprovalStatus {
        get => this.get_ApprovalStatus()
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
        if (!this.HasProp("__IValidateClusterEnvironmentResult")) {
            if ((queryResult := this.QueryInterface(IValidateClusterEnvironmentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateClusterEnvironmentResult := IValidateClusterEnvironmentResult(outPtr)
        }

        return this.__IValidateClusterEnvironmentResult.get_Result()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ApprovalStatus() {
        if (!this.HasProp("__IValidateClusterEnvironmentResult")) {
            if ((queryResult := this.QueryInterface(IValidateClusterEnvironmentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateClusterEnvironmentResult := IValidateClusterEnvironmentResult(outPtr)
        }

        return this.__IValidateClusterEnvironmentResult.get_ApprovalStatus()
    }

    /**
     * 
     * @returns {IVectorView<UpdateValidationLogMessage>} 
     */
    get_ValidationMessages() {
        if (!this.HasProp("__IValidateClusterEnvironmentResult")) {
            if ((queryResult := this.QueryInterface(IValidateClusterEnvironmentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValidateClusterEnvironmentResult := IValidateClusterEnvironmentResult(outPtr)
        }

        return this.__IValidateClusterEnvironmentResult.get_ValidationMessages()
    }

;@endregion Instance Methods
}
