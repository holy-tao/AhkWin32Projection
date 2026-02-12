#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDragUIOverride.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains methods and properties for customizing the drag and drop UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDragUIOverride extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDragUIOverride

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDragUIOverride.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether the drag content is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.iscontentvisible
     * @type {Boolean} 
     */
    IsContentVisible {
        get => this.get_IsContentVisible()
        set => this.put_IsContentVisible(value)
    }

    /**
     * Gets or sets the caption for the drag UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.caption
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * Gets or sets if the caption for the drag UI is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.iscaptionvisible
     * @type {Boolean} 
     */
    IsCaptionVisible {
        get => this.get_IsCaptionVisible()
        set => this.put_IsCaptionVisible(value)
    }

    /**
     * Gets or sets whether the glyph is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.isglyphvisible
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
     * Sets custom drag UI content using a software bitmap.
     * @param {SoftwareBitmap} softwareBitmap_ The custom drag UI content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmap(softwareBitmap_) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.SetContentFromSoftwareBitmap(softwareBitmap_)
    }

    /**
     * Sets custom drag UI content using a software bitmap.
     * @param {SoftwareBitmap} softwareBitmap_ The custom UI drag content.
     * @param {POINT} anchorPoint The relative position of the drag visual from the pointer. The anchor point cannot be outside of the content. For example, if the anchor point is (50, 50) and the position of the pointer is (x, y), the top left corner for the visual will be (x - 50, y - 50).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.setcontentfromsoftwarebitmap
     */
    SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentVisible() {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.get_IsContentVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContentVisible(value) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.put_IsContentVisible(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.get_Caption()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Caption(value) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.put_Caption(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptionVisible() {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.get_IsCaptionVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCaptionVisible(value) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.put_IsCaptionVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGlyphVisible() {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.get_IsGlyphVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGlyphVisible(value) {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.put_IsGlyphVisible(value)
    }

    /**
     * Clears all existing custom UI overrides.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredraguioverride.clear
     */
    Clear() {
        if (!this.HasProp("__ICoreDragUIOverride")) {
            if ((queryResult := this.QueryInterface(ICoreDragUIOverride.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDragUIOverride := ICoreDragUIOverride(outPtr)
        }

        return this.__ICoreDragUIOverride.Clear()
    }

;@endregion Instance Methods
}
