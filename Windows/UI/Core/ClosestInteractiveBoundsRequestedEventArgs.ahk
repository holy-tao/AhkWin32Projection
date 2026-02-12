#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClosestInteractiveBoundsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the **ClosestInteractiveBoundsRequested** event. Not intended for general use. See [CoreComponentInputSource.ClosestInteractiveBoundsRequested](corecomponentinputsource_closestinteractiveboundsrequested.md) and [CoreWindow.ClosestInteractiveBoundsRequested](corewindow_closestinteractiveboundsrequested.md).
 * @remarks
 * > [!NOTE]
 * > Not intended for general use.
 * 
 * > See [CoreComponentInputSource.ClosestInteractiveBoundsRequested](corecomponentinputsource_closestinteractiveboundsrequested.md) and [CoreWindow.ClosestInteractiveBoundsRequested](corewindow_closestinteractiveboundsrequested.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.closestinteractiveboundsrequestedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ClosestInteractiveBoundsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClosestInteractiveBoundsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClosestInteractiveBoundsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the client coordinates of the pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.closestinteractiveboundsrequestedeventargs.pointerposition
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * Gets or sets the bounding rectangle in which to search for interactive elements.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.closestinteractiveboundsrequestedeventargs.searchbounds
     * @type {RECT} 
     */
    SearchBounds {
        get => this.get_SearchBounds()
    }

    /**
     * Gets or sets the bounding rectangle of the interactive element that is within the [SearchBounds](closestinteractiveboundsrequestedeventargs_searchbounds.md) and closest to the [PointerPosition](closestinteractiveboundsrequestedeventargs_pointerposition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.closestinteractiveboundsrequestedeventargs.closestinteractivebounds
     * @type {RECT} 
     */
    ClosestInteractiveBounds {
        get => this.get_ClosestInteractiveBounds()
        set => this.put_ClosestInteractiveBounds(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        if (!this.HasProp("__IClosestInteractiveBoundsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IClosestInteractiveBoundsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosestInteractiveBoundsRequestedEventArgs := IClosestInteractiveBoundsRequestedEventArgs(outPtr)
        }

        return this.__IClosestInteractiveBoundsRequestedEventArgs.get_PointerPosition()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SearchBounds() {
        if (!this.HasProp("__IClosestInteractiveBoundsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IClosestInteractiveBoundsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosestInteractiveBoundsRequestedEventArgs := IClosestInteractiveBoundsRequestedEventArgs(outPtr)
        }

        return this.__IClosestInteractiveBoundsRequestedEventArgs.get_SearchBounds()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClosestInteractiveBounds() {
        if (!this.HasProp("__IClosestInteractiveBoundsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IClosestInteractiveBoundsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosestInteractiveBoundsRequestedEventArgs := IClosestInteractiveBoundsRequestedEventArgs(outPtr)
        }

        return this.__IClosestInteractiveBoundsRequestedEventArgs.get_ClosestInteractiveBounds()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_ClosestInteractiveBounds(value) {
        if (!this.HasProp("__IClosestInteractiveBoundsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IClosestInteractiveBoundsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosestInteractiveBoundsRequestedEventArgs := IClosestInteractiveBoundsRequestedEventArgs(outPtr)
        }

        return this.__IClosestInteractiveBoundsRequestedEventArgs.put_ClosestInteractiveBounds(value)
    }

;@endregion Instance Methods
}
