#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayCustomGlyphs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of custom glyphs to be used by a line display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycustomglyphs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayCustomGlyphs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayCustomGlyphs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayCustomGlyphs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the glyph dimensions (based on the number of pixels for a character cell) supported by the device
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycustomglyphs.sizeinpixels
     * @type {SIZE} 
     */
    SizeInPixels {
        get => this.get_SizeInPixels()
    }

    /**
     * Gets the list of character codes available for redefinition as custom glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycustomglyphs.supportedglyphcodes
     * @type {IVectorView<Integer>} 
     */
    SupportedGlyphCodes {
        get => this.get_SupportedGlyphCodes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_SizeInPixels() {
        if (!this.HasProp("__ILineDisplayCustomGlyphs")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCustomGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCustomGlyphs := ILineDisplayCustomGlyphs(outPtr)
        }

        return this.__ILineDisplayCustomGlyphs.get_SizeInPixels()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedGlyphCodes() {
        if (!this.HasProp("__ILineDisplayCustomGlyphs")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCustomGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCustomGlyphs := ILineDisplayCustomGlyphs(outPtr)
        }

        return this.__ILineDisplayCustomGlyphs.get_SupportedGlyphCodes()
    }

    /**
     * Attempts to asynchronously define a custom glyph.
     * @remarks
     * The glyph is defined as bits representing each pixel packed into bytes, using whole bytes to represent each row.
     * 
     * The minimum number of bytes are sent for each row, based on [LineDisplayCustomGlyphs.SizeInPixels](linedisplaycustomglyphs_sizeinpixels.md) and using 8 bits per byte. Bytes are sent left-to-right across each row; if more than one byte is required per row, the leftmost byte is sent first. The lowest-order bit within a byte represents the rightmost pixel. Bits that do not represent pixels are the highest order bits and their value is ignored. Rows are sent from the top down.
     * 
     * A 10 pixel wide glyph would have the two leftmost pixels represented in bits 1 and 0 of the first byte, respectively. The remaining 8 pixels would be represented in the second byte.
     * 
     * Enough rows must be sent to define the entire character. The hardware defines whether changing the definition of a glyph causes currently displayed characters to change or the change appears only when next drawn.
     * @param {Integer} glyphCode The character for which the glyph will be defined.
     * @param {IBuffer} glyphData_ The glyph data.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycustomglyphs.tryredefineasync
     */
    TryRedefineAsync(glyphCode, glyphData_) {
        if (!this.HasProp("__ILineDisplayCustomGlyphs")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCustomGlyphs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCustomGlyphs := ILineDisplayCustomGlyphs(outPtr)
        }

        return this.__ILineDisplayCustomGlyphs.TryRedefineAsync(glyphCode, glyphData_)
    }

;@endregion Instance Methods
}
