#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet4.ahk
#Include .\IDWriteFontSet3.ahk

/**
 * Represents a font set. (IDWriteFontSet4)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nn-dwrite_3-idwritefontset4
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet4 extends IDWriteFontSet3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet4
     * @type {Guid}
     */
    static IID => Guid("{eec175fc-bea9-4c86-8b53-ccbdd7df0c82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConvertWeightStretchStyleToFontAxisValues", "GetMatchingFonts"]

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
     * @param {Integer} fontWeight Type: **[DWRITE_FONT_WEIGHT](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight)**
     * 
     * Font weight, used to compute "wght" axis value.
     * @param {Integer} fontStretch Type: **[DWRITE_FONT_STRETCH](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch)**
     * 
     * Font stretch, used to compute "wdth" axis value.
     * @param {Integer} fontStyle_ Type: **[DWRITE_FONT_STYLE](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style)**
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
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontset4-convertweightstretchstyletofontaxisvalues
     */
    ConvertWeightStretchStyleToFontAxisValues(inputAxisValues, inputAxisCount, fontWeight, fontStretch, fontStyle_, fontSize, outputAxisValues) {
        result := ComCall(30, this, "ptr", inputAxisValues, "uint", inputAxisCount, "int", fontWeight, "int", fontStretch, "int", fontStyle_, "float", fontSize, "ptr", outputAxisValues, "uint")
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
     * @param {Integer} allowedSimulations Type: **[DWRITE_FONT_SIMULATIONS](/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations)**
     * 
     * Specifies which simulations (that is, algorithmic emboldening and/or slant) may be applied to matching fonts to better match the specified axis values. If the argument is **DWRITE_FONT_SIMULATIONS_NONE** (0), then no simulations are applied.
     * @returns {Pointer<IDWriteFontSet4>} Type: \_COM\_Outptr\_ **[IDWriteFontSet4](.\nn-dwrite_3-idwritefontset4.md)\*\***
     * 
     * Receives a pointer to a newly-created font set, which contains a prioritized list of fonts that match the specified inputs.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite_3/nf-dwrite_3-idwritefontset4-getmatchingfonts
     */
    GetMatchingFonts(familyName, fontAxisValues, fontAxisValueCount, allowedSimulations) {
        familyName := familyName is String ? StrPtr(familyName) : familyName

        result := ComCall(31, this, "ptr", familyName, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int", allowedSimulations, "ptr*", &matchingFonts := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return matchingFonts
    }
}
