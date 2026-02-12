#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAreRebootsPendingResult.ahk
#Include .\IAreRebootsPendingResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class AreRebootsPendingResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAreRebootsPendingResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAreRebootsPendingResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateOperationResult} result_ 
     * @param {Boolean} isRebootPending 
     * @returns {AreRebootsPendingResult} 
     */
    static CreateInstance(result_, isRebootPending) {
        if (!AreRebootsPendingResult.HasProp("__IAreRebootsPendingResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.AreRebootsPendingResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAreRebootsPendingResultFactory.IID)
            AreRebootsPendingResult.__IAreRebootsPendingResultFactory := IAreRebootsPendingResultFactory(factoryPtr)
        }

        return AreRebootsPendingResult.__IAreRebootsPendingResultFactory.CreateInstance(result_, isRebootPending)
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
     * @type {Boolean} 
     */
    IsRebootPending {
        get => this.get_IsRebootPending()
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
        if (!this.HasProp("__IAreRebootsPendingResult")) {
            if ((queryResult := this.QueryInterface(IAreRebootsPendingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAreRebootsPendingResult := IAreRebootsPendingResult(outPtr)
        }

        return this.__IAreRebootsPendingResult.get_Result()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRebootPending() {
        if (!this.HasProp("__IAreRebootsPendingResult")) {
            if ((queryResult := this.QueryInterface(IAreRebootsPendingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAreRebootsPendingResult := IAreRebootsPendingResult(outPtr)
        }

        return this.__IAreRebootsPendingResult.get_IsRebootPending()
    }

;@endregion Instance Methods
}
