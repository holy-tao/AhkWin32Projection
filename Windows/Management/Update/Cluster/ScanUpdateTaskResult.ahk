#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScanUpdateTaskResult.ahk
#Include .\IScanUpdateTaskResultFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ScanUpdateTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScanUpdateTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScanUpdateTaskResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {UpdateTaskResult} result_ 
     * @param {IVectorView<UpdateScanRecord>} scanRecords 
     * @returns {ScanUpdateTaskResult} 
     */
    static CreateInstance(result_, scanRecords) {
        if (!ScanUpdateTaskResult.HasProp("__IScanUpdateTaskResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.ScanUpdateTaskResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScanUpdateTaskResultFactory.IID)
            ScanUpdateTaskResult.__IScanUpdateTaskResultFactory := IScanUpdateTaskResultFactory(factoryPtr)
        }

        return ScanUpdateTaskResult.__IScanUpdateTaskResultFactory.CreateInstance(result_, scanRecords)
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
     * @type {IVectorView<UpdateScanRecord>} 
     */
    ScanRecords {
        get => this.get_ScanRecords()
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
        if (!this.HasProp("__IScanUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IScanUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScanUpdateTaskResult := IScanUpdateTaskResult(outPtr)
        }

        return this.__IScanUpdateTaskResult.get_Result()
    }

    /**
     * 
     * @returns {IVectorView<UpdateScanRecord>} 
     */
    get_ScanRecords() {
        if (!this.HasProp("__IScanUpdateTaskResult")) {
            if ((queryResult := this.QueryInterface(IScanUpdateTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScanUpdateTaskResult := IScanUpdateTaskResult(outPtr)
        }

        return this.__IScanUpdateTaskResult.get_ScanRecords()
    }

;@endregion Instance Methods
}
