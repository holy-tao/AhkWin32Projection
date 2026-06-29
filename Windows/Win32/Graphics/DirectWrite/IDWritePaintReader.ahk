#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct2D\Common\D2D1_GRADIENT_STOP.ahk" { D2D1_GRADIENT_STOP }
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_PAINT_COLOR.ahk" { DWRITE_PAINT_COLOR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct2D\Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_PAINT_ATTRIBUTES.ahk" { DWRITE_PAINT_ATTRIBUTES }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWritePaintReader extends IUnknown {
    /**
     * The interface identifier for IDWritePaintReader
     * @type {Guid}
     */
    static IID := Guid("{8128e912-3b97-42a5-ab6c-24aad3a86e54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWritePaintReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCurrentGlyph       : IntPtr
        SetTextColor          : IntPtr
        SetColorPaletteIndex  : IntPtr
        SetCustomColorPalette : IntPtr
        MoveToFirstChild      : IntPtr
        MoveToNextSibling     : IntPtr
        MoveToParent          : IntPtr
        GetGradientStops      : IntPtr
        GetGradientStopColors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWritePaintReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} glyphIndex 
     * @param {Integer} paintElement 
     * @param {Integer} structSize 
     * @param {Pointer<D2D_RECT_F>} clipBox 
     * @param {Pointer<DWRITE_PAINT_ATTRIBUTES>} glyphAttributes 
     * @returns {HRESULT} 
     */
    SetCurrentGlyph(glyphIndex, paintElement, structSize, clipBox, glyphAttributes) {
        glyphAttributesMarshal := glyphAttributes is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", glyphIndex, "ptr", paintElement, "uint", structSize, D2D_RECT_F.Ptr, clipBox, glyphAttributesMarshal, glyphAttributes, "HRESULT")
        return result
    }

    /**
     * The SetTextColor function sets the text color for the specified device context to the specified color.
     * @remarks
     * The text color is used to draw the face of each character written by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions. The text color is also used in converting bitmaps from color to monochrome and vice versa.
     * @param {Pointer<DWRITE_COLOR_F>} textColor 
     * @returns {HRESULT} If the function succeeds, the return value is a color reference for the previous text color as a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value.
     * 
     * If the function fails, the return value is CLR_INVALID.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-settextcolor
     */
    SetTextColor(textColor) {
        result := ComCall(4, this, DWRITE_COLOR_F.Ptr, textColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} colorPaletteIndex 
     * @returns {HRESULT} 
     */
    SetColorPaletteIndex(colorPaletteIndex) {
        result := ComCall(5, this, "uint", colorPaletteIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_COLOR_F>} paletteEntries 
     * @param {Integer} paletteEntryCount 
     * @returns {HRESULT} 
     */
    SetCustomColorPalette(paletteEntries, paletteEntryCount) {
        result := ComCall(6, this, DWRITE_COLOR_F.Ptr, paletteEntries, "uint", paletteEntryCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} paintElement 
     * @param {Integer} structSize 
     * @returns {HRESULT} 
     */
    MoveToFirstChild(paintElement, structSize) {
        result := ComCall(7, this, "ptr", paintElement, "uint", structSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} paintElement 
     * @param {Integer} structSize 
     * @returns {HRESULT} 
     */
    MoveToNextSibling(paintElement, structSize) {
        result := ComCall(8, this, "ptr", paintElement, "uint", structSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MoveToParent() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} firstGradientStopIndex 
     * @param {Integer} gradientStopCount 
     * @returns {D2D1_GRADIENT_STOP} 
     */
    GetGradientStops(firstGradientStopIndex, gradientStopCount) {
        gradientStops := D2D1_GRADIENT_STOP()
        result := ComCall(10, this, "uint", firstGradientStopIndex, "uint", gradientStopCount, D2D1_GRADIENT_STOP.Ptr, gradientStops, "HRESULT")
        return gradientStops
    }

    /**
     * 
     * @param {Integer} firstGradientStopIndex 
     * @param {Integer} gradientStopCount 
     * @returns {DWRITE_PAINT_COLOR} 
     */
    GetGradientStopColors(firstGradientStopIndex, gradientStopCount) {
        gradientStopColors := DWRITE_PAINT_COLOR()
        result := ComCall(11, this, "uint", firstGradientStopIndex, "uint", gradientStopCount, DWRITE_PAINT_COLOR.Ptr, gradientStopColors, "HRESULT")
        return gradientStopColors
    }

    Query(iid) {
        if (IDWritePaintReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCurrentGlyph := CallbackCreate(GetMethod(implObj, "SetCurrentGlyph"), flags, 6)
        this.vtbl.SetTextColor := CallbackCreate(GetMethod(implObj, "SetTextColor"), flags, 2)
        this.vtbl.SetColorPaletteIndex := CallbackCreate(GetMethod(implObj, "SetColorPaletteIndex"), flags, 2)
        this.vtbl.SetCustomColorPalette := CallbackCreate(GetMethod(implObj, "SetCustomColorPalette"), flags, 3)
        this.vtbl.MoveToFirstChild := CallbackCreate(GetMethod(implObj, "MoveToFirstChild"), flags, 3)
        this.vtbl.MoveToNextSibling := CallbackCreate(GetMethod(implObj, "MoveToNextSibling"), flags, 3)
        this.vtbl.MoveToParent := CallbackCreate(GetMethod(implObj, "MoveToParent"), flags, 1)
        this.vtbl.GetGradientStops := CallbackCreate(GetMethod(implObj, "GetGradientStops"), flags, 4)
        this.vtbl.GetGradientStopColors := CallbackCreate(GetMethod(implObj, "GetGradientStopColors"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCurrentGlyph)
        CallbackFree(this.vtbl.SetTextColor)
        CallbackFree(this.vtbl.SetColorPaletteIndex)
        CallbackFree(this.vtbl.SetCustomColorPalette)
        CallbackFree(this.vtbl.MoveToFirstChild)
        CallbackFree(this.vtbl.MoveToNextSibling)
        CallbackFree(this.vtbl.MoveToParent)
        CallbackFree(this.vtbl.GetGradientStops)
        CallbackFree(this.vtbl.GetGradientStopColors)
    }
}
