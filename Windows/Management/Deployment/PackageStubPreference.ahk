#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents whether an app [Package](/uwp/api/windows.applicationmodel.package) currently prefers to run as a full app or a stub app.
 * @remarks
 * > [!NOTE]
 * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagestubpreference
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageStubPreference extends Win32Enum{

    /**
     * The app package currently prefers to run as a full app.
     * @type {Integer (Int32)}
     */
    static Full => 0

    /**
     * The app package currently prefers to run as a stub app.
     * @type {Integer (Int32)}
     */
    static Stub => 1
}
