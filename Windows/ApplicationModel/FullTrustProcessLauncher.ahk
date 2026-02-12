#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFullTrustProcessLauncherStatics2.ahk
#Include .\IFullTrustProcessLauncherStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Activate the full-trust Win32 component of an application from a Universal Windows app component in the same application package.
 * @remarks
 * The methods in this class may only be called by packages that have the **runFullTrust** capability. See [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
 * 
 * To use this class, we recommend that you add a **Windows Application Packaging Project** to your solution ([Learn more](/windows/uwp/porting/desktop-to-uwp-packaging-dot-net)). Then, in the package manifest of that project, add the ``windows.fullTrustProcess`` extension.
 * 
 * Here's an example.
 * 
 * ```xml
 * <Package xmlns="http://schemas.microsoft.com/appx/manifest/foundation/windows10"
 *          xmlns:uap="http://schemas.microsoft.com/appx/manifest/uap/windows10"
 *          xmlns:rescap=
 * "http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"
 *          xmlns:desktop="http://schemas.microsoft.com/appx/manifest/desktop/windows10">
 *   ...
 *   <Capabilities>
 *     <rescap:Capability Name="runFullTrust"/>
 *   </Capabilities>
 *   <Applications>
 *     …
 *     <Application>
 *       …
 *       <Extensions>
 *         <desktop:Extension Category="windows.fullTrustProcess" Executable="fulltrustprocess.exe">
 *           <desktop:FullTrustProcess>
 *             <desktop:ParameterGroup GroupId="SyncGroup" Parameters="/Sync"/>
 *             <desktop:ParameterGroup GroupId="OtherGroup" Parameters="/Other"/>
 *           </desktop:FullTrustProcess>
 *         </desktop:Extension>
 *       </Extensions>
 *     </Application>
 *   </Applications>
 * </Package>
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class FullTrustProcessLauncher extends IInspectable {
;@region Static Methods
    /**
     * Launch the full-trust process with the specified command line parameters.
     * @param {HSTRING} commandLine The command line arguments with which to launch the process.
     * @returns {IAsyncOperation<FullTrustProcessLaunchResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforcurrentappwithargumentsasync
     */
    static LaunchFullTrustProcessForCurrentAppWithArgumentsAsync(commandLine) {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics2.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics2 := IFullTrustProcessLauncherStatics2(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics2.LaunchFullTrustProcessForCurrentAppWithArgumentsAsync(commandLine)
    }

    /**
     * Launch the full-trust process for the specified application ID with the specified command line parameters.
     * @param {HSTRING} fullTrustPackageRelativeAppId The process-relative application identifier of the app whose full trust process component the caller wants to launch. The full-trust process can parse this to determine which app invoked it.
     * @param {HSTRING} commandLine The command line arguments with which to launch the process.
     * @returns {IAsyncOperation<FullTrustProcessLaunchResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforappwithargumentsasync
     */
    static LaunchFullTrustProcessForAppWithArgumentsAsync(fullTrustPackageRelativeAppId, commandLine) {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics2.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics2 := IFullTrustProcessLauncherStatics2(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics2.LaunchFullTrustProcessForAppWithArgumentsAsync(fullTrustPackageRelativeAppId, commandLine)
    }

    /**
     * Launch the full-trust process for the current application ID, with parameters.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforcurrentappasync
     */
    static LaunchFullTrustProcessForCurrentAppAsync() {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics := IFullTrustProcessLauncherStatics(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics.LaunchFullTrustProcessForCurrentAppAsync()
    }

    /**
     * Launch the full-trust process for the current application ID.
     * @param {HSTRING} parameterGroupId 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforcurrentappasync
     */
    static LaunchFullTrustProcessForCurrentAppWithParametersAsync(parameterGroupId) {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics := IFullTrustProcessLauncherStatics(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics.LaunchFullTrustProcessForCurrentAppWithParametersAsync(parameterGroupId)
    }

    /**
     * Launch the full-trust process for the specified application ID, with parameters.
     * @param {HSTRING} fullTrustPackageRelativeAppId The process relative application identifier of the app whose full trust process component the caller wants to launch. The full-trust process can parse this to determine which app invoked it.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforappasync
     */
    static LaunchFullTrustProcessForAppAsync(fullTrustPackageRelativeAppId) {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics := IFullTrustProcessLauncherStatics(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics.LaunchFullTrustProcessForAppAsync(fullTrustPackageRelativeAppId)
    }

    /**
     * Launch the full-trust process for the specified application ID.
     * @param {HSTRING} fullTrustPackageRelativeAppId The process relative application identifier of the app whose full trust process component the caller wants to launch. The full-trust process can parse this to determine which app invoked it.
     * @param {HSTRING} parameterGroupId 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.fulltrustprocesslauncher.launchfulltrustprocessforappasync
     */
    static LaunchFullTrustProcessForAppWithParametersAsync(fullTrustPackageRelativeAppId, parameterGroupId) {
        if (!FullTrustProcessLauncher.HasProp("__IFullTrustProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.FullTrustProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFullTrustProcessLauncherStatics.IID)
            FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics := IFullTrustProcessLauncherStatics(factoryPtr)
        }

        return FullTrustProcessLauncher.__IFullTrustProcessLauncherStatics.LaunchFullTrustProcessForAppWithParametersAsync(fullTrustPackageRelativeAppId, parameterGroupId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
