#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointerEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the arguments returned by the last pointer event.
 * @remarks
 * This object is returned by a delegate registered for one of the following events:
 * + [CoreWindow.PointerCaptureLost](corewindow_pointercapturelost.md)
 * + [CoreWindow.PointerEntered](corewindow_pointerentered.md)
 * + [CoreWindow.PointerExited](corewindow_pointerexited.md)
 * + [CoreWindow.PointerMoved](corewindow_pointermoved.md)
 * + [CoreWindow.PointerPressed](corewindow_pointerpressed.md)
 * + [CoreWindow.PointerReleased](corewindow_pointerreleased.md)
 * + [CoreWindow.PointerWheelChanged](corewindow_pointerwheelchanged.md)
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.pointereventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class PointerEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the pointer data of the last pointer event.
     * @remarks
     * CurrentPoint corresponds to the last point retrieved by [GetIntermediatePoints](pointereventargs_getintermediatepoints_1956108759.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.pointereventargs.currentpoint
     * @type {PointerPoint} 
     */
    CurrentPoint {
        get => this.get_CurrentPoint()
    }

    /**
     * Gets the keyboard key or keys used to modify the pointer input, such as the "Ctrl" key when pressed in conjunction with another key, as in Ctrl+C.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.pointereventargs.keymodifiers
     * @type {Integer} 
     */
    KeyModifiers {
        get => this.get_KeyModifiers()
    }

    /**
     * Gets or sets whether the pointer event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.pointereventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointerPoint} 
     */
    get_CurrentPoint() {
        if (!this.HasProp("__IPointerEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerEventArgs := IPointerEventArgs(outPtr)
        }

        return this.__IPointerEventArgs.get_CurrentPoint()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyModifiers() {
        if (!this.HasProp("__IPointerEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerEventArgs := IPointerEventArgs(outPtr)
        }

        return this.__IPointerEventArgs.get_KeyModifiers()
    }

    /**
     * Retrieves the pointer data for up to the last 64 pointer locations since the last pointer event.
     * @returns {IVector<PointerPoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.pointereventargs.getintermediatepoints
     */
    GetIntermediatePoints() {
        if (!this.HasProp("__IPointerEventArgs")) {
            if ((queryResult := this.QueryInterface(IPointerEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerEventArgs := IPointerEventArgs(outPtr)
        }

        return this.__IPointerEventArgs.GetIntermediatePoints()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
