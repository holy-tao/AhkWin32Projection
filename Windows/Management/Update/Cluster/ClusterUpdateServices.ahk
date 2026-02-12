#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClusterUpdateServices.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ClusterUpdateServices extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClusterUpdateServices

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClusterUpdateServices.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} level 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    WriteLogEntry(level, message) {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.WriteLogEntry(level, message)
    }

    /**
     * 
     * @param {Integer} currentStep 
     * @param {Integer} maxSteps 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    ReportProgress(currentStep, maxSteps, message) {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.ReportProgress(currentStep, maxSteps, message)
    }

    /**
     * 
     * @param {HSTRING} credentialId 
     * @returns {UpdateCredential} 
     */
    GetPluginCredential(credentialId) {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.GetPluginCredential(credentialId)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsOperationMarkedAsCanceled() {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.IsOperationMarkedAsCanceled()
    }

    /**
     * 
     * @param {HSTRING} persistentInformation 
     * @returns {HRESULT} 
     */
    SaveRunStateInformation(persistentInformation) {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.SaveRunStateInformation(persistentInformation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetRunStateInformation() {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.GetRunStateInformation()
    }

    /**
     * 
     * @param {HSTRING} persistentInformation 
     * @returns {HRESULT} 
     */
    SaveRunIndependentInformation(persistentInformation) {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.SaveRunIndependentInformation(persistentInformation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetRunIndependentInformation() {
        if (!this.HasProp("__IClusterUpdateServices")) {
            if ((queryResult := this.QueryInterface(IClusterUpdateServices.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClusterUpdateServices := IClusterUpdateServices(outPtr)
        }

        return this.__IClusterUpdateServices.GetRunIndependentInformation()
    }

;@endregion Instance Methods
}
