#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Exposes methods that enable HTML pages which are hosted in a wizard extension to communicate with the wizard.
 * @see https://learn.microsoft.com/windows/win32/shell/webwizardhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class WebWizardHost extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
