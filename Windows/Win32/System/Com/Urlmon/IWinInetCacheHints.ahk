#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetCacheHints extends IUnknown{
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
     * 
     * @param {PWSTR} pwzExt 
     * @param {Pointer<Void>} pszCacheFile 
     * @param {Pointer<UInt32>} pcbCacheFile 
     * @param {Pointer<UInt32>} pdwWinInetError 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    SetCacheExtension(pwzExt, pszCacheFile, pcbCacheFile, pdwWinInetError, pdwReserved) {
        pwzExt := pwzExt is String ? StrPtr(pwzExt) : pwzExt

        result := ComCall(3, this, "ptr", pwzExt, "ptr", pszCacheFile, "uint*", pcbCacheFile, "uint*", pdwWinInetError, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
