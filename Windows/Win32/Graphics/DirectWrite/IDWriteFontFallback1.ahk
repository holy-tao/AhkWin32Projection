#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }
#Import ".\IDWriteFontFace5.ahk" { IDWriteFontFace5 }
#Import ".\IDWriteFontFallback.ahk" { IDWriteFontFallback }
#Import ".\IDWriteTextAnalysisSource.ahk" { IDWriteTextAnalysisSource }

/**
 * Allows you to access fallback fonts from the font list.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfallback1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFallback1 extends IDWriteFontFallback {
    /**
     * The interface identifier for IDWriteFontFallback1
     * @type {Guid}
     */
    static IID := Guid("{2397599d-dd0d-4681-bd6a-f4f31eaade77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFallback1 interfaces
    */
    struct Vtbl extends IDWriteFontFallback.Vtbl {
        MapCharacters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFallback1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDWriteTextAnalysisSource} analysisSource 
     * @param {Integer} textPosition 
     * @param {Integer} textLength 
     * @param {IDWriteFontCollection} baseFontCollection 
     * @param {PWSTR} baseFamilyName 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<Integer>} mappedLength 
     * @param {Pointer<Float>} scale 
     * @param {Pointer<IDWriteFontFace5>} mappedFontFace 
     * @returns {HRESULT} 
     */
    MapCharacters(analysisSource, textPosition, textLength, baseFontCollection, baseFamilyName, fontAxisValues, fontAxisValueCount, mappedLength, scale, mappedFontFace) {
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        mappedLengthMarshal := mappedLength is VarRef ? "uint*" : "ptr"
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "ptr", analysisSource, UInt32, textPosition, UInt32, textLength, "ptr", baseFontCollection, "ptr", baseFamilyName, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, UInt32, fontAxisValueCount, mappedLengthMarshal, mappedLength, scaleMarshal, scale, IDWriteFontFace5.Ptr, mappedFontFace, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IDWriteFontFallback1.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapCharacters := CallbackCreate(GetMethod(implObj, "MapCharacters"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapCharacters)
    }
}
