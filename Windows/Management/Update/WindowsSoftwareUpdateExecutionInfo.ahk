#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateExecutionInfo.ahk
#Include .\IWindowsSoftwareUpdateExecutionInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateExecutionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateExecutionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateExecutionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {WindowsSoftwareUpdateActionInfo} downloadInfo 
     * @param {WindowsSoftwareUpdateActionInfo} installInfo 
     * @param {WindowsSoftwareUpdateOptionalActionInfo} actions 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     */
    static CreateInstance(downloadInfo, installInfo, actions) {
        if (!WindowsSoftwareUpdateExecutionInfo.HasProp("__IWindowsSoftwareUpdateExecutionInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateExecutionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateExecutionInfoFactory.IID)
            WindowsSoftwareUpdateExecutionInfo.__IWindowsSoftwareUpdateExecutionInfoFactory := IWindowsSoftwareUpdateExecutionInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateExecutionInfo.__IWindowsSoftwareUpdateExecutionInfoFactory.CreateInstance(downloadInfo, installInfo, actions)
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateActionInfo} deployInfo 
     * @param {WindowsSoftwareUpdateOptionalActionInfo} actions 
     * @returns {WindowsSoftwareUpdateExecutionInfo} 
     */
    static CreateInstance2(deployInfo, actions) {
        if (!WindowsSoftwareUpdateExecutionInfo.HasProp("__IWindowsSoftwareUpdateExecutionInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateExecutionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateExecutionInfoFactory.IID)
            WindowsSoftwareUpdateExecutionInfo.__IWindowsSoftwareUpdateExecutionInfoFactory := IWindowsSoftwareUpdateExecutionInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateExecutionInfo.__IWindowsSoftwareUpdateExecutionInfoFactory.CreateInstance2(deployInfo, actions)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    DownloadInfo {
        get => this.get_DownloadInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    InstallInfo {
        get => this.get_InstallInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    DeployInfo {
        get => this.get_DeployInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateOptionalActionInfo} 
     */
    OptionalActionInfo {
        get => this.get_OptionalActionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_DownloadInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateExecutionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateExecutionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateExecutionInfo := IWindowsSoftwareUpdateExecutionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateExecutionInfo.get_DownloadInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_InstallInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateExecutionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateExecutionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateExecutionInfo := IWindowsSoftwareUpdateExecutionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateExecutionInfo.get_InstallInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_DeployInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateExecutionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateExecutionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateExecutionInfo := IWindowsSoftwareUpdateExecutionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateExecutionInfo.get_DeployInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateOptionalActionInfo} 
     */
    get_OptionalActionInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateExecutionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateExecutionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateExecutionInfo := IWindowsSoftwareUpdateExecutionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateExecutionInfo.get_OptionalActionInfo()
    }

;@endregion Instance Methods
}
