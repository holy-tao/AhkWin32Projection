#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDraggingEventArgs.ahk
#Include .\IDraggingEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [Dragging](gesturerecognizer_dragging.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [Dragging](gesturerecognizer_dragging.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class DraggingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDraggingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDraggingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the mouse or pen/stylus contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the state of the [Dragging](gesturerecognizer_dragging.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingeventargs.draggingstate
     * @type {Integer} 
     */
    DraggingState {
        get => this.get_DraggingState()
    }

    /**
     * Gets the number of contact points at the time the [Dragging](gesturerecognizer_dragging.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.draggingeventargs.contactcount
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
        if (!this.HasProp("__IDraggingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDraggingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDraggingEventArgs := IDraggingEventArgs(outPtr)
        }

        return this.__IDraggingEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IDraggingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDraggingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDraggingEventArgs := IDraggingEventArgs(outPtr)
        }

        return this.__IDraggingEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DraggingState() {
        if (!this.HasProp("__IDraggingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDraggingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDraggingEventArgs := IDraggingEventArgs(outPtr)
        }

        return this.__IDraggingEventArgs.get_DraggingState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__IDraggingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDraggingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDraggingEventArgs2 := IDraggingEventArgs2(outPtr)
        }

        return this.__IDraggingEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
