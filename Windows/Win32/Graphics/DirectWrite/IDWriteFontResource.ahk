#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_FONT_AXIS_ATTRIBUTES.ahk" { DWRITE_FONT_AXIS_ATTRIBUTES }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\DWRITE_FONT_AXIS_RANGE.ahk" { DWRITE_FONT_AXIS_RANGE }
#Import ".\IDWriteFontFile.ahk" { IDWriteFontFile }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteLocalizedStrings.ahk" { IDWriteLocalizedStrings }
#Import ".\IDWriteFontFaceReference1.ahk" { IDWriteFontFaceReference1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteFontFace5.ahk" { IDWriteFontFace5 }

/**
 * Provides axis information for a font resource, and is used to create specific font face instances.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontresource
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontResource extends IUnknown {
    /**
     * The interface identifier for IDWriteFontResource
     * @type {Guid}
     */
    static IID := Guid("{1f803a76-6871-48e8-987f-b975551c50f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontResource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFontFile              : IntPtr
        GetFontFaceIndex         : IntPtr
        GetFontAxisCount         : IntPtr
        GetDefaultFontAxisValues : IntPtr
        GetFontAxisRanges        : IntPtr
        GetFontAxisAttributes    : IntPtr
        GetAxisNames             : IntPtr
        GetAxisValueNameCount    : IntPtr
        GetAxisValueNames        : IntPtr
        HasVariations            : IntPtr
        CreateFontFace           : IntPtr
        CreateFontFaceReference  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(4, this, UInt32)
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
        result := ComCall(5, this, UInt32)
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
        result := ComCall(6, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
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
        result := ComCall(7, this, DWRITE_FONT_AXIS_RANGE.Ptr, fontAxisRanges, "uint", fontAxisRangeCount, "HRESULT")
        return fontAxisRanges
    }

    /**
     * Retrieves attributes describing the given axis, such as whether the font author recommends to hide the axis in user interfaces.
     * @param {Integer} axisIndex Type: **[UINT32](/windows/win32/winprog/windows-data-types)**
     * 
     * Font axis, from 0 to [GetFontAxisCount](./nf-dwrite_3-idwritefontresource-getfontaxiscount.md) minus 1.
     * @returns {DWRITE_FONT_AXIS_ATTRIBUTES} Type: **[DWRITE_FONT_AXIS_ATTRIBUTES](./ne-dwrite_3-dwrite_font_axis_attributes.md)**
     * 
     * The attributes for the given axis, or **DWRITE_FONT_AXIS_ATTRIBUTES_NONE** if *axisIndex* is beyond the font count.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontresource-getfontaxisattributes
     */
    GetFontAxisAttributes(axisIndex) {
        result := ComCall(8, this, "uint", axisIndex, DWRITE_FONT_AXIS_ATTRIBUTES)
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
        result := ComCall(10, this, "uint", axisIndex, UInt32)
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
        result := ComCall(11, this, "uint", axisIndex, "uint", axisValueIndex, DWRITE_FONT_AXIS_RANGE.Ptr, fontAxisRange, IDWriteLocalizedStrings.Ptr, names, "HRESULT")
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
        result := ComCall(12, this, BOOL)
        return result
    }

    /**
     * Creates a font face instance with specific axis values.
     * @remarks
     * The axis values that you provide are permitted to be a subset or superset of all the ones actually supported by the font. Any unspecified axes use their default values: values beyond the ranges are clamped, and any non-varying axes have no effect.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
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
        result := ComCall(13, this, DWRITE_FONT_SIMULATIONS, fontSimulations, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace5(fontFace)
    }

    /**
     * Creates a font face reference with specific axis values.
     * @remarks
     * The axis values that you provide are permitted to be a subset or superset of all the ones actually supported by the font. Any unspecified axes use their default values: values beyond the ranges are clamped, and any non-varying axes have no effect.
     * @param {DWRITE_FONT_SIMULATIONS} fontSimulations Type: **[DWRITE_FONT_SIMULATIONS](../dwrite/ne-dwrite-dwrite_font_simulations.md)**
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
        result := ComCall(14, this, DWRITE_FONT_SIMULATIONS, fontSimulations, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference1(fontFaceReference)
    }

    Query(iid) {
        if (IDWriteFontResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontFile := CallbackCreate(GetMethod(implObj, "GetFontFile"), flags, 2)
        this.vtbl.GetFontFaceIndex := CallbackCreate(GetMethod(implObj, "GetFontFaceIndex"), flags, 1)
        this.vtbl.GetFontAxisCount := CallbackCreate(GetMethod(implObj, "GetFontAxisCount"), flags, 1)
        this.vtbl.GetDefaultFontAxisValues := CallbackCreate(GetMethod(implObj, "GetDefaultFontAxisValues"), flags, 3)
        this.vtbl.GetFontAxisRanges := CallbackCreate(GetMethod(implObj, "GetFontAxisRanges"), flags, 3)
        this.vtbl.GetFontAxisAttributes := CallbackCreate(GetMethod(implObj, "GetFontAxisAttributes"), flags, 2)
        this.vtbl.GetAxisNames := CallbackCreate(GetMethod(implObj, "GetAxisNames"), flags, 3)
        this.vtbl.GetAxisValueNameCount := CallbackCreate(GetMethod(implObj, "GetAxisValueNameCount"), flags, 2)
        this.vtbl.GetAxisValueNames := CallbackCreate(GetMethod(implObj, "GetAxisValueNames"), flags, 5)
        this.vtbl.HasVariations := CallbackCreate(GetMethod(implObj, "HasVariations"), flags, 1)
        this.vtbl.CreateFontFace := CallbackCreate(GetMethod(implObj, "CreateFontFace"), flags, 5)
        this.vtbl.CreateFontFaceReference := CallbackCreate(GetMethod(implObj, "CreateFontFaceReference"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontFile)
        CallbackFree(this.vtbl.GetFontFaceIndex)
        CallbackFree(this.vtbl.GetFontAxisCount)
        CallbackFree(this.vtbl.GetDefaultFontAxisValues)
        CallbackFree(this.vtbl.GetFontAxisRanges)
        CallbackFree(this.vtbl.GetFontAxisAttributes)
        CallbackFree(this.vtbl.GetAxisNames)
        CallbackFree(this.vtbl.GetAxisValueNameCount)
        CallbackFree(this.vtbl.GetAxisValueNames)
        CallbackFree(this.vtbl.HasVariations)
        CallbackFree(this.vtbl.CreateFontFace)
        CallbackFree(this.vtbl.CreateFontFaceReference)
    }
}
