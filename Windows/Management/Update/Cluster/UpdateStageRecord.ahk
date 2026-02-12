#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateStageRecord.ahk
#Include .\IUpdateStageRecordFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateStageRecord extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateStageRecord

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateStageRecord.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} updateId 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @returns {UpdateStageRecord} 
     */
    static CreateInstance(updateId, status_, failureMessage) {
        if (!UpdateStageRecord.HasProp("__IUpdateStageRecordFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateStageRecord")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateStageRecordFactory.IID)
            UpdateStageRecord.__IUpdateStageRecordFactory := IUpdateStageRecordFactory(factoryPtr)
        }

        return UpdateStageRecord.__IUpdateStageRecordFactory.CreateInstance(updateId, status_, failureMessage)
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @param {HSTRING} updatedPluginSpecificData 
     * @returns {UpdateStageRecord} 
     */
    static CreateInstance2(updateId, status_, failureMessage, updatedPluginSpecificData) {
        if (!UpdateStageRecord.HasProp("__IUpdateStageRecordFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateStageRecord")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateStageRecordFactory.IID)
            UpdateStageRecord.__IUpdateStageRecordFactory := IUpdateStageRecordFactory(factoryPtr)
        }

        return UpdateStageRecord.__IUpdateStageRecordFactory.CreateInstance2(updateId, status_, failureMessage, updatedPluginSpecificData)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    FailureMessage {
        get => this.get_FailureMessage()
    }

    /**
     * @type {HSTRING} 
     */
    UpdatedPluginSpecificData {
        get => this.get_UpdatedPluginSpecificData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateId() {
        if (!this.HasProp("__IUpdateStageRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateStageRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateStageRecord := IUpdateStageRecord(outPtr)
        }

        return this.__IUpdateStageRecord.get_UpdateId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IUpdateStageRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateStageRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateStageRecord := IUpdateStageRecord(outPtr)
        }

        return this.__IUpdateStageRecord.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FailureMessage() {
        if (!this.HasProp("__IUpdateStageRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateStageRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateStageRecord := IUpdateStageRecord(outPtr)
        }

        return this.__IUpdateStageRecord.get_FailureMessage()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdatedPluginSpecificData() {
        if (!this.HasProp("__IUpdateStageRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateStageRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateStageRecord := IUpdateStageRecord(outPtr)
        }

        return this.__IUpdateStageRecord.get_UpdatedPluginSpecificData()
    }

;@endregion Instance Methods
}
