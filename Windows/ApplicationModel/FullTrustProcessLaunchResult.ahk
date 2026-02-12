#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFullTrustProcessLaunchResult.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the results of a full trust process launch operation.
 * @remarks
 * The following methods return an async operation that returns a **FullTrustProcessLaunchResult** on completion.
 * 
 * - [LaunchFullTrustProcessForAppWithArgumentsAsync](fulltrustprocesslauncher_launchfulltrustprocessforappwithargumentsasync_783196823.md)
 * - [LaunchFullTrustProcessForCurrentAppWithArgumentsAsync](fulltrustprocesslauncher_launchfulltrustprocessforcurrentappwithargumentsasync_1868807952.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslaunchresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class FullTrustProcessLaunchResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFullTrustProcessLaunchResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFullTrustProcessLaunchResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies the result status of the full trust process launch operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslaunchresult.launchresult
     * @type {Integer} 
     */
    LaunchResult {
        get => this.get_LaunchResult()
    }

    /**
     * Gets the extended error information returned from the full trust process launch operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslaunchresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaunchResult() {
        if (!this.HasProp("__IFullTrustProcessLaunchResult")) {
            if ((queryResult := this.QueryInterface(IFullTrustProcessLaunchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullTrustProcessLaunchResult := IFullTrustProcessLaunchResult(outPtr)
        }

        return this.__IFullTrustProcessLaunchResult.get_LaunchResult()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IFullTrustProcessLaunchResult")) {
            if ((queryResult := this.QueryInterface(IFullTrustProcessLaunchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullTrustProcessLaunchResult := IFullTrustProcessLaunchResult(outPtr)
        }

        return this.__IFullTrustProcessLaunchResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
