#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * VirtualDesktopManager implements the IVirtualDesktopManager interface.
 * @remarks
 * Use this interface in order to interact with the virtual desktops and control where program windows are launched. For more information, see [**IVirtualDesktopManager**](/windows/win32/api/shobjidl_core/nn-shobjidl_core-ivirtualdesktopmanager).
 * @see https://learn.microsoft.com/windows/win32/shell/virtualdesktopmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class VirtualDesktopManager extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
