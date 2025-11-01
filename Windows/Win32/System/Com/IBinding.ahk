#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBinding extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinding
     * @type {Guid}
     */
    static IID => Guid("{79eac9c0-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Abort", "Suspend", "Resume", "SetPriority", "GetPriority", "GetBindResult"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Suspend() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPriority 
     * @returns {HRESULT} 
     */
    SetPriority(nPriority) {
        result := ComCall(6, this, "int", nPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pnPriority) {
        result := ComCall(7, this, "int*", pnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsidProtocol 
     * @param {Pointer<Integer>} pdwResult 
     * @param {Pointer<PWSTR>} pszResult 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindResult(pclsidProtocol, pdwResult, pszResult, pdwReserved) {
        result := ComCall(8, this, "ptr", pclsidProtocol, "uint*", pdwResult, "ptr", pszResult, "uint*", pdwReserved, "HRESULT")
        return result
    }
}
