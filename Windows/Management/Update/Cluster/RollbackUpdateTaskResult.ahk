#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRollbackUpdateTaskResult.ahk
#Include .\IRollbackUpdateTaskResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class RollbackUpdateTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRollbackUpdateTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRollbackUpdateTaskResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {IVectorView<UpdateInstallRecord>} installRecords 
     * @returns {RollbackUpdateTaskResult} 
     */
    static CreateInstance(result_, installRecords) {
        if (!RollbackUpdateTaskResult.HasProp("__IRollbackUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.RollbackUpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRollbackUpdateTaskResultFactory.IID)
            RollbackUpdateTaskResult.__IRollbackUpdateTaskResultFactory := IRollbackUpdateTaskResultFactory(factoryPtr)
        }

        return RollbackUpdateTaskResult.__IRollbackUpdateTaskResultFactory.CreateInstance(result_, installRecords)
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
        if (!this.HasProp("__IRollbackUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IRollbackUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRollbackUpdateTaskResult := IRollbackUpdateTaskResult(outPtr)
        }

        return this.__IRollbackUpdateTaskResult.get_Result()
    }

    /**
     * 
     * @returns {IVectorView<UpdateInstallRecord>} 
     */
    get_InstallRecords() {
        if (!this.HasProp("__IRollbackUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IRollbackUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRollbackUpdateTaskResult := IRollbackUpdateTaskResult(outPtr)
        }

        return this.__IRollbackUpdateTaskResult.get_InstallRecords()
    }

;@endregion Instance Methods
}
