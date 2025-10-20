#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindStatusCallback extends IUnknown{
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
     * 
     * @param {Integer} dwReserved 
     * @param {Pointer<IBinding>} pib 
     * @returns {HRESULT} 
     */
    OnStartBinding(dwReserved, pib) {
        result := ComCall(3, this, "uint", dwReserved, "ptr", pib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pnPriority) {
        result := ComCall(4, this, "int*", pnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    OnLowResource(reserved) {
        result := ComCall(5, this, "uint", reserved, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(6, this, "uint", ulProgress, "uint", ulProgressMax, "uint", ulStatusCode, "ptr", szStatusText, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "int", hresult, "ptr", szError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {HRESULT} 
     */
    GetBindInfo(grfBINDF, pbindinfo) {
        result := ComCall(8, this, "uint*", grfBINDF, "ptr", pbindinfo, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(9, this, "uint", grfBSCF, "uint", dwSize, "ptr", pformatetc, "ptr", pstgmed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    OnObjectAvailable(riid, punk) {
        result := ComCall(10, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
