#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFile.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\DWRITE_FONT_AXIS_RANGE.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFontFace5.ahk
#Include .\IDWriteFontFaceReference1.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides axis information for a font resource, and is used to create specific font face instances.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontresource
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontResource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontResource
     * @type {Guid}
     */
    static IID => Guid("{1f803a76-6871-48e8-987f-b975551c50f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFile", "GetFontFaceIndex", "GetFontAxisCount", "GetDefaultFontAxisValues", "GetFontAxisRanges", "GetFontAxisAttributes", "GetAxisNames", "GetAxisValueNameCount", "GetAxisValueNames", "HasVariations", "CreateFontFace", "CreateFontFaceReference"]

    /**
     * Retrieves the font file of the resource.
     * @returns {IDWriteFontFile} Type: **[IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFile](../dwrite/nn-dwrite-idwritefontfile.md) interface. On successful completion, the function sets the pointer to the font file object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontfile
     */
    GetFontFile() {
        result := ComCall(3, this, "ptr*", &fontFile := 0, "HRESULT")
        return IDWriteFontFile(fontFile)
    }

    /**
     * Retrieves the zero-based index of the font face within its font file.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The zero-based index of the font face within its font file.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Retrieves the number of axes supported by the font resource.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of axes defined by the font face.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxiscount
     */
    GetFontAxisCount() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * Retrieves the default values for all axes supported by the font resource.
     * @remarks
     * Different font resources may have different defaults. For OpenType 1.8 fonts, these values come from the STAT and fvar tables. For older fonts without a STAT table, weight-width-slant-italic are read from the OS/2 table.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of font axis values to write into the memory block pointed to by `fontAxisValues`.
     * @returns {DWRITE_FONT_AXIS_VALUE} Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md)\***
     * 
     * A pointer to an array of **DWRITE_FONT_AXIS_VALUE** structures into which **GetDefaultFontAxisValues** writes the list of font axis values. You're responsible for managing the size and the lifetime of this array. Call [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) to determine the size of array to allocate.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getdefaultfontaxisvalues
     */
    GetDefaultFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(6, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }

    /**
     * Retrieves the value ranges of each axis.
     * @remarks
     * A non-varying axis has an empty range (*minValue* == *maxValue*).
     * @param {Integer} fontAxisRangeCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of font axis value ranges to write into the memory block pointed to by `fontAxisRanges`.
     * @returns {DWRITE_FONT_AXIS_RANGE} Type: **[DWRITE_FONT_AXIS_RANGE](./ns-dwrite_3-dwrite_font_axis_range.md)\***
     * 
     * A pointer to an array of **DWRITE_FONT_AXIS_RANGE** structures into which **GetFontAxisRanges** writes the list of font axis value ranges. You're responsible for managing the size and the lifetime of this array. Call [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) to determine the size of array to allocate.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxisranges
     */
    GetFontAxisRanges(fontAxisRangeCount) {
        fontAxisRanges := DWRITE_FONT_AXIS_RANGE()
        result := ComCall(7, this, "ptr", fontAxisRanges, "uint", fontAxisRangeCount, "HRESULT")
        return fontAxisRanges
    }

    /**
     * Retrieves attributes describing the given axis, such as whether the font author recommends to hide the axis in user interfaces.
     * @param {Integer} axisIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Font axis, from 0 to [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) minus 1.
     * @returns {Integer} Type: **[DWRITE_FONT_AXIS_ATTRIBUTES](./ne-dwrite_3-dwrite_font_axis_attributes.md)**
     * 
     * The attributes for the given axis, or **DWRITE_FONT_AXIS_ATTRIBUTES_NONE** if *axisIndex* is beyond the font count.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxisattributes
     */
    GetFontAxisAttributes(axisIndex) {
        result := ComCall(8, this, "uint", axisIndex, "int")
        return result
    }

    /**
     * Retrieves the localized names of a font axis.
     * @remarks
     * The font author may not have supplied names for some font axes. The localized strings will be empty in that case.
     * @param {Integer} axisIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Font axis, from 0 to [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) minus 1.
     * @returns {IDWriteLocalizedStrings} Type: **[IDWriteLocalizedStrings](../dwrite/nn-dwrite-idwritelocalizedstrings.md)\*\***
     * 
     * The address of a pointer to an [IDWriteLocalizedStrings](../dwrite/nn-dwrite-idwritelocalizedstrings.md) interface. On successful completion, the function sets the pointer to a newly created localized strings object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisnames
     */
    GetAxisNames(axisIndex) {
        result := ComCall(9, this, "uint", axisIndex, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Retrieves the number of named values for a specific axis.
     * @param {Integer} axisIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Font axis, from 0 to [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) minus 1.
     * @returns {Integer} Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of named values for the axis specified by *axisIndex*.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisvaluenamecount
     */
    GetAxisValueNameCount(axisIndex) {
        result := ComCall(10, this, "uint", axisIndex, "uint")
        return result
    }

    /**
     * Retrieves the localized names of specific values for a font axis.
     * @remarks
     * The font author may not have supplied names for some font axis values. The localized strings will be empty in that case. The range may be a single point, where *minValue* == *maxValue*. All ranges are in ascending order by *axisValueIndex*.
     * @param {Integer} axisIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Font axis, from 0 to [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) minus 1.
     * @param {Integer} axisValueIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Value index, from 0 to [GetAxisValueNameCount](./nf-dwrite_3-idwritefontresource-getaxisvaluenamecount.md) minus 1.
     * @param {Pointer<DWRITE_FONT_AXIS_RANGE>} fontAxisRange Type: **[DWRITE_FONT_AXIS_RANGE](./ns-dwrite_3-dwrite_font_axis_range.md)\***
     * 
     * Range of the named value.
     * @param {Pointer<IDWriteLocalizedStrings>} names Type: **[IDWriteLocalizedStrings](../dwrite/nn-dwrite-idwritelocalizedstrings.md)\*\***
     * 
     * The address of a pointer to an [IDWriteLocalizedStrings](../dwrite/nn-dwrite-idwritelocalizedstrings.md) interface. On successful completion, the function sets the pointer to a newly created localized strings object.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/win32/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getaxisvaluenames
     */
    GetAxisValueNames(axisIndex, axisValueIndex, fontAxisRange, names) {
        result := ComCall(11, this, "uint", axisIndex, "uint", axisValueIndex, "ptr", fontAxisRange, "ptr*", names, "HRESULT")
        return result
    }

    /**
     * Determines whether this font face's resource supports any variable axes. (IDWriteFontResource::HasVariations)
     * @returns {BOOL} Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the font face's resource supports any variable axes. Otherwise, `false`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-hasvariations
     */
    HasVariations() {
        result := ComCall(12, this, "int")
        return result
    }

    /**
     * Creates a font face instance with specific axis values.
     * @remarks
     * The axis values that you provide are permitted to be a subset or superset of all the ones actually supported by the font. Any unspecified axes use their default values: values beyond the ranges are clamped, and any non-varying axes have no effect.
     * @param {Integer} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontFace5} Type: **[IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFace5](./nn-dwrite_3-idwritefontface5.md) interface. On successful completion, the function sets the pointer to a newly created font face object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-createfontface
     */
    CreateFontFace(fontSimulations, fontAxisValues, fontAxisValueCount) {
        result := ComCall(13, this, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * Creates a font face reference with specific axis values.
     * @remarks
     * The axis values that you provide are permitted to be a subset or superset of all the ones actually supported by the font. Any unspecified axes use their default values: values beyond the ranges are clamped, and any non-varying axes have no effect.
     * @param {Integer} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
     * 
     * Font face simulation flags for algorithmic emboldening and italicization.
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues Type: **[DWRITE_FONT_AXIS_VALUE](./ns-dwrite_3-dwrite_font_axis_value.md) const \***
     * 
     * A pointer to an array containing a list of font axis values. The array should be the size (the number of elements) indicated by the *fontAxisValueCount* argument.
     * @param {Integer} fontAxisValueCount Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of font axis values contained in the *fontAxisValues* array.
     * @returns {IDWriteFontFaceReference1} Type: **[IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md)\*\***
     * 
     * The address of a pointer to an [IDWriteFontFaceReference1](./nn-dwrite_3-idwritefontfacereference1.md) interface. On successful completion, the function sets the pointer to a newly created font face reference object, otherwise it sets the pointer to `nullptr`.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-createfontfacereference
     */
    CreateFontFaceReference(fontSimulations, fontAxisValues, fontAxisValueCount) {
        result := ComCall(14, this, "int", fontSimulations, "ptr", fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }
}
