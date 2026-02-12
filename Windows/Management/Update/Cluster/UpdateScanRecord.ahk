#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateScanRecord.ahk
#Include .\IUpdateScanRecordFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateScanRecord extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateScanRecord

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateScanRecord.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} updateId 
     * @param {HSTRING} updateTitle 
     * @param {HSTRING} updateDescription 
     * @param {Boolean} isRebootRequired 
     * @param {HSTRING} pluginSpecificData 
     * @returns {UpdateScanRecord} 
     */
    static CreateInstance(updateId, updateTitle, updateDescription, isRebootRequired, pluginSpecificData) {
        if (!UpdateScanRecord.HasProp("__IUpdateScanRecordFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateScanRecord")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateScanRecordFactory.IID)
            UpdateScanRecord.__IUpdateScanRecordFactory := IUpdateScanRecordFactory(factoryPtr)
        }

        return UpdateScanRecord.__IUpdateScanRecordFactory.CreateInstance(updateId, updateTitle, updateDescription, isRebootRequired, pluginSpecificData)
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
     * @type {HSTRING} 
     */
    UpdateTitle {
        get => this.get_UpdateTitle()
    }

    /**
     * @type {HSTRING} 
     */
    UpdateDescription {
        get => this.get_UpdateDescription()
    }

    /**
     * @type {Boolean} 
     */
    IsRebootRequired {
        get => this.get_IsRebootRequired()
    }

    /**
     * @type {HSTRING} 
     */
    PluginSpecificData {
        get => this.get_PluginSpecificData()
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
        if (!this.HasProp("__IUpdateScanRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateScanRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateScanRecord := IUpdateScanRecord(outPtr)
        }

        return this.__IUpdateScanRecord.get_UpdateId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateTitle() {
        if (!this.HasProp("__IUpdateScanRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateScanRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateScanRecord := IUpdateScanRecord(outPtr)
        }

        return this.__IUpdateScanRecord.get_UpdateTitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateDescription() {
        if (!this.HasProp("__IUpdateScanRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateScanRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateScanRecord := IUpdateScanRecord(outPtr)
        }

        return this.__IUpdateScanRecord.get_UpdateDescription()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRebootRequired() {
        if (!this.HasProp("__IUpdateScanRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateScanRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateScanRecord := IUpdateScanRecord(outPtr)
        }

        return this.__IUpdateScanRecord.get_IsRebootRequired()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PluginSpecificData() {
        if (!this.HasProp("__IUpdateScanRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateScanRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateScanRecord := IUpdateScanRecord(outPtr)
        }

        return this.__IUpdateScanRecord.get_PluginSpecificData()
    }

;@endregion Instance Methods
}
