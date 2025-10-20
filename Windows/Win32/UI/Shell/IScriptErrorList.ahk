#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IScriptErrorList extends IDispatch{
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
     * 
     * @returns {HRESULT} 
     */
    advanceError() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    retreatError() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCanAdvance 
     * @returns {HRESULT} 
     */
    canAdvanceError(pfCanAdvance) {
        result := ComCall(9, this, "ptr", pfCanAdvance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCanRetreat 
     * @returns {HRESULT} 
     */
    canRetreatError(pfCanRetreat) {
        result := ComCall(10, this, "ptr", pfCanRetreat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLine 
     * @returns {HRESULT} 
     */
    getErrorLine(plLine) {
        result := ComCall(11, this, "int*", plLine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plChar 
     * @returns {HRESULT} 
     */
    getErrorChar(plChar) {
        result := ComCall(12, this, "int*", plChar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCode 
     * @returns {HRESULT} 
     */
    getErrorCode(plCode) {
        result := ComCall(13, this, "int*", plCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     */
    getErrorMsg(pstr) {
        result := ComCall(14, this, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstr 
     * @returns {HRESULT} 
     */
    getErrorUrl(pstr) {
        result := ComCall(15, this, "ptr", pstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfAlwaysShowLocked 
     * @returns {HRESULT} 
     */
    getAlwaysShowLockState(pfAlwaysShowLocked) {
        result := ComCall(16, this, "ptr", pfAlwaysShowLocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDetailsPaneOpen 
     * @returns {HRESULT} 
     */
    getDetailsPaneOpen(pfDetailsPaneOpen) {
        result := ComCall(17, this, "ptr", pfDetailsPaneOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fDetailsPaneOpen 
     * @returns {HRESULT} 
     */
    setDetailsPaneOpen(fDetailsPaneOpen) {
        result := ComCall(18, this, "int", fDetailsPaneOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPerErrorDisplay 
     * @returns {HRESULT} 
     */
    getPerErrorDisplay(pfPerErrorDisplay) {
        result := ComCall(19, this, "ptr", pfPerErrorDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fPerErrorDisplay 
     * @returns {HRESULT} 
     */
    setPerErrorDisplay(fPerErrorDisplay) {
        result := ComCall(20, this, "int", fPerErrorDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
