#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IInternetProtocolRoot.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocol extends IInternetProtocolRoot{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocol
     * @type {Guid}
     */
    static IID => Guid("{79eac9e4-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Seek", "LockRequest", "UnlockRequest"]

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    Read(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pvMarshal, pv, "uint", cb, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

    /**
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @returns {Integer} 
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(10, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    LockRequest(dwOptions) {
        result := ComCall(11, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockRequest() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
