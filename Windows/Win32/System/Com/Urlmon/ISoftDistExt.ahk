#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class ISoftDistExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftDistExt
     * @type {Guid}
     */
    static IID => Guid("{b15b8dc1-c7e1-11d0-8680-00aa00bdcb71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessSoftDist", "GetFirstCodeBase", "GetNextCodeBase", "AsyncInstallDistributionUnit"]

    /**
     * 
     * @param {PWSTR} szCDFURL 
     * @param {IXMLElement} pSoftDistElement 
     * @param {Pointer<SOFTDISTINFO>} lpsdi 
     * @returns {HRESULT} 
     */
    ProcessSoftDist(szCDFURL, pSoftDistElement, lpsdi) {
        szCDFURL := szCDFURL is String ? StrPtr(szCDFURL) : szCDFURL

        result := ComCall(3, this, "ptr", szCDFURL, "ptr", pSoftDistElement, "ptr", lpsdi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szCodeBase 
     * @param {Pointer<Integer>} dwMaxSize 
     * @returns {HRESULT} 
     */
    GetFirstCodeBase(szCodeBase, dwMaxSize) {
        result := ComCall(4, this, "ptr", szCodeBase, "uint*", dwMaxSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szCodeBase 
     * @param {Pointer<Integer>} dwMaxSize 
     * @returns {HRESULT} 
     */
    GetNextCodeBase(szCodeBase, dwMaxSize) {
        result := ComCall(5, this, "ptr", szCodeBase, "uint*", dwMaxSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Void>} pvReserved 
     * @param {Integer} flags 
     * @param {Pointer<CODEBASEHOLD>} lpcbh 
     * @returns {HRESULT} 
     */
    AsyncInstallDistributionUnit(pbc, pvReserved, flags, lpcbh) {
        result := ComCall(6, this, "ptr", pbc, "ptr", pvReserved, "uint", flags, "ptr", lpcbh, "HRESULT")
        return result
    }
}
