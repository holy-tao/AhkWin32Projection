#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IFullTrustProcessLauncherStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullTrustProcessLauncherStatics
     * @type {Guid}
     */
    static IID => Guid("{d784837f-1100-3c6b-a455-f6262cc331b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchFullTrustProcessForCurrentAppAsync", "LaunchFullTrustProcessForCurrentAppWithParametersAsync", "LaunchFullTrustProcessForAppAsync", "LaunchFullTrustProcessForAppWithParametersAsync"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    LaunchFullTrustProcessForCurrentAppAsync() {
        result := ComCall(6, this, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} parameterGroupId 
     * @returns {IAsyncAction} 
     */
    LaunchFullTrustProcessForCurrentAppWithParametersAsync(parameterGroupId) {
        if(parameterGroupId is String) {
            pin := HSTRING.Create(parameterGroupId)
            parameterGroupId := pin.Value
        }
        parameterGroupId := parameterGroupId is Win32Handle ? NumGet(parameterGroupId, "ptr") : parameterGroupId

        result := ComCall(7, this, "ptr", parameterGroupId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} fullTrustPackageRelativeAppId 
     * @returns {IAsyncAction} 
     */
    LaunchFullTrustProcessForAppAsync(fullTrustPackageRelativeAppId) {
        if(fullTrustPackageRelativeAppId is String) {
            pin := HSTRING.Create(fullTrustPackageRelativeAppId)
            fullTrustPackageRelativeAppId := pin.Value
        }
        fullTrustPackageRelativeAppId := fullTrustPackageRelativeAppId is Win32Handle ? NumGet(fullTrustPackageRelativeAppId, "ptr") : fullTrustPackageRelativeAppId

        result := ComCall(8, this, "ptr", fullTrustPackageRelativeAppId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @param {HSTRING} fullTrustPackageRelativeAppId 
     * @param {HSTRING} parameterGroupId 
     * @returns {IAsyncAction} 
     */
    LaunchFullTrustProcessForAppWithParametersAsync(fullTrustPackageRelativeAppId, parameterGroupId) {
        if(fullTrustPackageRelativeAppId is String) {
            pin := HSTRING.Create(fullTrustPackageRelativeAppId)
            fullTrustPackageRelativeAppId := pin.Value
        }
        fullTrustPackageRelativeAppId := fullTrustPackageRelativeAppId is Win32Handle ? NumGet(fullTrustPackageRelativeAppId, "ptr") : fullTrustPackageRelativeAppId
        if(parameterGroupId is String) {
            pin := HSTRING.Create(parameterGroupId)
            parameterGroupId := pin.Value
        }
        parameterGroupId := parameterGroupId is Win32Handle ? NumGet(parameterGroupId, "ptr") : parameterGroupId

        result := ComCall(9, this, "ptr", fullTrustPackageRelativeAppId, "ptr", parameterGroupId, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }
}
