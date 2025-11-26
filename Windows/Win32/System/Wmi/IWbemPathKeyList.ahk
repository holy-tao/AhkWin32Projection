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
     * The IWbemPathKeyList::GetCount method retrieves the number of keys in the path.
     * @returns {Integer} Number of keys.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &puKeyCount := 0, "HRESULT")
        return puKeyCount
    }

    /**
     * Sets the name or value pair for a key.
     * @param {PWSTR} wszName Key name, may be <b>NULL</b>.
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @param {Integer} uCimType CIMTYPE size.
     * @param {Pointer<Void>} pKeyVal Pointer to the data. The data pointed to varies depending on the <i>uCimType</i> parameter.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-setkey
     */
    SetKey(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        pKeyValMarshal := pKeyVal is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, pKeyValMarshal, pKeyVal, "HRESULT")
        return result
    }

    /**
     * Sets the name or value pair for a key using variants.
     * @param {PWSTR} wszName Key name, may be <b>NULL</b>.
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @param {Integer} uCimType CIMTYPE size.
     * @param {Pointer<VARIANT>} pKeyVal Pointer to a variant that contains the data.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-setkey2
     */
    SetKey2(wszName, uFlags, uCimType, pKeyVal) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(5, this, "ptr", wszName, "uint", uFlags, "uint", uCimType, "ptr", pKeyVal, "HRESULT")
        return result
    }

    /**
     * The IWbemPathKeyList::GetKey method retrieves a key's name or value. Keys are indexed from 0 (zero), though the order of the keys is not significant.
     * @param {Integer} uKeyIx Key index beginning at 0 (zero).
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @param {Pointer<Integer>} puNameBufSize Caller sets this to the number of characters that the name buffer can hold. Upon success, this is set to the number of characters copied into the buffer including the terminating <b>NULL</b>.
     * @param {PWSTR} pszKeyName Buffer into which the name is to be copied. Because not all keys have a name, this parameter value would be <b>NULL</b> for an implicit key.
     * @param {Pointer<Integer>} puKeyValBufSize Caller sets this to the number of characters that the value buffer can hold. Upon success, this is set to the number of characters copied into the buffer including the <b>NULL</b> terminator.
     * @param {Pointer<Void>} pKeyVal Buffer where data is to be copied.
     * @returns {Integer} Pointer to a long which is set to the CIM type.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-getkey
     */
    GetKey(uKeyIx, uFlags, puNameBufSize, pszKeyName, puKeyValBufSize, pKeyVal) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        puNameBufSizeMarshal := puNameBufSize is VarRef ? "uint*" : "ptr"
        puKeyValBufSizeMarshal := puKeyValBufSize is VarRef ? "uint*" : "ptr"
        pKeyValMarshal := pKeyVal is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "uint", uKeyIx, "uint", uFlags, puNameBufSizeMarshal, puNameBufSize, "ptr", pszKeyName, puKeyValBufSizeMarshal, puKeyValBufSize, pKeyValMarshal, pKeyVal, "uint*", &puApparentCimType := 0, "HRESULT")
        return puApparentCimType
    }

    /**
     * The IWbemPathKeyList::GetKey2 method retrieves a key name or value, and returns the value as a VARIANT. A key is indexed from 0 (zero), but the key order is not significant.
     * @param {Integer} uKeyIx Key index begins at 0 (zero).
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @param {Pointer<Integer>} puNameBufSize Caller sets this parameter to the number of characters that the name buffer can hold. When successful, this is set to the number of characters that are copied into the buffer—including the terminating <b>NULL</b>.
     * @param {PWSTR} pszKeyName Buffer into which the name is copied. Because not all keys have a name, this parameter value is <b>NULL</b> for an implicit key.
     * @param {Pointer<VARIANT>} pKeyValue Pointer to a variant that contains the key value.
     * @returns {Integer} Pointer to a long integer that is set to the CIM type.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-getkey2
     */
    GetKey2(uKeyIx, uFlags, puNameBufSize, pszKeyName, pKeyValue) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        puNameBufSizeMarshal := puNameBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", uKeyIx, "uint", uFlags, puNameBufSizeMarshal, puNameBufSize, "ptr", pszKeyName, "ptr", pKeyValue, "uint*", &puApparentCimType := 0, "HRESULT")
        return puApparentCimType
    }

    /**
     * The IWbemPathKeyList::RemoveKey method removes the key that matches the wszName parameter.
     * @param {PWSTR} wszName Name of the key to be removed.
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-removekey
     */
    RemoveKey(wszName, uFlags) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(8, this, "ptr", wszName, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemPathKeyList::RemoveAllKeys method removes all keys.
     * @param {Integer} uFlags Reserved. Must be 0 (zero).
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-removeallkeys
     */
    RemoveAllKeys(uFlags) {
        result := ComCall(9, this, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemPathKeyList::MakeSingleton method governs whether or not a key is singleton.
     * @param {Integer} bSet If <b>TRUE</b>, the key becomes singleton. If <b>FALSE</b>, the key is no longer singleton.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-makesingleton
     */
    MakeSingleton(bSet) {
        result := ComCall(10, this, "char", bSet, "HRESULT")
        return result
    }

    /**
     * The IWbemPathKeyList::GetInfo method retrieves the status bits for the key.
     * @param {Integer} uRequestedInfo Reserved. Must be 0 (zero).
     * @returns {Integer} Status for the key. The following bits indicate the values available.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-getinfo
     */
    GetInfo(uRequestedInfo) {
        result := ComCall(11, this, "uint", uRequestedInfo, "uint*", &puResponse := 0, "HRESULT")
        return puResponse
    }

    /**
     * The IWbemPathKeyList::GetText method retrieves the key list as text.
     * @param {Integer} lFlags Flags which control the format of the text. The following list lists the valid flag values.
     * @param {Pointer<Integer>} puBuffLength Caller sets this to the number of characters that the buffer can hold. Upon success, this is set to the number of characters copied into the buffer, including the <b>NULL</b> terminator.
     * @param {PWSTR} pszText Buffer into which the text is copied.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call.
     * @see https://docs.microsoft.com/windows/win32/api//wmiutils/nf-wmiutils-iwbempathkeylist-gettext
     */
    GetText(lFlags, puBuffLength, pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        puBuffLengthMarshal := puBuffLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", lFlags, puBuffLengthMarshal, puBuffLength, "ptr", pszText, "HRESULT")
        return result
    }
}
