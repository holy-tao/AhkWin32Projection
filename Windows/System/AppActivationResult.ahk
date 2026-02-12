#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppActivationResult.ahk
#Include ..\..\Guid.ahk

/**
 * Gets the result of activating an app via [AppDiagnosticInfo.LaunchAsync](appdiagnosticinfo_launchasync_79233887.md).
 * @remarks
 * On success, [AppActivationResult.AppResourceGroupInfo](appactivationresult_appresourcegroupinfo.md) will correspond to the newly-activated app instance.
 * On failure, [AppActivationResult.ExtendedError](appactivationresult_extendederror.md) will be set appropriately, and [AppActivationResult.AppResourceGroupInfo](appactivationresult_appresourcegroupinfo.md) will be `null`.
 * @see https://learn.microsoft.com/uwp/api/windows.system.appactivationresult
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppActivationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppActivationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppActivationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error information, if any, that may have resulted from trying to activate the app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appactivationresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets diagnostic information, such as memory and energy use, for the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appactivationresult.appresourcegroupinfo
     * @type {AppResourceGroupInfo} 
     */
    AppResourceGroupInfo {
        get => this.get_AppResourceGroupInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAppActivationResult")) {
            if ((queryResult := this.QueryInterface(IAppActivationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppActivationResult := IAppActivationResult(outPtr)
        }

        return this.__IAppActivationResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {AppResourceGroupInfo} 
     */
    get_AppResourceGroupInfo() {
        if (!this.HasProp("__IAppActivationResult")) {
            if ((queryResult := this.QueryInterface(IAppActivationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppActivationResult := IAppActivationResult(outPtr)
        }

        return this.__IAppActivationResult.get_AppResourceGroupInfo()
    }

;@endregion Instance Methods
}
