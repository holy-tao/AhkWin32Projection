#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to access the details of the path keys.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nn-wmiutils-iwbempathkeylist
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemPathKeyList extends IUnknown{
    /**
     * The interface identifier for IWbemPathKeyList
     * @type {Guid}
     */
    static IID => Guid("{9ae62877-7544-4bb0-aa26-a13824659ed6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puKeyCount 
     * @returns {HRESULT} 
     */
    GetCount(puKeyCount) {
        result := ComCall(3, this, "uint*", puKeyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @param {Integer} uCimType 
     * @param {Pointer<Void>} pKeyVal 
     * @returns {HRESULT} 
     */
    SetKey(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(4, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, "ptr", pKeyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @param {Integer} uCimType 
     * @param {Pointer<VARIANT>} pKeyVal 
     * @returns {HRESULT} 
     */
    SetKey2(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, "ptr", pKeyVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uKeyIx 
     * @param {Integer} uFlags 
     * @param {Pointer<UInt32>} puNameBufSize 
     * @param {PWSTR} pszKeyName 
     * @param {Pointer<UInt32>} puKeyValBufSize 
     * @param {Pointer<Void>} pKeyVal 
     * @param {Pointer<UInt32>} puApparentCimType 
     * @returns {HRESULT} 
     */
    GetKey(uKeyIx, uFlags, puNameBufSize, pszKeyName, puKeyValBufSize, pKeyVal, puApparentCimType) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        result := ComCall(6, this, "uint", uKeyIx, "uint", uFlags, "uint*", puNameBufSize, "ptr", pszKeyName, "uint*", puKeyValBufSize, "ptr", pKeyVal, "uint*", puApparentCimType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uKeyIx 
     * @param {Integer} uFlags 
     * @param {Pointer<UInt32>} puNameBufSize 
     * @param {PWSTR} pszKeyName 
     * @param {Pointer<VARIANT>} pKeyValue 
     * @param {Pointer<UInt32>} puApparentCimType 
     * @returns {HRESULT} 
     */
    GetKey2(uKeyIx, uFlags, puNameBufSize, pszKeyName, pKeyValue, puApparentCimType) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        result := ComCall(7, this, "uint", uKeyIx, "uint", uFlags, "uint*", puNameBufSize, "ptr", pszKeyName, "ptr", pKeyValue, "uint*", puApparentCimType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    RemoveKey(wszName, uFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(8, this, "ptr", wszName, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    RemoveAllKeys(uFlags) {
        result := ComCall(9, this, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bSet 
     * @returns {HRESULT} 
     */
    MakeSingleton(bSet) {
        result := ComCall(10, this, "char", bSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uRequestedInfo 
     * @param {Pointer<UInt64>} puResponse 
     * @returns {HRESULT} 
     */
    GetInfo(uRequestedInfo, puResponse) {
        result := ComCall(11, this, "uint", uRequestedInfo, "uint*", puResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<UInt32>} puBuffLength 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(12, this, "int", lFlags, "uint*", puBuffLength, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
