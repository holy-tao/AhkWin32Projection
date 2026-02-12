#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHoldingEventArgs.ahk
#Include .\IHoldingEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [Holding](gesturerecognizer_holding.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [Holding](gesturerecognizer_holding.md) event handler.
 * 
 * To support [Holding](gesturerecognizer_holding.md) with touch and pen/stylus input, specify [Hold](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
 * 
 * To support [Holding](gesturerecognizer_holding.md) with mouse input, specify [HoldWithMouse](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
 * 
 * The [Holding](gesturerecognizer_holding.md) event is fired twice: Once when holding starts ([started](holdingstate.md)) and again when holding ends ([completed](holdingstate.md) or [canceled](holdingstate.md)).
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class HoldingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHoldingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHoldingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the touch, mouse, or pen/stylus contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the state of the [Holding](gesturerecognizer_holding.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs.holdingstate
     * @type {Integer} 
     */
    HoldingState {
        get => this.get_HoldingState()
    }

    /**
     * Gets the number of contact points at the time the [Holding](gesturerecognizer_holding.md) event is recognized.
     * @remarks
     * [CurrentContactCount](holdingeventargs_currentcontactcount.md) returns the number of active contacts. This number might or might not be equal to ContactCount as contacts can be added or removed after the gesture starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs.contactcount
     * @type {Integer} 
     */
    ContactCount {
        get => this.get_ContactCount()
    }

    /**
     * Gets the current number of contact points for the ongoing [Windows.UI.Input.GestureRecognizer.Holding](gesturerecognizer_holding.md) event.
     * @remarks
     * [ContactCount](holdingeventargs_contactcount.md) always returns the number of contacts detected when the current gesture started.
     * 
     * CurrentContactCount returns the number of active contacts. This number might or might not be equal to ContactCount as contacts can be added or removed after the gesture starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingeventargs.currentcontactcount
     * @type {Integer} 
     */
    CurrentContactCount {
        get => this.get_CurrentContactCount()
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
        if (!this.HasProp("__IHoldingEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingEventArgs := IHoldingEventArgs(outPtr)
        }

        return this.__IHoldingEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IHoldingEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingEventArgs := IHoldingEventArgs(outPtr)
        }

        return this.__IHoldingEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldingState() {
        if (!this.HasProp("__IHoldingEventArgs")) {
            if ((queryResult := this.QueryInterface(IHoldingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingEventArgs := IHoldingEventArgs(outPtr)
        }

        return this.__IHoldingEventArgs.get_HoldingState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IHoldingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IHoldingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingEventArgs2 := IHoldingEventArgs2(outPtr)
        }

        return this.__IHoldingEventArgs2.get_ContactCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentContactCount() {
        if (!this.HasProp("__IHoldingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IHoldingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHoldingEventArgs2 := IHoldingEventArgs2(outPtr)
        }

        return this.__IHoldingEventArgs2.get_CurrentContactCount()
    }

;@endregion Instance Methods
}
