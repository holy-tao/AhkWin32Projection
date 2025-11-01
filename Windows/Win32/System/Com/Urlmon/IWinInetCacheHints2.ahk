#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWinInetCacheHints.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetCacheHints2 extends IWinInetCacheHints{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetCacheHints2
     * @type {Guid}
     */
    static IID => Guid("{7857aeac-d31f-49bf-884e-dd46df36780a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCacheExtension2"]

    /**
     * 
     * @param {PWSTR} pwzExt 
     * @param {PWSTR} pwzCacheFile 
     * @param {Pointer<Integer>} pcchCacheFile 
     * @param {Pointer<Integer>} pdwWinInetError 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    SetCacheExtension2(pwzExt, pwzCacheFile, pcchCacheFile, pdwWinInetError, pdwReserved) {
        pwzExt := pwzExt is String ? StrPtr(pwzExt) : pwzExt
        pwzCacheFile := pwzCacheFile is String ? StrPtr(pwzCacheFile) : pwzCacheFile

        pcchCacheFileMarshal := pcchCacheFile is VarRef ? "uint*" : "ptr"
        pdwWinInetErrorMarshal := pdwWinInetError is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzExt, "ptr", pwzCacheFile, pcchCacheFileMarshal, pcchCacheFile, pdwWinInetErrorMarshal, pdwWinInetError, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }
}
