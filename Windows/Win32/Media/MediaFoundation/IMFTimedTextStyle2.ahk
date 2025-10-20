#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextStyle2 extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextStyle2
     * @type {Guid}
     */
    static IID => Guid("{db639199-c809-4c89-bfca-d0bbb9729d6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFTimedTextRuby>} ruby 
     * @returns {HRESULT} 
     */
    GetRuby(ruby) {
        result := ComCall(3, this, "ptr", ruby, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextBouten>} bouten 
     * @returns {HRESULT} 
     */
    GetBouten(bouten) {
        result := ComCall(4, this, "ptr", bouten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    IsTextCombined(value) {
        result := ComCall(5, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} value 
     * @returns {HRESULT} 
     */
    GetFontAngleInDegrees(value) {
        result := ComCall(6, this, "double*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
