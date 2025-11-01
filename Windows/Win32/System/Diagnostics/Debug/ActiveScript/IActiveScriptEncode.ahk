#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptEncode extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptEncode
     * @type {Guid}
     */
    static IID => Guid("{bb1a2ae3-a4f9-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncodeSection", "DecodeScript", "GetEncodeProgId"]

    /**
     * 
     * @param {PWSTR} pchIn 
     * @param {Integer} cchIn 
     * @param {PWSTR} pchOut 
     * @param {Integer} cchOut 
     * @param {Pointer<Integer>} pcchRet 
     * @returns {HRESULT} 
     */
    EncodeSection(pchIn, cchIn, pchOut, cchOut, pcchRet) {
        pchIn := pchIn is String ? StrPtr(pchIn) : pchIn
        pchOut := pchOut is String ? StrPtr(pchOut) : pchOut

        result := ComCall(3, this, "ptr", pchIn, "uint", cchIn, "ptr", pchOut, "uint", cchOut, "uint*", pcchRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pchIn 
     * @param {Integer} cchIn 
     * @param {PWSTR} pchOut 
     * @param {Integer} cchOut 
     * @param {Pointer<Integer>} pcchRet 
     * @returns {HRESULT} 
     */
    DecodeScript(pchIn, cchIn, pchOut, cchOut, pcchRet) {
        pchIn := pchIn is String ? StrPtr(pchIn) : pchIn
        pchOut := pchOut is String ? StrPtr(pchOut) : pchOut

        result := ComCall(4, this, "ptr", pchIn, "uint", cchIn, "ptr", pchOut, "uint", cchOut, "uint*", pcchRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOut 
     * @returns {HRESULT} 
     */
    GetEncodeProgId(pbstrOut) {
        result := ComCall(5, this, "ptr", pbstrOut, "HRESULT")
        return result
    }
}
