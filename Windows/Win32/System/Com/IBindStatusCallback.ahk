#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindStatusCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindStatusCallback
     * @type {Guid}
     */
    static IID => Guid("{79eac9c1-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartBinding", "GetPriority", "OnLowResource", "OnProgress", "OnStopBinding", "GetBindInfo", "OnDataAvailable", "OnObjectAvailable"]

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {IBinding} pib 
     * @returns {HRESULT} 
     */
    OnStartBinding(dwReserved, pib) {
        result := ComCall(3, this, "uint", dwReserved, "ptr", pib, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pnPriority) {
        pnPriorityMarshal := pnPriority is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnPriorityMarshal, pnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    OnLowResource(reserved) {
        result := ComCall(5, this, "uint", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    OnProgress(ulProgress, ulProgressMax, ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(6, this, "uint", ulProgress, "uint", ulProgressMax, "uint", ulStatusCode, "ptr", szStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hresult 
     * @param {PWSTR} szError 
     * @returns {HRESULT} 
     */
    OnStopBinding(hresult, szError) {
        szError := szError is String ? StrPtr(szError) : szError

        result := ComCall(7, this, "int", hresult, "ptr", szError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {HRESULT} 
     */
    GetBindInfo(grfBINDF, pbindinfo) {
        grfBINDFMarshal := grfBINDF is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, grfBINDFMarshal, grfBINDF, "ptr", pbindinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} dwSize 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pstgmed 
     * @returns {HRESULT} 
     */
    OnDataAvailable(grfBSCF, dwSize, pformatetc, pstgmed) {
        result := ComCall(9, this, "uint", grfBSCF, "uint", dwSize, "ptr", pformatetc, "ptr", pstgmed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnObjectAvailable(riid, punk) {
        result := ComCall(10, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }
}
