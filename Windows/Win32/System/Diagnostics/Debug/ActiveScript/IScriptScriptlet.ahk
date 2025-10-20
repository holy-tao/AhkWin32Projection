#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IScriptEntry.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IScriptScriptlet extends IScriptEntry{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScriptScriptlet
     * @type {Guid}
     */
    static IID => Guid("{0aee2a96-bcbb-11d0-8c72-00c04fc2b085}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubItemName", "SetSubItemName", "GetEventName", "SetEventName", "GetSimpleEventName", "SetSimpleEventName"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetSubItemName(pbstr) {
        result := ComCall(24, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetSubItemName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(25, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetEventName(pbstr) {
        result := ComCall(26, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetEventName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(27, this, "ptr", psz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetSimpleEventName(pbstr) {
        result := ComCall(28, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} psz 
     * @returns {HRESULT} 
     */
    SetSimpleEventName(psz) {
        psz := psz is String ? StrPtr(psz) : psz

        result := ComCall(29, this, "ptr", psz, "HRESULT")
        return result
    }
}
