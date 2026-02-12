#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProcessLauncherStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Starts the specified process with associated arguments, if any.
 * @remarks
 * This API requires the use of the IoT **systemManagement** capability. Users can add the following to their **Package.appmanifest**:`
 * <iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProcessLauncher extends IInspectable {
;@region Static Methods
    /**
     * Launches a new process, including the specified options. This asynchronous function completes when the launched process terminates.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * 
     * To launch a process the .exe must either be contained in the .appx package or be registered in the allow list for this API. To add an .exe to the allow list modify **HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EmbeddedMode\ProcessLauncher:AllowedExecutableFilesList** and add your executable to the REG_MULTI_SZ formatted string.
     * 
     * For example:
     * 
     * ```cmd
     *     reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EmbeddedMode\ProcessLauncher" /f /v AllowedExecutableFilesList /t REG_MULTI_SZ /d "c:\windows\system32\cmd.exe\0"
     * ```
     * @param {HSTRING} fileName File name of process to start.
     * @param {HSTRING} args Arguments for the specified process.
     * @returns {IAsyncOperation<ProcessLauncherResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncher.runtocompletionasync
     */
    static RunToCompletionAsync(fileName, args) {
        if (!ProcessLauncher.HasProp("__IProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.ProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProcessLauncherStatics.IID)
            ProcessLauncher.__IProcessLauncherStatics := IProcessLauncherStatics(factoryPtr)
        }

        return ProcessLauncher.__IProcessLauncherStatics.RunToCompletionAsync(fileName, args)
    }

    /**
     * Launches a new process. This asynchronous function completes when the launched process terminates.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * 
     * To launch a process the .exe must either be contained in the .appx package or be registered in the allow list for this API. To add an .exe to the allow list modify **HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EmbeddedMode\ProcessLauncher:AllowedExecutableFilesList** and add your executable to the REG_MULTI_SZ formatted string.
     * 
     * For example:
     * 
     * ```cmd
     *     reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EmbeddedMode\ProcessLauncher" /f /v AllowedExecutableFilesList /t REG_MULTI_SZ /d "c:\windows\system32\cmd.exe\0"
     * ```
     * @param {HSTRING} fileName The name of the process to launch.
     * @param {HSTRING} args Arguments for running the process.
     * @param {ProcessLauncherOptions} options 
     * @returns {IAsyncOperation<ProcessLauncherResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.processlauncher.runtocompletionasync
     */
    static RunToCompletionAsyncWithOptions(fileName, args, options) {
        if (!ProcessLauncher.HasProp("__IProcessLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.ProcessLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProcessLauncherStatics.IID)
            ProcessLauncher.__IProcessLauncherStatics := IProcessLauncherStatics(factoryPtr)
        }

        return ProcessLauncher.__IProcessLauncherStatics.RunToCompletionAsyncWithOptions(fileName, args, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
