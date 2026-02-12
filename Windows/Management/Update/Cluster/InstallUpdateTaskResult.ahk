#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInstallUpdateTaskResult.ahk
#Include .\IInstallUpdateTaskResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class InstallUpdateTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInstallUpdateTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInstallUpdateTaskResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {IVectorView<UpdateInstallRecord>} installRecords 
     * @param {Boolean} shouldRollback 
     * @returns {InstallUpdateTaskResult} 
     */
    static CreateInstance(result_, installRecords, shouldRollback) {
        if (!InstallUpdateTaskResult.HasProp("__IInstallUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.InstallUpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInstallUpdateTaskResultFactory.IID)
            InstallUpdateTaskResult.__IInstallUpdateTaskResultFactory := IInstallUpdateTaskResultFactory(factoryPtr)
        }

        return InstallUpdateTaskResult.__IInstallUpdateTaskResultFactory.CreateInstance(result_, installRecords, shouldRollback)
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
     * @type {IVectorView<UpdateInstallRecord>} 
     */
    InstallRecords {
        get => this.get_InstallRecords()
    }

    /**
     * @type {Boolean} 
     */
    ShouldRollback {
        get => this.get_ShouldRollback()
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
        if (!this.HasProp("__IInstallUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IInstallUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstallUpdateTaskResult := IInstallUpdateTaskResult(outPtr)
        }

        return this.__IInstallUpdateTaskResult.get_Result()
    }

    /**
     * 
     * @returns {IVectorView<UpdateInstallRecord>} 
     */
    get_InstallRecords() {
        if (!this.HasProp("__IInstallUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IInstallUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstallUpdateTaskResult := IInstallUpdateTaskResult(outPtr)
        }

        return this.__IInstallUpdateTaskResult.get_InstallRecords()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldRollback() {
        if (!this.HasProp("__IInstallUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IInstallUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstallUpdateTaskResult := IInstallUpdateTaskResult(outPtr)
        }

        return this.__IInstallUpdateTaskResult.get_ShouldRollback()
    }

;@endregion Instance Methods
}
