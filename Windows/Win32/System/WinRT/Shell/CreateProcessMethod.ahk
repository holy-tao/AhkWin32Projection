#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Shell
 * @version v4.0.30319
 */
class CreateProcessMethod extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CpCreateProcess => 0

    /**
     * @type {Integer (Int32)}
     */
    static CpCreateProcessAsUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static CpAicLaunchAdminProcess => 2
}
