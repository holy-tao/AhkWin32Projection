#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugPlmClient3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugPlmClient3
     * @type {Guid}
     */
    static IID => Guid("{d4a5dbd1-ca02-4d90-856a-2a92bfd0f20f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchPlmPackageForDebugWide", "LaunchPlmBgTaskForDebugWide", "QueryPlmPackageWide", "QueryPlmPackageList", "EnablePlmPackageDebugWide", "DisablePlmPackageDebugWide", "SuspendPlmPackageWide", "ResumePlmPackageWide", "TerminatePlmPackageWide", "LaunchAndDebugPlmAppWide", "ActivateAndDebugPlmBgTaskWide"]

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} Timeout 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} AppName 
     * @param {PWSTR} Arguments 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @returns {HRESULT} 
     */
    LaunchPlmPackageForDebugWide(Server, Timeout, PackageFullName, AppName, Arguments, ProcessId, ThreadId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        AppName := AppName is String ? StrPtr(AppName) : AppName
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(3, this, "uint", Server, "uint", Timeout, "ptr", PackageFullName, "ptr", AppName, "ptr", Arguments, "uint*", ProcessId, "uint*", ThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} Timeout 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} BackgroundTaskId 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @returns {HRESULT} 
     */
    LaunchPlmBgTaskForDebugWide(Server, Timeout, PackageFullName, BackgroundTaskId, ProcessId, ThreadId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        BackgroundTaskId := BackgroundTaskId is String ? StrPtr(BackgroundTaskId) : BackgroundTaskId

        result := ComCall(4, this, "uint", Server, "uint", Timeout, "ptr", PackageFullName, "ptr", BackgroundTaskId, "uint*", ProcessId, "uint*", ThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {IDebugOutputStream} Stream 
     * @returns {HRESULT} 
     */
    QueryPlmPackageWide(Server, PackageFullName, Stream) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(5, this, "uint", Server, "ptr", PackageFullName, "ptr", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {IDebugOutputStream} Stream 
     * @returns {HRESULT} 
     */
    QueryPlmPackageList(Server, Stream) {
        result := ComCall(6, this, "uint", Server, "ptr", Stream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    EnablePlmPackageDebugWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(7, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    DisablePlmPackageDebugWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(8, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    SuspendPlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(9, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    ResumePlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(10, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @returns {HRESULT} 
     */
    TerminatePlmPackageWide(Server, PackageFullName) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName

        result := ComCall(11, this, "uint", Server, "ptr", PackageFullName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} AppName 
     * @param {PWSTR} Arguments 
     * @returns {HRESULT} 
     */
    LaunchAndDebugPlmAppWide(Server, PackageFullName, AppName, Arguments) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        AppName := AppName is String ? StrPtr(AppName) : AppName
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(12, this, "uint", Server, "ptr", PackageFullName, "ptr", AppName, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} PackageFullName 
     * @param {PWSTR} BackgroundTaskId 
     * @returns {HRESULT} 
     */
    ActivateAndDebugPlmBgTaskWide(Server, PackageFullName, BackgroundTaskId) {
        PackageFullName := PackageFullName is String ? StrPtr(PackageFullName) : PackageFullName
        BackgroundTaskId := BackgroundTaskId is String ? StrPtr(BackgroundTaskId) : BackgroundTaskId

        result := ComCall(13, this, "uint", Server, "ptr", PackageFullName, "ptr", BackgroundTaskId, "HRESULT")
        return result
    }
}
