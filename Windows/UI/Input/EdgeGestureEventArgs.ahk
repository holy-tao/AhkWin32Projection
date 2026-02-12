#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEdgeGestureEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the type of user input that triggered the edge gesture event.
 * @remarks
 * This class is returned as part of the [edgeGesture.starting](edgegesture_starting.md), [edgeGesture.canceled](edgegesture_canceled.md), and [edgeGesture.completed](edgegesture_completed.md) events.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.edgegestureeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class EdgeGestureEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEdgeGestureEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEdgeGestureEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of user input that triggered the edge gesture event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.edgegestureeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
    get_Kind() {
        if (!this.HasProp("__IEdgeGestureEventArgs")) {
            if ((queryResult := this.QueryInterface(IEdgeGestureEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEdgeGestureEventArgs := IEdgeGestureEventArgs(outPtr)
        }

        return this.__IEdgeGestureEventArgs.get_Kind()
    }

;@endregion Instance Methods
}
