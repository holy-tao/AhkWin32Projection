#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WindowTabIcon.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IWindowTabIconStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowTabIconStatics
     * @type {Guid}
     */
    static IID => Guid("{2e18d95e-2cbb-4084-af0c-36ee1c2d54b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromFontGlyph", "CreateFromFontGlyphWithUri", "CreateFromImage"]

    /**
     * 
     * @param {HSTRING} glyph 
     * @param {HSTRING} fontFamily_ 
     * @returns {WindowTabIcon} 
     */
    CreateFromFontGlyph(glyph, fontFamily_) {
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

        result := ComCall(6, this, "ptr", glyph, "ptr", fontFamily_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowTabIcon(result_)
    }

    /**
     * 
     * @param {HSTRING} glyph 
     * @param {HSTRING} fontFamily_ 
     * @param {Uri} fontUri 
     * @returns {WindowTabIcon} 
     */
    CreateFromFontGlyphWithUri(glyph, fontFamily_, fontUri) {
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

        result := ComCall(7, this, "ptr", glyph, "ptr", fontFamily_, "ptr", fontUri, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowTabIcon(result_)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} image_ 
     * @returns {WindowTabIcon} 
     */
    CreateFromImage(image_) {
        result := ComCall(8, this, "ptr", image_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowTabIcon(result_)
    }
}
