#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the style for timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtextstyle
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextStyle extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextStyle
     * @type {Guid}
     */
    static IID => Guid("{09b2455d-b834-4f01-a347-9052e21c450e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsExternal() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} fontFamily 
     * @returns {HRESULT} 
     */
    GetFontFamily(fontFamily) {
        result := ComCall(5, this, "ptr", fontFamily, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} fontSize 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetFontSize(fontSize, unitType) {
        result := ComCall(6, this, "double*", fontSize, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} color 
     * @returns {HRESULT} 
     */
    GetColor(color) {
        result := ComCall(7, this, "ptr", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} bgColor 
     * @returns {HRESULT} 
     */
    GetBackgroundColor(bgColor) {
        result := ComCall(8, this, "ptr", bgColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} showBackgroundAlways 
     * @returns {HRESULT} 
     */
    GetShowBackgroundAlways(showBackgroundAlways) {
        result := ComCall(9, this, "ptr", showBackgroundAlways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} fontStyle 
     * @returns {HRESULT} 
     */
    GetFontStyle(fontStyle) {
        result := ComCall(10, this, "int*", fontStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} bold 
     * @returns {HRESULT} 
     */
    GetBold(bold) {
        result := ComCall(11, this, "ptr", bold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} rightToLeft 
     * @returns {HRESULT} 
     */
    GetRightToLeft(rightToLeft) {
        result := ComCall(12, this, "ptr", rightToLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} textAlign 
     * @returns {HRESULT} 
     */
    GetTextAlignment(textAlign) {
        result := ComCall(13, this, "int*", textAlign, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} textDecoration 
     * @returns {HRESULT} 
     */
    GetTextDecoration(textDecoration) {
        result := ComCall(14, this, "uint*", textDecoration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFARGB>} color 
     * @param {Pointer<Double>} thickness 
     * @param {Pointer<Double>} blurRadius 
     * @param {Pointer<Int32>} unitType 
     * @returns {HRESULT} 
     */
    GetTextOutline(color, thickness, blurRadius, unitType) {
        result := ComCall(15, this, "ptr", color, "double*", thickness, "double*", blurRadius, "int*", unitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
