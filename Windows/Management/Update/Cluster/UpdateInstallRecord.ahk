#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateInstallRecord.ahk
#Include .\IUpdateInstallRecordFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateInstallRecord extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateInstallRecord

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateInstallRecord.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} updateId 
     * @param {Boolean} isRebootRequired 
     * @param {Integer} status_ 
     * @param {HSTRING} failureMessage 
     * @returns {UpdateInstallRecord} 
     */
    static CreateInstance(updateId, isRebootRequired, status_, failureMessage) {
        if (!UpdateInstallRecord.HasProp("__IUpdateInstallRecordFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateInstallRecord")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateInstallRecordFactory.IID)
            UpdateInstallRecord.__IUpdateInstallRecordFactory := IUpdateInstallRecordFactory(factoryPtr)
        }

        return UpdateInstallRecord.__IUpdateInstallRecordFactory.CreateInstance(updateId, isRebootRequired, status_, failureMessage)
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
     * @type {Boolean} 
     */
    IsRebootRequired {
        get => this.get_IsRebootRequired()
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
        if (!this.HasProp("__IUpdateInstallRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateInstallRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateInstallRecord := IUpdateInstallRecord(outPtr)
        }

        return this.__IUpdateInstallRecord.get_UpdateId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRebootRequired() {
        if (!this.HasProp("__IUpdateInstallRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateInstallRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateInstallRecord := IUpdateInstallRecord(outPtr)
        }

        return this.__IUpdateInstallRecord.get_IsRebootRequired()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IUpdateInstallRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateInstallRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateInstallRecord := IUpdateInstallRecord(outPtr)
        }

        return this.__IUpdateInstallRecord.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FailureMessage() {
        if (!this.HasProp("__IUpdateInstallRecord")) {
            if ((queryResult := this.QueryInterface(IUpdateInstallRecord.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateInstallRecord := IUpdateInstallRecord(outPtr)
        }

        return this.__IUpdateInstallRecord.get_FailureMessage()
    }

;@endregion Instance Methods
}
