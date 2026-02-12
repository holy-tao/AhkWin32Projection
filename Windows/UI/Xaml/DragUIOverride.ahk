#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDragUIOverride.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the visual representation of the data being dragged during a drag-and-drop operation, including feedback from the drop target.
 * @remarks
 * An instance of this class is passed to the [DragEventHandler](drageventhandler.md) delegate in the [DragEventArgs.DragUIOverride](drageventargs_draguioverride.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragUIOverride extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragUIOverride

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragUIOverride.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the caption text that overlays the drag visual. The text typically describes the drag-and-drop action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * Gets or sets a value that indicates whether the content of the drag visual is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.iscontentvisible
     * @type {Boolean} 
     */
    IsContentVisible {
        get => this.get_IsContentVisible()
        set => this.put_IsContentVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the caption text is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.iscaptionvisible
     * @type {Boolean} 
     */
    IsCaptionVisible {
        get => this.get_IsCaptionVisible()
        set => this.put_IsCaptionVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the glyph is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.isglyphvisible
     * @type {Boolean} 
     */
    IsGlyphVisible {
        get => this.get_IsGlyphVisible()
        set => this.put_IsGlyphVisible(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.get_Caption()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Caption(value) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.put_Caption(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentVisible() {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.get_IsContentVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContentVisible(value) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.put_IsContentVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptionVisible() {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.get_IsCaptionVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCaptionVisible(value) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.put_IsCaptionVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGlyphVisible() {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.get_IsGlyphVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGlyphVisible(value) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.put_IsGlyphVisible(value)
    }

    /**
     * Clears the content, caption, and glyph of the drag visual.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.clear
     */
    Clear() {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.Clear()
    }

    /**
     * Creates a visual element from a provided [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) to represent the dragged data in a drag-and-drop operation.
     * @param {BitmapImage} bitmapImage_ The source image used to create the drag visual.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.setcontentfrombitmapimage
     */
    SetContentFromBitmapImage(bitmapImage_) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.SetContentFromBitmapImage(bitmapImage_)
    }

    /**
     * Creates a visual element from a provided [BitmapImage](../windows.ui.xaml.media.imaging/bitmapimage.md) to represent the dragged data in a drag-and-drop operation, and sets the relative position of the visual from the pointer.
     * @param {BitmapImage} bitmapImage_ The source image used to create the drag visual.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.setcontentfrombitmapimage
     */
    SetContentFromBitmapImageWithAnchorPoint(bitmapImage_, anchorPoint) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.SetContentFromBitmapImageWithAnchorPoint(bitmapImage_, anchorPoint)
    }

    /**
     * Creates a visual element from a provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to represent the dragged data in a drag-and-drop operation.
     * @param {SoftwareBitmap} softwareBitmap_ The source image used to create the drag visual.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmap(softwareBitmap_) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.SetContentFromSoftwareBitmap(softwareBitmap_)
    }

    /**
     * Creates a visual element from a provided [SoftwareBitmap](../windows.graphics.imaging/softwarebitmap.md) to represent the dragged data in a drag-and-drop operation, and sets the relative position of the visual from the pointer.
     * @param {SoftwareBitmap} softwareBitmap_ The source image used to create the drag visual.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.draguioverride.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        if (!this.HasProp("__IDragUIOverride")) {
            if ((queryResult := this.QueryInterface(IDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragUIOverride := IDragUIOverride(outPtr)
        }

        return this.__IDragUIOverride.SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint)
    }

;@endregion Instance Methods
}
