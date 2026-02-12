#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdatePendingOperationResult.ahk
#Include .\IUpdatePendingOperationResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdatePendingOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdatePendingOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdatePendingOperationResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateOperationResult} result_ 
     * @param {TimeSpan} suggestedRecheckInterval 
     * @returns {UpdatePendingOperationResult} 
     */
    static CreateInstance(result_, suggestedRecheckInterval) {
        if (!UpdatePendingOperationResult.HasProp("__IUpdatePendingOperationResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdatePendingOperationResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdatePendingOperationResultFactory.IID)
            UpdatePendingOperationResult.__IUpdatePendingOperationResultFactory := IUpdatePendingOperationResultFactory(factoryPtr)
        }

        return UpdatePendingOperationResult.__IUpdatePendingOperationResultFactory.CreateInstance(result_, suggestedRecheckInterval)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {UpdateOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {TimeSpan} 
     */
    SuggestedRecheckInterval {
        get => this.get_SuggestedRecheckInterval()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UpdateOperationResult} 
     */
    get_Result() {
        if (!this.HasProp("__IUpdatePendingOperationResult")) {
            if ((queryResult := this.QueryInterface(IUpdatePendingOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdatePendingOperationResult := IUpdatePendingOperationResult(outPtr)
        }

        return this.__IUpdatePendingOperationResult.get_Result()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SuggestedRecheckInterval() {
        if (!this.HasProp("__IUpdatePendingOperationResult")) {
            if ((queryResult := this.QueryInterface(IUpdatePendingOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdatePendingOperationResult := IUpdatePendingOperationResult(outPtr)
        }

        return this.__IUpdatePendingOperationResult.get_SuggestedRecheckInterval()
    }

;@endregion Instance Methods
}
