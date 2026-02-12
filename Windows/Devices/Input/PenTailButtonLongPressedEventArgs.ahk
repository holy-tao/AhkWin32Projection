#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenTailButtonLongPressedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [PenButtonListener.TailButtonLongPressed](penbuttonlistener_tailbuttonlongpressed.md) event.
 * @remarks
 * Due to hardware limitations, PenTailButtonLongPressedEventArgs does not expose any data at this time. This might change in future versions of Windows.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pentailbuttonlongpressedeventargs
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PenTailButtonLongPressedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenTailButtonLongPressedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenTailButtonLongPressedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
