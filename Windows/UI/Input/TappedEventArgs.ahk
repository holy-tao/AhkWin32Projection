#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITappedEventArgs.ahk
#Include .\ITappedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [Tapped](gesturerecognizer_tapped.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [Tapped](gesturerecognizer_tapped.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.tappedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class TappedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITappedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITappedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.tappedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the touch, mouse, or pen/stylus contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.tappedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the number of times the tap interaction was detected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.tappedeventargs.tapcount
     * @type {Integer} 
     */
    TapCount {
        get => this.get_TapCount()
    }

    /**
     * Gets the number of contact points at the time the [Tapped](gesturerecognizer_tapped.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.tappedeventargs.contactcount
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
        if (!this.HasProp("__ITappedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedEventArgs := ITappedEventArgs(outPtr)
        }

        return this.__ITappedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__ITappedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedEventArgs := ITappedEventArgs(outPtr)
        }

        return this.__ITappedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapCount() {
        if (!this.HasProp("__ITappedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedEventArgs := ITappedEventArgs(outPtr)
        }

        return this.__ITappedEventArgs.get_TapCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__ITappedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ITappedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITappedEventArgs2 := ITappedEventArgs2(outPtr)
        }

        return this.__ITappedEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
