#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetCacheHints extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetCacheHints
     * @type {Guid}
     */
    static IID => Guid("{dd1ec3b3-8391-4fdb-a9e6-347c3caaa7dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCacheExtension"]

    /**
     * 
     * @param {PWSTR} pwzExt 
     * @param {Pointer<Void>} pszCacheFile 
     * @param {Pointer<Integer>} pcbCacheFile 
     * @param {Pointer<Integer>} pdwWinInetError 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    SetCacheExtension(pwzExt, pszCacheFile, pcbCacheFile, pdwWinInetError, pdwReserved) {
        pwzExt := pwzExt is String ? StrPtr(pwzExt) : pwzExt

        pszCacheFileMarshal := pszCacheFile is VarRef ? "ptr" : "ptr"
        pcbCacheFileMarshal := pcbCacheFile is VarRef ? "uint*" : "ptr"
        pdwWinInetErrorMarshal := pdwWinInetError is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzExt, pszCacheFileMarshal, pszCacheFile, pcbCacheFileMarshal, pcbCacheFile, pdwWinInetErrorMarshal, pdwWinInetError, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
