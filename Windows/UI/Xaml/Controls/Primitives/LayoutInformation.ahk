#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILayoutInformation.ahk
#Include .\ILayoutInformationStatics2.ahk
#Include .\ILayoutInformationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Defines methods that provide additional information about the layout of an element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.layoutinformation
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class LayoutInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILayoutInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILayoutInformation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the Size value that was most recently used to measure the specified element.
     * @param {UIElement} element The element for which to return the most recent size.
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.layoutinformation.getavailablesize
     */
    static GetAvailableSize(element) {
        if (!LayoutInformation.HasProp("__ILayoutInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LayoutInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILayoutInformationStatics2.IID)
            LayoutInformation.__ILayoutInformationStatics2 := ILayoutInformationStatics2(factoryPtr)
        }

        return LayoutInformation.__ILayoutInformationStatics2.GetAvailableSize(element)
    }

    /**
     * Returns the element that was being processed by the layout system at the moment of an unhandled exception.
     * @param {IInspectable} dispatcher The *dispatcher* object that defines the scope of the operation. Direct support for "Dispatcher" type does not exist yet.
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.layoutinformation.getlayoutexceptionelement
     */
    static GetLayoutExceptionElement(dispatcher) {
        if (!LayoutInformation.HasProp("__ILayoutInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LayoutInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILayoutInformationStatics.IID)
            LayoutInformation.__ILayoutInformationStatics := ILayoutInformationStatics(factoryPtr)
        }

        return LayoutInformation.__ILayoutInformationStatics.GetLayoutExceptionElement(dispatcher)
    }

    /**
     * Returns the layout slot, or bounding box, that contains the specified element.
     * @param {FrameworkElement} element The element for which to return the layout slot.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.layoutinformation.getlayoutslot
     */
    static GetLayoutSlot(element) {
        if (!LayoutInformation.HasProp("__ILayoutInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.LayoutInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILayoutInformationStatics.IID)
            LayoutInformation.__ILayoutInformationStatics := ILayoutInformationStatics(factoryPtr)
        }

        return LayoutInformation.__ILayoutInformationStatics.GetLayoutSlot(element)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
