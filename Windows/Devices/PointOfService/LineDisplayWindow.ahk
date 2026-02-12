#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayWindow.ahk
#Include .\ILineDisplayWindow2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a line display window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayWindow extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayWindow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayWindow.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets dimensions of the window, in number of character lines (rows and columns).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.sizeincharacters
     * @type {SIZE} 
     */
    SizeInCharacters {
        get => this.get_SizeInCharacters()
    }

    /**
     * Gets or sets the delay interval between displaying successive characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.intercharacterwaitinterval
     * @type {TimeSpan} 
     */
    InterCharacterWaitInterval {
        get => this.get_InterCharacterWaitInterval()
        set => this.put_InterCharacterWaitInterval(value)
    }

    /**
     * Gets the cursor of the line display window.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.cursor
     * @type {LineDisplayCursor} 
     */
    Cursor {
        get => this.get_Cursor()
    }

    /**
     * Gets the line display marquee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.marquee
     * @type {LineDisplayMarquee} 
     */
    Marquee {
        get => this.get_Marquee()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_SizeInCharacters() {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.get_SizeInCharacters()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InterCharacterWaitInterval() {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.get_InterCharacterWaitInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_InterCharacterWaitInterval(value) {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.put_InterCharacterWaitInterval(value)
    }

    /**
     * Refresh the line display window.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.tryrefreshasync
     */
    TryRefreshAsync() {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryRefreshAsync()
    }

    /**
     * Try to display the specified text at a specified position in the line display window, using the specified display attribute.
     * @param {HSTRING} text The text to be displayed.
     * @param {Integer} displayAttribute The display attribute to be applied to the window.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaytextasync
     */
    TryDisplayTextAsync(text, displayAttribute) {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryDisplayTextAsync(text, displayAttribute)
    }

    /**
     * Try to display the specified text in the line display window.
     * @param {HSTRING} text The text to be displayed.
     * @param {Integer} displayAttribute 
     * @param {POINT} startPosition 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaytextasync
     */
    TryDisplayTextAtPositionAsync(text, displayAttribute, startPosition) {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryDisplayTextAtPositionAsync(text, displayAttribute, startPosition)
    }

    /**
     * Try to display the specified text in the line display window, using the specified display attribute.
     * @param {HSTRING} text The text to be displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaytextasync
     */
    TryDisplayTextNormalAsync(text) {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryDisplayTextNormalAsync(text)
    }

    /**
     * Scroll the window text contents the specified number of lines in the specified direction.
     * @param {Integer} direction_ The direction in which to scroll text.
     * @param {Integer} numberOfColumnsOrRows The number of columns or rows to scroll. Columns are used if the scroll direction is left or right; rows are used if the scroll direction is up or down.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.tryscrolltextasync
     */
    TryScrollTextAsync(direction_, numberOfColumnsOrRows) {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryScrollTextAsync(direction_, numberOfColumnsOrRows)
    }

    /**
     * Clears the current window. Changers all characters to blanks, clears any bitmaps displayed in the window, and sets **Cursor.Position** to {0,0}.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trycleartextasync
     */
    TryClearTextAsync() {
        if (!this.HasProp("__ILineDisplayWindow")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow := ILineDisplayWindow(outPtr)
        }

        return this.__ILineDisplayWindow.TryClearTextAsync()
    }

    /**
     * 
     * @returns {LineDisplayCursor} 
     */
    get_Cursor() {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.get_Cursor()
    }

    /**
     * 
     * @returns {LineDisplayMarquee} 
     */
    get_Marquee() {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.get_Marquee()
    }

    /**
     * Attempts to asynchronously read the currently displayed character at the current cursor position.
     * @remarks
     * This method requires [LineDisplayCapabilities.CanReadCharacterAtCursor](linedisplaycapabilities_canreadcharacteratcursor.md) to be True to be succesfully executed.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.readcharacteratcursorasync
     */
    ReadCharacterAtCursorAsync() {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.ReadCharacterAtCursorAsync()
    }

    /**
     * Attempts to asynchronously display a stored bitmap from at LineDisplayStoredBitmap object at the current cursor position.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * @param {LineDisplayStoredBitmap} bitmap_ The bitmap to be displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoredbitmapatcursorasync
     */
    TryDisplayStoredBitmapAtCursorAsync(bitmap_) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStoredBitmapAtCursorAsync(bitmap_)
    }

    /**
     * Attempts to asynchronously display a bitmap from a storage file at the current cursor position.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * @param {StorageFile} bitmap_ The bitmap to be displayed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoragefilebitmapatcursorasync
     */
    TryDisplayStorageFileBitmapAtCursorAsync(bitmap_) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStorageFileBitmapAtCursorAsync(bitmap_)
    }

    /**
     * Attempts to asynchronously display a bitmap from a storage file at the current cursor position, at a particular width.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * 
     * If the provided widthInPixels value is larger than [ClaimedLineDisplay.MaxBitmapSizeInPixels](claimedlinedisplay_maxbitmapsizeinpixels.md), this method will fail.
     * @param {StorageFile} bitmap_ The bitmap to be displayed.
     * @param {Integer} horizontalAlignment_ The horizontal alignment of the bitmap relative to the current text character position.
     * @param {Integer} verticalAlignment_ The vertical alignment of the bitmap relative to the current text character position.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoragefilebitmapatcursorasync
     */
    TryDisplayStorageFileBitmapAtCursorWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStorageFileBitmapAtCursorWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_)
    }

    /**
     * Attempts to asynchronously display a bitmap from a storage file at the current cursor position.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * @param {StorageFile} bitmap_ The bitmap to be displayed.
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoragefilebitmapatcursorasync
     */
    TryDisplayStorageFileBitmapAtCursorWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStorageFileBitmapAtCursorWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels)
    }

    /**
     * Attempts to asynchronously display a bitmap from a storage file at a particular point, scaled to a particular width.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * 
     * If the provided widthInPixels value is larger than [ClaimedLineDisplay.MaxBitmapSizeInPixels](claimedlinedisplay_maxbitmapsizeinpixels.md), this method will fail.
     * @param {StorageFile} bitmap_ The bitmap to be displayed.
     * @param {POINT} offsetInPixels The number of pixels to offset the bitmap display from the top-left corner of the screen, {0,0}.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoragefilebitmapatpointasync
     */
    TryDisplayStorageFileBitmapAtPointAsync(bitmap_, offsetInPixels) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStorageFileBitmapAtPointAsync(bitmap_, offsetInPixels)
    }

    /**
     * Attempts to asynchronously display a bitmap from a storage file at a particular point.
     * @remarks
     * If the [LineDisplayCapabilities.CanDisplayBitmaps](linedisplaycapabilities_candisplaybitmaps.md) value is False, this method will fail.
     * @param {StorageFile} bitmap_ The bitmap to be displayed.
     * @param {POINT} offsetInPixels The number of pixels to offset the bitmap display from the top-left corner of the screen, {0,0}.
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.trydisplaystoragefilebitmapatpointasync
     */
    TryDisplayStorageFileBitmapAtPointWithWidthAsync(bitmap_, offsetInPixels, widthInPixels) {
        if (!this.HasProp("__ILineDisplayWindow2")) {
            if ((queryResult := this.QueryInterface(ILineDisplayWindow2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayWindow2 := ILineDisplayWindow2(outPtr)
        }

        return this.__ILineDisplayWindow2.TryDisplayStorageFileBitmapAtPointWithWidthAsync(bitmap_, offsetInPixels, widthInPixels)
    }

    /**
     * Closes the line display window resource, destroying the window on the device.
     * @remarks
     * Closing a window does not remove any content that it is displaying on the device. Use [LineDisplay.TryClearTextAsync()](linedisplaywindow_trycleartextasync_2039536783.md) to clear window contents before destroying it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaywindow.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
