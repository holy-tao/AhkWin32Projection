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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "SetKey", "SetKey2", "GetKey", "GetKey2", "RemoveKey", "RemoveAllKeys", "MakeSingleton", "GetInfo", "GetText"]

    /**
     * 
     * @param {Pointer<Integer>} puKeyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-getcount
     */
    GetCount(puKeyCount) {
        puKeyCountMarshal := puKeyCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puKeyCountMarshal, puKeyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @param {Integer} uCimType 
     * @param {Pointer<Void>} pKeyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-setkey
     */
    SetKey(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pKeyValMarshal := pKeyVal is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, pKeyValMarshal, pKeyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @param {Integer} uCimType 
     * @param {Pointer<VARIANT>} pKeyVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-setkey2
     */
    SetKey2(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, "ptr", pKeyVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uKeyIx 
     * @param {Integer} uFlags 
     * @param {Pointer<Integer>} puNameBufSize 
     * @param {PWSTR} pszKeyName 
     * @param {Pointer<Integer>} puKeyValBufSize 
     * @param {Pointer<Void>} pKeyVal 
     * @param {Pointer<Integer>} puApparentCimType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-getkey
     */
    GetKey(uKeyIx, uFlags, puNameBufSize, pszKeyName, puKeyValBufSize, pKeyVal, puApparentCimType) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        puNameBufSizeMarshal := puNameBufSize is VarRef ? "uint*" : "ptr"
        puKeyValBufSizeMarshal := puKeyValBufSize is VarRef ? "uint*" : "ptr"
        pKeyValMarshal := pKeyVal is VarRef ? "ptr" : "ptr"
        puApparentCimTypeMarshal := puApparentCimType is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", uKeyIx, "uint", uFlags, puNameBufSizeMarshal, puNameBufSize, "ptr", pszKeyName, puKeyValBufSizeMarshal, puKeyValBufSize, pKeyValMarshal, pKeyVal, puApparentCimTypeMarshal, puApparentCimType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uKeyIx 
     * @param {Integer} uFlags 
     * @param {Pointer<Integer>} puNameBufSize 
     * @param {PWSTR} pszKeyName 
     * @param {Pointer<VARIANT>} pKeyValue 
     * @param {Pointer<Integer>} puApparentCimType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-getkey2
     */
    GetKey2(uKeyIx, uFlags, puNameBufSize, pszKeyName, pKeyValue, puApparentCimType) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        puNameBufSizeMarshal := puNameBufSize is VarRef ? "uint*" : "ptr"
        puApparentCimTypeMarshal := puApparentCimType is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", uKeyIx, "uint", uFlags, puNameBufSizeMarshal, puNameBufSize, "ptr", pszKeyName, "ptr", pKeyValue, puApparentCimTypeMarshal, puApparentCimType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszName 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-removekey
     */
    RemoveKey(wszName, uFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(8, this, "ptr", wszName, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-removeallkeys
     */
    RemoveAllKeys(uFlags) {
        result := ComCall(9, this, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-makesingleton
     */
    MakeSingleton(bSet) {
        result := ComCall(10, this, "char", bSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uRequestedInfo 
     * @param {Pointer<Integer>} puResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-getinfo
     */
    GetInfo(uRequestedInfo, puResponse) {
        puResponseMarshal := puResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", uRequestedInfo, puResponseMarshal, puResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<Integer>} puBuffLength 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmiutils/nf-wmiutils-iwbempathkeylist-gettext
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", lFlags, puBuffLengthMarshal, puBuffLength, "ptr", pszText, "HRESULT")
        return result
    }
}
