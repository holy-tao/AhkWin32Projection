#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedTextRuby.ahk
#Include .\TimedTextBouten.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextStyle3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextStyle3
     * @type {Guid}
     */
    static IID => Guid("{f803f93b-3e99-595e-bbb7-78a2fa13c270}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Ruby", "get_Bouten", "get_IsTextCombined", "put_IsTextCombined", "get_FontAngleInDegrees", "put_FontAngleInDegrees"]

    /**
     * @type {TimedTextRuby} 
     */
    Ruby {
        get => this.get_Ruby()
    }

    /**
     * @type {TimedTextBouten} 
     */
    Bouten {
        get => this.get_Bouten()
    }

    /**
     * @type {Boolean} 
     */
    IsTextCombined {
        get => this.get_IsTextCombined()
        set => this.put_IsTextCombined(value)
    }

    /**
     * @type {Float} 
     */
    FontAngleInDegrees {
        get => this.get_FontAngleInDegrees()
        set => this.put_FontAngleInDegrees(value)
    }

    /**
     * 
     * @returns {TimedTextRuby} 
     */
    get_Ruby() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextRuby(value)
    }

    /**
     * 
     * @returns {TimedTextBouten} 
     */
    get_Bouten() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedTextBouten(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextCombined() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextCombined(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontAngleInDegrees() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontAngleInDegrees(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
