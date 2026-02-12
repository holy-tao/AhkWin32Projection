#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * No description.
 * @remarks
 * > [!NOTE]
 * > `SecurityApp*` APIs provided functionality for [Microsoft Edge Legacy](https://support.microsoft.com/microsoft-edge/what-is-microsoft-edge-legacy-3e779e55-4c55-08e6-ecc8-2333768c0fb0). Support for Microsoft Edge Legacy has ended on March 9, 2021, so these APIs are no longer supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.securityappkind
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class SecurityAppKind extends Win32Enum{

    /**
     * No description.
     * @type {Integer (Int32)}
     */
    static WebProtection => 0
}
