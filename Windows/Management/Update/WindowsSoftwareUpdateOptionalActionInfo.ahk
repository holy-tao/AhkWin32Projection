#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateOptionalActionInfo.ahk
#Include .\IWindowsSoftwareUpdateOptionalActionInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateOptionalActionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateOptionalActionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateOptionalActionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {WindowsSoftwareUpdateActionInfo} closeAndDeployInfo 
     * @param {WindowsSoftwareUpdateActionInfo} closeAndInstallInfo 
     * @param {WindowsSoftwareUpdateActionInfo} closeAndRestartInfo 
     * @returns {WindowsSoftwareUpdateOptionalActionInfo} 
     */
    static CreateInstance(closeAndDeployInfo, closeAndInstallInfo, closeAndRestartInfo) {
        if (!WindowsSoftwareUpdateOptionalActionInfo.HasProp("__IWindowsSoftwareUpdateOptionalActionInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateOptionalActionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateOptionalActionInfoFactory.IID)
            WindowsSoftwareUpdateOptionalActionInfo.__IWindowsSoftwareUpdateOptionalActionInfoFactory := IWindowsSoftwareUpdateOptionalActionInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateOptionalActionInfo.__IWindowsSoftwareUpdateOptionalActionInfoFactory.CreateInstance(closeAndDeployInfo, closeAndInstallInfo, closeAndRestartInfo)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndDeployInfo {
        get => this.get_CloseAndDeployInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndInstallInfo {
        get => this.get_CloseAndInstallInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndRestartInfo {
        get => this.get_CloseAndRestartInfo()
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
    get_CloseAndDeployInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalActionInfo := IWindowsSoftwareUpdateOptionalActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalActionInfo.get_CloseAndDeployInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_CloseAndInstallInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalActionInfo := IWindowsSoftwareUpdateOptionalActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalActionInfo.get_CloseAndInstallInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_CloseAndRestartInfo() {
        if (!this.HasProp("__IWindowsSoftwareUpdateOptionalActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateOptionalActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateOptionalActionInfo := IWindowsSoftwareUpdateOptionalActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateOptionalActionInfo.get_CloseAndRestartInfo()
    }

;@endregion Instance Methods
}
