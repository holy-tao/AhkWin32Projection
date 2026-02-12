#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRightTappedEventArgs.ahk
#Include .\IRightTappedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [RightTapped](gesturerecognizer_righttapped.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [RightTapped](gesturerecognizer_righttapped.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.righttappedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RightTappedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRightTappedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRightTappedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.righttappedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the touch, mouse, or pen/stylus contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.righttappedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the number of contact points at the time the [RightTapped](gesturerecognizer_righttapped.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.righttappedeventargs.contactcount
     * @type {Integer} 
     */
    ContactCount {
        get => this.get_ContactCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRightTappedEventArgs := IRightTappedEventArgs(outPtr)
        }

        return this.__IRightTappedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRightTappedEventArgs := IRightTappedEventArgs(outPtr)
        }

        return this.__IRightTappedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IRightTappedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRightTappedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRightTappedEventArgs2 := IRightTappedEventArgs2(outPtr)
        }

        return this.__IRightTappedEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
