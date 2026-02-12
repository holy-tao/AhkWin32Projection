#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextPointer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a position within a text element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class TextPointer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextPointer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextPointer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the logical parent that contains the current position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.parent
     * @type {DependencyObject} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * Gets the user interface (UI) element that "owns" this [TextPointer](textpointer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.visualparent
     * @type {FrameworkElement} 
     */
    VisualParent {
        get => this.get_VisualParent()
    }

    /**
     * Gets the logical direction associated with the current position, which is used to disambiguate content associated with the current position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.logicaldirection
     * @type {Integer} 
     */
    LogicalDirection {
        get => this.get_LogicalDirection()
    }

    /**
     * Gets the character index of a [TextPointer](textpointer.md) within its container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.offset
     * @type {Integer} 
     */
    Offset {
        get => this.get_Offset()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_Parent() {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.get_Parent()
    }

    /**
     * 
     * @returns {FrameworkElement} 
     */
    get_VisualParent() {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.get_VisualParent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LogicalDirection() {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.get_LogicalDirection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Offset() {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.get_Offset()
    }

    /**
     * Returns a bounding box for content that borders the current [TextPointer](textpointer.md) in the specified logical direction.
     * @param {Integer} direction_ One of the [LogicalDirection](logicaldirection.md) values that specifies the logical direction in which to find a content bounding box.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.getcharacterrect
     */
    GetCharacterRect(direction_) {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.GetCharacterRect(direction_)
    }

    /**
     * Returns a [TextPointer](textpointer.md) to the position indicated by the specified offset, in symbols, from the beginning of the current [TextPointer](textpointer.md) and in the specified direction.
     * @param {Integer} offset An offset, in symbols, for which to calculate and return the position. If the offset is negative, the returned [TextPointer](textpointer.md) precedes the current [TextPointer](textpointer.md); otherwise, it follows.
     * @param {Integer} direction_ One of the [LogicalDirection](logicaldirection.md) values that specifies the logical direction of the returned [TextPointer](textpointer.md).
     * @returns {TextPointer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textpointer.getpositionatoffset
     */
    GetPositionAtOffset(offset, direction_) {
        if (!this.HasProp("__ITextPointer")) {
            if ((queryResult := this.QueryInterface(ITextPointer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextPointer := ITextPointer(outPtr)
        }

        return this.__ITextPointer.GetPositionAtOffset(offset, direction_)
    }

;@endregion Instance Methods
}
