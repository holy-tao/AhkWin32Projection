#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IManipulationCompletedEventArgs.ahk
#Include .\IManipulationCompletedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the pointer associated with the manipulation for the last manipulation event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets values that indicate the accumulated transformation deltas (translation, rotation, scale) of a completed manipulation (from the start of the manipulation to the end of inertia).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets values that indicate the velocities of the transformation deltas (translation, rotation, scale) for a manipulation at the [ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event.
     * @remarks
     * Velocity is the distance an object travels in a specified direction during a unit of time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.velocities
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * Gets the number of contact points at the time the [ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event is recognized.
     * @remarks
     * [CurrentContactCount](manipulationcompletedeventargs_currentcontactcount.md) returns the number of active contacts. This number might or might not be equal to ContactCount as contacts can be added or removed after the manipulation starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.contactcount
     * @type {Integer} 
     */
    ContactCount {
        get => this.get_ContactCount()
    }

    /**
     * Gets the current number of contact points for the ongoing [Windows.UI.Input.GestureRecognizer.ManipulationCompleted](gesturerecognizer_manipulationcompleted.md) event.
     * @remarks
     * [ContactCount](manipulationcompletedeventargs_contactcount.md) always returns the number of contacts detected when the current manipulation started.
     * 
     * CurrentContactCount returns the number of active contacts. This number might or might not be equal to ContactCount as contacts can be added or removed after the manipulation starts.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationcompletedeventargs.currentcontactcount
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
        if (!this.HasProp("__IManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs := IManipulationCompletedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs := IManipulationCompletedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs := IManipulationCompletedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        if (!this.HasProp("__IManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs := IManipulationCompletedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedEventArgs.get_Velocities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IManipulationCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs2 := IManipulationCompletedEventArgs2(outPtr)
        }

        return this.__IManipulationCompletedEventArgs2.get_ContactCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentContactCount() {
        if (!this.HasProp("__IManipulationCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedEventArgs2 := IManipulationCompletedEventArgs2(outPtr)
        }

        return this.__IManipulationCompletedEventArgs2.get_CurrentContactCount()
    }

;@endregion Instance Methods
}
