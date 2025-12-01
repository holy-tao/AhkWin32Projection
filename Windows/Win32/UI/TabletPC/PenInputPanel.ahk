#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PenInputPanel object enables you to easily add in-place pen input to your applications.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * @see https://learn.microsoft.com/windows/win32/tablet/peninputpanel-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PenInputPanel extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
