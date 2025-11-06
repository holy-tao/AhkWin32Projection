#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextRuby.ahk
#Include .\IMFTimedTextBouten.ahk
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
     * @returns {IMFTimedTextRuby} 
     */
    GetRuby() {
        result := ComCall(3, this, "ptr*", &ruby := 0, "HRESULT")
        return IMFTimedTextRuby(ruby)
    }

    /**
     * 
     * @returns {IMFTimedTextBouten} 
     */
    GetBouten() {
        result := ComCall(4, this, "ptr*", &bouten := 0, "HRESULT")
        return IMFTimedTextBouten(bouten)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsTextCombined() {
        result := ComCall(5, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    GetFontAngleInDegrees() {
        result := ComCall(6, this, "double*", &value := 0, "HRESULT")
        return value
    }
}
