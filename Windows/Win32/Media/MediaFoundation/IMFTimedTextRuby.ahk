#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextRuby extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRubyText", "GetRubyPosition", "GetRubyAlign", "GetRubyReserve"]

    /**
     * 
     * @param {Pointer<PWSTR>} rubyText 
     * @returns {HRESULT} 
     */
    GetRubyText(rubyText) {
        result := ComCall(3, this, "ptr", rubyText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetRubyPosition(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetRubyAlign(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetRubyReserve(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, valueMarshal, value, "HRESULT")
        return result
    }
}
