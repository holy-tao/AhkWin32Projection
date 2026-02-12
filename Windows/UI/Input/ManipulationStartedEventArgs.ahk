#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IManipulationStartedEventArgs.ahk
#Include .\IManipulationStartedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ManipulationStarted](gesturerecognizer_manipulationstarted.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [ManipulationStarted](gesturerecognizer_manipulationstarted.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationstartedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationstartedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the pointer associated with the manipulation for the last manipulation event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationstartedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets values that indicate the accumulated transformation deltas (translation, rotation, scale) for a manipulation before the [ManipulationStarted](gesturerecognizer_manipulationstarted.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationstartedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets the number of contact points at the time the [ManipulationStarted](gesturerecognizer_manipulationstarted.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationstartedeventargs.contactcount
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
        if (!this.HasProp("__IManipulationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedEventArgs := IManipulationStartedEventArgs(outPtr)
        }

        return this.__IManipulationStartedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedEventArgs := IManipulationStartedEventArgs(outPtr)
        }

        return this.__IManipulationStartedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedEventArgs := IManipulationStartedEventArgs(outPtr)
        }

        return this.__IManipulationStartedEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IManipulationStartedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedEventArgs2 := IManipulationStartedEventArgs2(outPtr)
        }

        return this.__IManipulationStartedEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
