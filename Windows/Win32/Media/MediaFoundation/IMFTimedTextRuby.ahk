#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextRuby extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextRuby
     * @type {Guid}
     */
    static IID => Guid("{76c6a6f5-4955-4de5-b27b-14b734cc14b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} rubyText 
     * @returns {HRESULT} 
     */
    GetRubyText(rubyText) {
        result := ComCall(3, this, "ptr", rubyText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetRubyPosition(value) {
        result := ComCall(4, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetRubyAlign(value) {
        result := ComCall(5, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetRubyReserve(value) {
        result := ComCall(6, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
