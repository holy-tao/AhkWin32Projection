#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables apps to determine whether they are running in a Windows Defender Application Guard container (VM container environment).
 * @see https://docs.microsoft.com/windows/win32/api//isolatedapplauncher/nn-isolatedapplauncher-iisolatedapplauncher
 * @namespace Windows.Win32.Security.Isolation
 * @version v4.0.30319
 */
class IIsolatedAppLauncher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedAppLauncher
     * @type {Guid}
     */
    static IID => Guid("{f686878f-7b42-4cc4-96fb-f4f3b6e3d24d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Launch"]

    /**
     * 
     * @param {PWSTR} appUserModelId 
     * @param {PWSTR} arguments 
     * @param {Pointer<IsolatedAppLauncherTelemetryParameters>} telemetryParameters 
     * @returns {HRESULT} 
     */
    Launch(appUserModelId, arguments, telemetryParameters) {
        appUserModelId := appUserModelId is String ? StrPtr(appUserModelId) : appUserModelId
        arguments := arguments is String ? StrPtr(arguments) : arguments

        result := ComCall(3, this, "ptr", appUserModelId, "ptr", arguments, "ptr", telemetryParameters, "HRESULT")
        return result
    }
}
