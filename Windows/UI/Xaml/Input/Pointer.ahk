#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides basic properties for the input pointer associated with a single mouse, pen/stylus, or touch contact.
 * @remarks
 * In most cases, we recommend that you get pointer info through the event argument of the pointer event handlers in your chosen language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
 * 
 * If the event argument doesn't intrinsically expose the pointer details required by your app, you can get access to extended pointer data through the [GetCurrentPoint](pointerroutedeventargs_getcurrentpoint_1761708789.md) and [GetIntermediatePoints](pointerroutedeventargs_getintermediatepoints_1716242609.md) methods of [PointerRoutedEventArgs](pointerroutedeventargs.md). We recommend using these methods as you can specify the context of the pointer data.
 * 
 * The static [PointerPoint](../windows.ui.input/pointerpoint.md) methods, [GetCurrentPoint](../windows.ui.input/pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](../windows.ui.input/pointerpoint_getintermediatepoints_143894736.md), always use the context of the app.
 * Pointer is an abstract class that is used to describe an input device. This class identifies the input device (such as stylus, finger, or mouse) for each pointer event that occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointer
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class Pointer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the system-generated identifier for this pointer reference.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointer.pointerid
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointer.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets a value that determines whether the pointer device was in contact with a sensor or digitizer at the time that the event was reported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointer.isincontact
     * @type {Boolean} 
     */
    IsInContact {
        get => this.get_IsInContact()
    }

    /**
     * Gets a value that indicates whether the pointer device is within detection range of a sensor or digitizer.
     * @remarks
     * A pointer comes into existence when the pointer device enters detection range and is canceled when the pointer device leaves detection range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.pointer.isinrange
     * @type {Boolean} 
     */
    IsInRange {
        get => this.get_IsInRange()
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
    get_PointerId() {
        if (!this.HasProp("__IPointer")) {
            if ((queryResult := this.QueryInterface(IPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointer := IPointer(outPtr)
        }

        return this.__IPointer.get_PointerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IPointer")) {
            if ((queryResult := this.QueryInterface(IPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointer := IPointer(outPtr)
        }

        return this.__IPointer.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInContact() {
        if (!this.HasProp("__IPointer")) {
            if ((queryResult := this.QueryInterface(IPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointer := IPointer(outPtr)
        }

        return this.__IPointer.get_IsInContact()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInRange() {
        if (!this.HasProp("__IPointer")) {
            if ((queryResult := this.QueryInterface(IPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointer := IPointer(outPtr)
        }

        return this.__IPointer.get_IsInRange()
    }

;@endregion Instance Methods
}
