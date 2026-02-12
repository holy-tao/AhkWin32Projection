#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateTaskResult.ahk
#Include .\IUpdateTaskResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateTaskResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Boolean} succeeded 
     * @param {HSTRING} reason 
     * @returns {UpdateTaskResult} 
     */
    static CreateInstance(succeeded, reason) {
        if (!UpdateTaskResult.HasProp("__IUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateTaskResultFactory.IID)
            UpdateTaskResult.__IUpdateTaskResultFactory := IUpdateTaskResultFactory(factoryPtr)
        }

        return UpdateTaskResult.__IUpdateTaskResultFactory.CreateInstance(succeeded, reason)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {HSTRING} reason 
     * @param {Integer} errorCode 
     * @returns {UpdateTaskResult} 
     */
    static CreateInstance2(succeeded, reason, errorCode) {
        if (!UpdateTaskResult.HasProp("__IUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateTaskResultFactory.IID)
            UpdateTaskResult.__IUpdateTaskResultFactory := IUpdateTaskResultFactory(factoryPtr)
        }

        return UpdateTaskResult.__IUpdateTaskResultFactory.CreateInstance2(succeeded, reason, errorCode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
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
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateTaskResult := IUpdateTaskResult(outPtr)
        }

        return this.__IUpdateTaskResult.get_Succeeded()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Reason() {
        if (!this.HasProp("__IUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateTaskResult := IUpdateTaskResult(outPtr)
        }

        return this.__IUpdateTaskResult.get_Reason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateTaskResult := IUpdateTaskResult(outPtr)
        }

        return this.__IUpdateTaskResult.get_ErrorCode()
    }

;@endregion Instance Methods
}
