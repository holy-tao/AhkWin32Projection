#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenUndockedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [PenDockListener.Undocked](pendocklistener_undocked.md) event.
 * @remarks
 * Due to hardware limitations, PenUndockedEventArgs does not expose any data at this time. This might change in future versions of Windows.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.penundockedeventargs
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PenUndockedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenUndockedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenUndockedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
