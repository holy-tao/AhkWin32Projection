#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMouseEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [MouseMoved](mousedevice_mousemoved.md) event.
 * @remarks
 * **JavaScript:** This object is accessed when you implement a handler to respond to [MouseMoved](mousedevice_mousemoved.md) events.
 * 
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mouseeventargs
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class MouseEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMouseEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMouseEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the change in the screen location of the mouse pointer since the last mouse event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mouseeventargs.mousedelta
     * @type {MouseDelta} 
     */
    MouseDelta {
        get => this.get_MouseDelta()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MouseDelta} 
     */
    get_MouseDelta() {
        if (!this.HasProp("__IMouseEventArgs")) {
            if ((queryResult := this.QueryInterface(IMouseEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseEventArgs := IMouseEventArgs(outPtr)
        }

        return this.__IMouseEventArgs.get_MouseDelta()
    }

;@endregion Instance Methods
}
