#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the visibility of the function instance's data.
 * @remarks
 * All data operations and function instances are stored in HKEY_LOCAL_MACHINE. Access to a function instance or its data with system-wide visibility must be performed with Administrator access permissions.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-systemvisibilityflags
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class SystemVisibilityFlags extends Win32Enum{

    /**
     * The function instance's data is available to all users on the system.
     * @type {Integer (Int32)}
     */
    static SVF_SYSTEM => 0

    /**
     * The function instance's data is accessible only to the current user.
     * @type {Integer (Int32)}
     */
    static SVF_USER => 1
}
