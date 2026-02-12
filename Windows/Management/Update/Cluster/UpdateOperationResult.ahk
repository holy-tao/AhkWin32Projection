#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateOperationResult.ahk
#Include .\IUpdateOperationResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateOperationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateOperationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateOperationResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} status_ 
     * @param {HSTRING} reason 
     * @returns {UpdateOperationResult} 
     */
    static CreateInstance(status_, reason) {
        if (!UpdateOperationResult.HasProp("__IUpdateOperationResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateOperationResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateOperationResultFactory.IID)
            UpdateOperationResult.__IUpdateOperationResultFactory := IUpdateOperationResultFactory(factoryPtr)
        }

        return UpdateOperationResult.__IUpdateOperationResultFactory.CreateInstance(status_, reason)
    }

    /**
     * 
     * @param {Integer} status_ 
     * @param {HSTRING} reason 
     * @param {Integer} errorCode 
     * @returns {UpdateOperationResult} 
     */
    static CreateInstance2(status_, reason, errorCode) {
        if (!UpdateOperationResult.HasProp("__IUpdateOperationResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateOperationResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateOperationResultFactory.IID)
            UpdateOperationResult.__IUpdateOperationResultFactory := IUpdateOperationResultFactory(factoryPtr)
        }

        return UpdateOperationResult.__IUpdateOperationResultFactory.CreateInstance2(status_, reason, errorCode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {HSTRING} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        if (!this.HasProp("__IUpdateOperationResult")) {
            if ((queryResult := this.QueryInterface(IUpdateOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateOperationResult := IUpdateOperationResult(outPtr)
        }

        return this.__IUpdateOperationResult.get_StatusCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Reason() {
        if (!this.HasProp("__IUpdateOperationResult")) {
            if ((queryResult := this.QueryInterface(IUpdateOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateOperationResult := IUpdateOperationResult(outPtr)
        }

        return this.__IUpdateOperationResult.get_Reason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IUpdateOperationResult")) {
            if ((queryResult := this.QueryInterface(IUpdateOperationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateOperationResult := IUpdateOperationResult(outPtr)
        }

        return this.__IUpdateOperationResult.get_ErrorCode()
    }

;@endregion Instance Methods
}
