#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_FONT_STYLE.ahk" { DWRITE_FONT_STYLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet3.ahk" { IDWriteFontSet3 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_STRETCH.ahk" { DWRITE_FONT_STRETCH }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\DWRITE_FONT_WEIGHT.ahk" { DWRITE_FONT_WEIGHT }

/**
 * Represents a font set. (IDWriteFontSet4)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset4
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSet4 extends IDWriteFontSet3 {
    /**
     * The interface identifier for IDWriteFontSet4
     * @type {Guid}
     */
    static IID := Guid("{eec175fc-bea9-4c86-8b53-ccbdd7df0c82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSet4 interfaces
    */
    struct Vtbl extends IDWriteFontSet3.Vtbl {
        ConvertWeightStretchStyleToFontAxisValues : IntPtr
        GetMatchingFonts                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSet4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Computes derived font axis values from the specified font weight, stretch, style, and size.
     * @remarks
     * The caller should concatenate the output axis values to the input axis values (if any), and pass the combined axis values to the **GetMatchingFonts** method. This doesn't result in duplicates because the output doesn't include any axes present in the *inputAxisValues* array.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} inputAxisValues Type: \_In\_reads\_opt\_(inputAxisCount) **[DWRITE_FONT_AXIS_VALUE](/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_axis_value) const\***
     * 
     * Optional pointer to an array of input axis values. Axes present in this array are excluded from the output. That's so that explicit axis values take precedence over derived axis values.
     * @param {Integer} inputAxisCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Size of the array of input axis values.
     * @param {DWRITE_FONT_WEIGHT} fontWeight Type: **[DWRITE_FONT_WEIGHT](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight)**
     * 
     * Font weight, used to compute "wght" axis value.
     * @param {DWRITE_FONT_STRETCH} fontStretch Type: **[DWRITE_FONT_STRETCH](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch)**
     * 
     * Font stretch, used to compute "wdth" axis value.
     * @param {DWRITE_FONT_STYLE} _fontStyle Type: **[DWRITE_FONT_STYLE](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style)**
     * 
     * Font style, used to compute "slnt" and "ital" axis values.
     * @param {Float} fontSize Type: **float**
     * 
     * Font size in DIPs, used to compute "opsz" axis value. If this parameter is zero, then no "opsz" axis value is added to the output array.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} outputAxisValues Type: \_Out\_writes\_to\_(DWRITE_STANDARD_FONT_AXIS_COUNT, return) **[DWRITE_FONT_AXIS_VALUE](/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_axis_value)\***
     * 
     * Pointer to an output array to which derived axis values are written. The size of this array must be at least **DWRITE_STANDARD_FONT_AXIS_COUNT** (5). The return value is the number of axis values that were actually written to this array.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Returns the number of derived axis values that were actually written to the output array.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset4-convertweightstretchstyletofontaxisvalues
     */
    ConvertWeightStretchStyleToFontAxisValues(inputAxisValues, inputAxisCount, fontWeight, fontStretch, _fontStyle, fontSize, outputAxisValues) {
        result := ComCall(30, this, DWRITE_FONT_AXIS_VALUE.Ptr, inputAxisValues, "uint", inputAxisCount, DWRITE_FONT_WEIGHT, fontWeight, DWRITE_FONT_STRETCH, fontStretch, DWRITE_FONT_STYLE, _fontStyle, "float", fontSize, DWRITE_FONT_AXIS_VALUE.Ptr, outputAxisValues, UInt32)
        return result
    }

    /**
     * Generates a matching font set based on the requested inputs, ordered so that nearer matches are earlier.
     * @remarks
     * This can yield distinct items that were not in the original font set, including items with simulation flags (if they would be a closer match to the request) and instances that were not named by the font author. Items from the same font resources are collapsed into one: the closest possible match.
     * @param {PWSTR} familyName Type: \_In\_z\_ **[WCHAR](/windows/win32/winprog/windows-data-types) const\***
     * 
     * Font family name. This can be: a typographic family name, weight/stretch/style family name, GDI (RBIZ) family name, or full name.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: \_In\_reads\_(fontAxisValueCount) **[DWRITE_FONT_AXIS_VALUE](/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_axis_value) const\***
     * 
     * Array of font axis values.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Number of font axis values.
     * @param {DWRITE_FONT_SIMULATIONS} allowedSimulations Type: **[DWRITE_FONT_SIMULATIONS](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations)**
     * 
     * Specifies which simulations (that is, algorithmic emboldening and/or slant) may be applied to matching fonts to better match the specified axis values. If the argument is **DWRITE_FONT_SIMULATIONS_NONE** (0), then no simulations are applied.
     * @returns {IDWriteFontSet4} Type: \_COM\_Outptr\_ **[IDWriteFontSet4](.\nn-dwrite_3-idwritefontset4.md)\*\***
     * 
     * Receives a pointer to a newly-created font set, which contains a prioritized list of fonts that match the specified inputs.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset4-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount, allowedSimulations) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(31, this, "ptr", familyName, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, DWRITE_FONT_SIMULATIONS, allowedSimulations, "ptr*", &matchingFonts := 0, "HRESULT")
        return IDWriteFontSet4(matchingFonts)
    }

    Query(iid) {
        if (IDWriteFontSet4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConvertWeightStretchStyleToFontAxisValues := CallbackCreate(GetMethod(implObj, "ConvertWeightStretchStyleToFontAxisValues"), flags, 8)
        this.vtbl.GetMatchingFonts := CallbackCreate(GetMethod(implObj, "GetMatchingFonts"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConvertWeightStretchStyleToFontAxisValues)
        CallbackFree(this.vtbl.GetMatchingFonts)
    }
}
