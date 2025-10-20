#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptError.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptWinRTErrorDebug extends IActiveScriptError{
    /**
     * The interface identifier for IActiveScriptWinRTErrorDebug
     * @type {Guid}
     */
    static IID => Guid("{73a3f82a-0fe9-4b33-ba3b-fe095f697e0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<BSTR>} errorString 
     * @returns {HRESULT} 
     */
    GetRestrictedErrorString(errorString) {
        result := ComCall(6, this, "ptr", errorString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} referenceString 
     * @returns {HRESULT} 
     */
    GetRestrictedErrorReference(referenceString) {
        result := ComCall(7, this, "ptr", referenceString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} capabilitySid 
     * @returns {HRESULT} 
     */
    GetCapabilitySid(capabilitySid) {
        result := ComCall(8, this, "ptr", capabilitySid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
