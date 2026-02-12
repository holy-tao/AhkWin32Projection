#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAcquireEnvironmentInfoResult.ahk
#Include .\IAcquireEnvironmentInfoResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class AcquireEnvironmentInfoResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAcquireEnvironmentInfoResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAcquireEnvironmentInfoResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {HSTRING} environmentInfo 
     * @returns {AcquireEnvironmentInfoResult} 
     */
    static CreateInstance(result_, environmentInfo) {
        if (!AcquireEnvironmentInfoResult.HasProp("__IAcquireEnvironmentInfoResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.AcquireEnvironmentInfoResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcquireEnvironmentInfoResultFactory.IID)
            AcquireEnvironmentInfoResult.__IAcquireEnvironmentInfoResultFactory := IAcquireEnvironmentInfoResultFactory(factoryPtr)
        }

        return AcquireEnvironmentInfoResult.__IAcquireEnvironmentInfoResultFactory.CreateInstance(result_, environmentInfo)
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
     * @type {HSTRING} 
     */
    EnvironmentInfo {
        get => this.get_EnvironmentInfo()
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
        if (!this.HasProp("__IAcquireEnvironmentInfoResult")) {
            if ((queryResult := this.QueryInterface(IAcquireEnvironmentInfoResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcquireEnvironmentInfoResult := IAcquireEnvironmentInfoResult(outPtr)
        }

        return this.__IAcquireEnvironmentInfoResult.get_Result()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnvironmentInfo() {
        if (!this.HasProp("__IAcquireEnvironmentInfoResult")) {
            if ((queryResult := this.QueryInterface(IAcquireEnvironmentInfoResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcquireEnvironmentInfoResult := IAcquireEnvironmentInfoResult(outPtr)
        }

        return this.__IAcquireEnvironmentInfoResult.get_EnvironmentInfo()
    }

;@endregion Instance Methods
}
