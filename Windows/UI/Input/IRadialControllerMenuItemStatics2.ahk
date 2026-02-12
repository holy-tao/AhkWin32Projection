#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RadialControllerMenuItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerMenuItemStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerMenuItemStatics2
     * @type {Guid}
     */
    static IID => Guid("{0cbb70be-7e3e-48bd-be04-2c7fcaa9c1ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromFontGlyph", "CreateFromFontGlyphWithUri"]

    /**
     * 
     * @param {HSTRING} displayText 
     * @param {HSTRING} glyph 
     * @param {HSTRING} fontFamily_ 
     * @returns {RadialControllerMenuItem} 
     */
    CreateFromFontGlyph(displayText, glyph, fontFamily_) {
        if(displayText is String) {
            pin := HSTRING.Create(displayText)
            displayText := pin.Value
        }
        displayText := displayText is Win32Handle ? NumGet(displayText, "ptr") : displayText
        if(glyph is String) {
            pin := HSTRING.Create(glyph)
            glyph := pin.Value
        }
        glyph := glyph is Win32Handle ? NumGet(glyph, "ptr") : glyph
        if(fontFamily_ is String) {
            pin := HSTRING.Create(fontFamily_)
            fontFamily_ := pin.Value
        }
        fontFamily_ := fontFamily_ is Win32Handle ? NumGet(fontFamily_, "ptr") : fontFamily_

        result := ComCall(6, this, "ptr", displayText, "ptr", glyph, "ptr", fontFamily_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenuItem(result_)
    }

    /**
     * 
     * @param {HSTRING} displayText 
     * @param {HSTRING} glyph 
     * @param {HSTRING} fontFamily_ 
     * @param {Uri} fontUri 
     * @returns {RadialControllerMenuItem} 
     */
    CreateFromFontGlyphWithUri(displayText, glyph, fontFamily_, fontUri) {
        if(displayText is String) {
            pin := HSTRING.Create(displayText)
            displayText := pin.Value
        }
        displayText := displayText is Win32Handle ? NumGet(displayText, "ptr") : displayText
        if(glyph is String) {
            pin := HSTRING.Create(glyph)
            glyph := pin.Value
        }
        glyph := glyph is Win32Handle ? NumGet(glyph, "ptr") : glyph
        if(fontFamily_ is String) {
            pin := HSTRING.Create(fontFamily_)
            fontFamily_ := pin.Value
        }
        fontFamily_ := fontFamily_ is Win32Handle ? NumGet(fontFamily_, "ptr") : fontFamily_

        result := ComCall(7, this, "ptr", displayText, "ptr", glyph, "ptr", fontFamily_, "ptr", fontUri, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerMenuItem(result_)
    }
}
