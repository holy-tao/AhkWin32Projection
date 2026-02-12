#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IManipulationInertiaStartingEventArgs.ahk
#Include .\IManipulationInertiaStartingEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [GestureRecognizer.ManipulationInertiaStartingEvent](gesturerecognizer_manipulationinertiastarting.md).
 * @remarks
 * **JavaScript:** This object is accessed in a [ManipulationInertiaStarting](gesturerecognizer_manipulationinertiastarting.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationInertiaStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationInertiaStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationInertiaStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the pointer associated with the manipulation for the last manipulation event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets values that indicate the changes in the transformation deltas (translation, rotation, scale) of a manipulation since the last manipulation event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.delta
     * @type {ManipulationDelta} 
     */
    Delta {
        get => this.get_Delta()
    }

    /**
     * Gets values that indicate the accumulated transformation deltas (translation, rotation, scale) for a manipulation before inertia begins.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets values that indicate the velocities of the transformation deltas (translation, rotation, scale) for a manipulation at the [ManipulationInertiaStarting](gesturerecognizer_manipulationinertiastarting.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.velocities
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * Gets the number of contact points at the time the [ManipulationInertiaStarting](gesturerecognizer_manipulationinertiastarting.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationinertiastartingeventargs.contactcount
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
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs := IManipulationInertiaStartingEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs := IManipulationInertiaStartingEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs.get_Position()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Delta() {
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs := IManipulationInertiaStartingEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs.get_Delta()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs := IManipulationInertiaStartingEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs := IManipulationInertiaStartingEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs.get_Velocities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IManipulationInertiaStartingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingEventArgs2 := IManipulationInertiaStartingEventArgs2(outPtr)
        }

        return this.__IManipulationInertiaStartingEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
