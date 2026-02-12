#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragUI.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the visual representation of the data being dragged at the start of a drag-and-drop operation.
 * @remarks
 * An instance of this class is passed to the handler of the [UIElement.DragStarting](uielement_dragstarting.md) event in the [DragStartingEventArgs.DragUI](dragstartingeventargs_dragui.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragUI.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a visual element from a provided [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) to represent the dragged data in a drag-and-drop operation.
     * @param {BitmapImage} bitmapImage_ The source image used to create the drag visual.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui.setcontentfrombitmapimage
     */
    SetContentFromBitmapImage(bitmapImage_) {
        if (!this.HasProp("__IDragUI")) {
            if ((queryResult := this.QueryInterface(IDragUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUI := IDragUI(outPtr)
        }

        return this.__IDragUI.SetContentFromBitmapImage(bitmapImage_)
    }

    /**
     * Creates a visual element from a provided [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) to represent the dragged data in a drag-and-drop operation, and sets the relative position of the visual from the pointer.
     * @param {BitmapImage} bitmapImage_ The source image used to create the drag visual.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui.setcontentfrombitmapimage
     */
    SetContentFromBitmapImageWithAnchorPoint(bitmapImage_, anchorPoint) {
        if (!this.HasProp("__IDragUI")) {
            if ((queryResult := this.QueryInterface(IDragUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUI := IDragUI(outPtr)
        }

        return this.__IDragUI.SetContentFromBitmapImageWithAnchorPoint(bitmapImage_, anchorPoint)
    }

    /**
     * Creates a visual element from a provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to represent the dragged data in a drag-and-drop operation.
     * @param {SoftwareBitmap} softwareBitmap_ The source image used to create the drag visual.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmap(softwareBitmap_) {
        if (!this.HasProp("__IDragUI")) {
            if ((queryResult := this.QueryInterface(IDragUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUI := IDragUI(outPtr)
        }

        return this.__IDragUI.SetContentFromSoftwareBitmap(softwareBitmap_)
    }

    /**
     * Creates a visual element from a provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to represent the dragged data in a drag-and-drop operation, and sets the relative position of the visual from the pointer.
     * @param {SoftwareBitmap} softwareBitmap_ The source image used to create the drag visual.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        if (!this.HasProp("__IDragUI")) {
            if ((queryResult := this.QueryInterface(IDragUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUI := IDragUI(outPtr)
        }

        return this.__IDragUI.SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint)
    }

    /**
     * Creates a system provided visual element that represents the format of the dragged data in a drag-and-drop operation, typically the icon of the default handler for the file format.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragui.setcontentfromdatapackage
     */
    SetContentFromDataPackage() {
        if (!this.HasProp("__IDragUI")) {
            if ((queryResult := this.QueryInterface(IDragUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUI := IDragUI(outPtr)
        }

        return this.__IDragUI.SetContentFromDataPackage()
    }

;@endregion Instance Methods
}
