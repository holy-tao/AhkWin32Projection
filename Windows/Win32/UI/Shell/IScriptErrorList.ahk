#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IScriptErrorList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptErrorList
     * @type {Guid}
     */
    static IID => Guid("{f3470f24-15fd-11d2-bb2e-00805ff7efca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["advanceError", "retreatError", "canAdvanceError", "canRetreatError", "getErrorLine", "getErrorChar", "getErrorCode", "getErrorMsg", "getErrorUrl", "getAlwaysShowLockState", "getDetailsPaneOpen", "setDetailsPaneOpen", "getPerErrorDisplay", "setPerErrorDisplay"]

    /**
     * 
     * @returns {HRESULT} 
     */
    advanceError() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    retreatError() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    canAdvanceError() {
        result := ComCall(9, this, "int*", &pfCanAdvance := 0, "HRESULT")
        return pfCanAdvance
    }

    /**
     * 
     * @returns {BOOL} 
     */
    canRetreatError() {
        result := ComCall(10, this, "int*", &pfCanRetreat := 0, "HRESULT")
        return pfCanRetreat
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorLine() {
        result := ComCall(11, this, "int*", &plLine := 0, "HRESULT")
        return plLine
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorChar() {
        result := ComCall(12, this, "int*", &plChar := 0, "HRESULT")
        return plChar
    }

    /**
     * 
     * @returns {Integer} 
     */
    getErrorCode() {
        result := ComCall(13, this, "int*", &plCode := 0, "HRESULT")
        return plCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getErrorMsg() {
        pstr := BSTR()
        result := ComCall(14, this, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    getErrorUrl() {
        pstr := BSTR()
        result := ComCall(15, this, "ptr", pstr, "HRESULT")
        return pstr
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getAlwaysShowLockState() {
        result := ComCall(16, this, "int*", &pfAlwaysShowLocked := 0, "HRESULT")
        return pfAlwaysShowLocked
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getDetailsPaneOpen() {
        result := ComCall(17, this, "int*", &pfDetailsPaneOpen := 0, "HRESULT")
        return pfDetailsPaneOpen
    }

    /**
     * 
     * @param {BOOL} fDetailsPaneOpen 
     * @returns {HRESULT} 
     */
    setDetailsPaneOpen(fDetailsPaneOpen) {
        result := ComCall(18, this, "int", fDetailsPaneOpen, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    getPerErrorDisplay() {
        result := ComCall(19, this, "int*", &pfPerErrorDisplay := 0, "HRESULT")
        return pfPerErrorDisplay
    }

    /**
     * 
     * @param {BOOL} fPerErrorDisplay 
     * @returns {HRESULT} 
     */
    setPerErrorDisplay(fPerErrorDisplay) {
        result := ComCall(20, this, "int", fPerErrorDisplay, "HRESULT")
        return result
    }
}
