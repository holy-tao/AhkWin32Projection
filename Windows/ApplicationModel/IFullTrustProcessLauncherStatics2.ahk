#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\FullTrustProcessLaunchResult.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IFullTrustProcessLauncherStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullTrustProcessLauncherStatics2
     * @type {Guid}
     */
    static IID => Guid("{8b8ed72f-b65c-56cf-a1a7-2bf77cbc6ea8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchFullTrustProcessForCurrentAppWithArgumentsAsync", "LaunchFullTrustProcessForAppWithArgumentsAsync"]

    /**
     * 
     * @param {HSTRING} commandLine 
     * @returns {IAsyncOperation<FullTrustProcessLaunchResult>} 
     */
    LaunchFullTrustProcessForCurrentAppWithArgumentsAsync(commandLine) {
        if(commandLine is String) {
            pin := HSTRING.Create(commandLine)
            commandLine := pin.Value
        }
        commandLine := commandLine is Win32Handle ? NumGet(commandLine, "ptr") : commandLine

        result := ComCall(6, this, "ptr", commandLine, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FullTrustProcessLaunchResult, operation)
    }

    /**
     * 
     * @param {HSTRING} fullTrustPackageRelativeAppId 
     * @param {HSTRING} commandLine 
     * @returns {IAsyncOperation<FullTrustProcessLaunchResult>} 
     */
    LaunchFullTrustProcessForAppWithArgumentsAsync(fullTrustPackageRelativeAppId, commandLine) {
        if(fullTrustPackageRelativeAppId is String) {
            pin := HSTRING.Create(fullTrustPackageRelativeAppId)
            fullTrustPackageRelativeAppId := pin.Value
        }
        fullTrustPackageRelativeAppId := fullTrustPackageRelativeAppId is Win32Handle ? NumGet(fullTrustPackageRelativeAppId, "ptr") : fullTrustPackageRelativeAppId
        if(commandLine is String) {
            pin := HSTRING.Create(commandLine)
            commandLine := pin.Value
        }
        commandLine := commandLine is Win32Handle ? NumGet(commandLine, "ptr") : commandLine

        result := ComCall(7, this, "ptr", fullTrustPackageRelativeAppId, "ptr", commandLine, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FullTrustProcessLaunchResult, operation)
    }
}
