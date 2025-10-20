#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextStyle2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRuby", "GetBouten", "IsTextCombined", "GetFontAngleInDegrees"]

    /**
     * 
     * @param {Pointer<IMFTimedTextRuby>} ruby 
     * @returns {HRESULT} 
     */
    GetRuby(ruby) {
        result := ComCall(3, this, "ptr*", ruby, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextBouten>} bouten 
     * @returns {HRESULT} 
     */
    GetBouten(bouten) {
        result := ComCall(4, this, "ptr*", bouten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    IsTextCombined(value) {
        result := ComCall(5, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    GetFontAngleInDegrees(value) {
        result := ComCall(6, this, "double*", value, "HRESULT")
        return result
    }
}
