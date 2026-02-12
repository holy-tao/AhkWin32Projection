#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClassicAppManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A static class that is used to find installed classic desktop apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.preview.classicappmanager
 * @namespace Windows.Management.Deployment.Preview
 * @version WindowsRuntime 1.4
 */
class ClassicAppManager extends IInspectable {
;@region Static Methods
    /**
     * Finds and returns info for an installed classic desktop app.
     * @param {HSTRING} appUninstallKey The uninstall registry key for the app.
     * 
     * [Uninstall registry keys](/windows/desktop/Msi/uninstall-registry-key) can be found at: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall
     * @returns {InstalledClassicAppInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.preview.classicappmanager.findinstalledapp
     */
    static FindInstalledApp(appUninstallKey) {
        if (!ClassicAppManager.HasProp("__IClassicAppManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.Preview.ClassicAppManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClassicAppManagerStatics.IID)
            ClassicAppManager.__IClassicAppManagerStatics := IClassicAppManagerStatics(factoryPtr)
        }

        return ClassicAppManager.__IClassicAppManagerStatics.FindInstalledApp(appUninstallKey)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
