#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInstalledClassicAppInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides display info for an installed classic desktop app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.preview.installedclassicappinfo
 * @namespace Windows.Management.Deployment.Preview
 * @version WindowsRuntime 1.4
 */
class InstalledClassicAppInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInstalledClassicAppInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInstalledClassicAppInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name for an installed classic desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.preview.installedclassicappinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the display version for an installed classic desktop app.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.preview.installedclassicappinfo.displayversion
     * @type {HSTRING} 
     */
    DisplayVersion {
        get => this.get_DisplayVersion()
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
    get_DisplayName() {
        if (!this.HasProp("__IInstalledClassicAppInfo")) {
            if ((queryResult := this.QueryInterface(IInstalledClassicAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledClassicAppInfo := IInstalledClassicAppInfo(outPtr)
        }

        return this.__IInstalledClassicAppInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayVersion() {
        if (!this.HasProp("__IInstalledClassicAppInfo")) {
            if ((queryResult := this.QueryInterface(IInstalledClassicAppInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInstalledClassicAppInfo := IInstalledClassicAppInfo(outPtr)
        }

        return this.__IInstalledClassicAppInfo.get_DisplayVersion()
    }

;@endregion Instance Methods
}
