#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the stub behavior for an app package that is being added or staged.
 * @remarks
 * > [!NOTE]
 * > The ability for an app to run as a stub is currently available only to certain apps that are built by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.stubpackageoption
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class StubPackageOption extends Win32Enum{

    /**
     * Use the default behavior.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Install as a full app.
     * @type {Integer (Int32)}
     */
    static InstallFull => 1

    /**
     * Install as stub app.
     * @type {Integer (Int32)}
     */
    static InstallStub => 2

    /**
     * Use the current [PackageSubPreference](packagestubpreference.md) for the package.
     * @type {Integer (Int32)}
     */
    static UsePreference => 3
}
