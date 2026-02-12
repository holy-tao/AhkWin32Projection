#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICrossSlidingEventArgs.ahk
#Include .\ICrossSlidingEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [CrossSliding](gesturerecognizer_crosssliding.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [CrossSliding](gesturerecognizer_crosssliding.md) event handler.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidingeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class CrossSlidingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICrossSlidingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICrossSlidingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device type of the input source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidingeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the location of the touch contact.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidingeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the state of the [CrossSliding](gesturerecognizer_crosssliding.md) event.
     * @remarks
     * The CrossSlidingState property is set based on the distance thresholds specified by the [CrossSlideThresholds](gesturerecognizer_crossslidethresholds.md) property of a [GestureRecognizer](gesturerecognizer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidingeventargs.crossslidingstate
     * @type {Integer} 
     */
    CrossSlidingState {
        get => this.get_CrossSlidingState()
    }

    /**
     * Gets the number of contact points at the time the [CrossSliding](gesturerecognizer_crosssliding.md) event is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.crossslidingeventargs.contactcount
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
        if (!this.HasProp("__ICrossSlidingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICrossSlidingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICrossSlidingEventArgs := ICrossSlidingEventArgs(outPtr)
        }

        return this.__ICrossSlidingEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__ICrossSlidingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICrossSlidingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICrossSlidingEventArgs := ICrossSlidingEventArgs(outPtr)
        }

        return this.__ICrossSlidingEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CrossSlidingState() {
        if (!this.HasProp("__ICrossSlidingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICrossSlidingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICrossSlidingEventArgs := ICrossSlidingEventArgs(outPtr)
        }

        return this.__ICrossSlidingEventArgs.get_CrossSlidingState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContactCount() {
        if (!this.HasProp("__ICrossSlidingEventArgs2")) {
            if ((queryResult := this.QueryInterface(ICrossSlidingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICrossSlidingEventArgs2 := ICrossSlidingEventArgs2(outPtr)
        }

        return this.__ICrossSlidingEventArgs2.get_ContactCount()
    }

;@endregion Instance Methods
}
