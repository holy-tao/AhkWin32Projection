#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStageUpdateTaskResult.ahk
#Include .\IStageUpdateTaskResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class StageUpdateTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStageUpdateTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStageUpdateTaskResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {IVectorView<UpdateStageRecord>} stageRecords 
     * @returns {StageUpdateTaskResult} 
     */
    static CreateInstance(result_, stageRecords) {
        if (!StageUpdateTaskResult.HasProp("__IStageUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.StageUpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStageUpdateTaskResultFactory.IID)
            StageUpdateTaskResult.__IStageUpdateTaskResultFactory := IStageUpdateTaskResultFactory(factoryPtr)
        }

        return StageUpdateTaskResult.__IStageUpdateTaskResultFactory.CreateInstance(result_, stageRecords)
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
     * @type {IVectorView<UpdateStageRecord>} 
     */
    StageRecords {
        get => this.get_StageRecords()
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
        if (!this.HasProp("__IStageUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IStageUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStageUpdateTaskResult := IStageUpdateTaskResult(outPtr)
        }

        return this.__IStageUpdateTaskResult.get_Result()
    }

    /**
     * 
     * @returns {IVectorView<UpdateStageRecord>} 
     */
    get_StageRecords() {
        if (!this.HasProp("__IStageUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IStageUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStageUpdateTaskResult := IStageUpdateTaskResult(outPtr)
        }

        return this.__IStageUpdateTaskResult.get_StageRecords()
    }

;@endregion Instance Methods
}
