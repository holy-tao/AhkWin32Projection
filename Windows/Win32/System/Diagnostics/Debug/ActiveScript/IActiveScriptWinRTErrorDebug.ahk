#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IActiveScriptError.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IActiveScriptWinRTErrorDebug extends IActiveScriptError {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRestrictedErrorString", "GetRestrictedErrorReference", "GetCapabilitySid"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetRestrictedErrorString() {
        errorString := BSTR({Value: 0}, True)
        result := ComCall(6, this, "ptr", errorString, "HRESULT")
        return errorString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRestrictedErrorReference() {
        referenceString := BSTR({Value: 0}, True)
        result := ComCall(7, this, "ptr", referenceString, "HRESULT")
        return referenceString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCapabilitySid() {
        capabilitySid := BSTR({Value: 0}, True)
        result := ComCall(8, this, "ptr", capabilitySid, "HRESULT")
        return capabilitySid
    }
}
