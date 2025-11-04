#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a generic way to store key/value pairs on an object.
 * @remarks
 * 
  * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
  * 
  * <ul>
  * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
  * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfattributes
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAttributes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAttributes
     * @type {Guid}
     */
    static IID => Guid("{2cd2d921-c447-44a7-a13c-4adabfc247e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItem", "GetItemType", "CompareItem", "Compare", "GetUINT32", "GetUINT64", "GetDouble", "GetGUID", "GetStringLength", "GetString", "GetAllocatedString", "GetBlobSize", "GetBlob", "GetAllocatedBlob", "GetUnknown", "SetItem", "DeleteItem", "DeleteAllItems", "SetUINT32", "SetUINT64", "SetDouble", "SetGUID", "SetString", "SetBlob", "SetUnknown", "LockStore", "UnlockStore", "GetCount", "GetItemByIndex", "CopyAllItems"]

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitem
     */
    GetItem(guidKey, pValue) {
        result := ComCall(3, this, "ptr", guidKey, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitemtype
     */
    GetItemType(guidKey, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", guidKey, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} Value 
     * @param {Pointer<BOOL>} pbResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compareitem
     */
    CompareItem(guidKey, Value, pbResult) {
        result := ComCall(5, this, "ptr", guidKey, "ptr", Value, "ptr", pbResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAttributes} pTheirs 
     * @param {Integer} MatchType 
     * @param {Pointer<BOOL>} pbResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-compare
     */
    Compare(pTheirs, MatchType, pbResult) {
        result := ComCall(6, this, "ptr", pTheirs, "int", MatchType, "ptr", pbResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} punValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint32
     */
    GetUINT32(guidKey, punValue) {
        punValueMarshal := punValue is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", guidKey, punValueMarshal, punValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} punValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getuint64
     */
    GetUINT64(guidKey, punValue) {
        punValueMarshal := punValue is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", guidKey, punValueMarshal, punValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Float>} pfValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getdouble
     */
    GetDouble(guidKey, pfValue) {
        pfValueMarshal := pfValue is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, "ptr", guidKey, pfValueMarshal, pfValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} pguidValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getguid
     */
    GetGUID(guidKey, pguidValue) {
        result := ComCall(10, this, "ptr", guidKey, "ptr", pguidValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pcchLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstringlength
     */
    GetStringLength(guidKey, pcchLength) {
        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", guidKey, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {PWSTR} pwszValue 
     * @param {Integer} cchBufSize 
     * @param {Pointer<Integer>} pcchLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getstring
     */
    GetString(guidKey, pwszValue, cchBufSize, pcchLength) {
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", guidKey, "ptr", pwszValue, "uint", cchBufSize, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PWSTR>} ppwszValue 
     * @param {Pointer<Integer>} pcchLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedstring
     */
    GetAllocatedString(guidKey, ppwszValue, pcchLength) {
        pcchLengthMarshal := pcchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", guidKey, "ptr", ppwszValue, pcchLengthMarshal, pcchLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pcbBlobSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblobsize
     */
    GetBlobSize(guidKey, pcbBlobSize) {
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", guidKey, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pBuf 
     * @param {Integer} cbBufSize 
     * @param {Pointer<Integer>} pcbBlobSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getblob
     */
    GetBlob(guidKey, pBuf, cbBufSize, pcbBlobSize) {
        pBufMarshal := pBuf is VarRef ? "char*" : "ptr"
        pcbBlobSizeMarshal := pcbBlobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", guidKey, pBufMarshal, pBuf, "uint", cbBufSize, pcbBlobSizeMarshal, pcbBlobSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppBuf 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getallocatedblob
     */
    GetAllocatedBlob(guidKey, ppBuf, pcbSize) {
        ppBufMarshal := ppBuf is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", guidKey, ppBufMarshal, ppBuf, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getunknown
     */
    GetUnknown(guidKey, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", guidKey, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setitem
     */
    SetItem(guidKey, Value) {
        result := ComCall(18, this, "ptr", guidKey, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteitem
     */
    DeleteItem(guidKey) {
        result := ComCall(19, this, "ptr", guidKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-deleteallitems
     */
    DeleteAllItems() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Integer} unValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint32
     */
    SetUINT32(guidKey, unValue) {
        result := ComCall(21, this, "ptr", guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Integer} unValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setuint64
     */
    SetUINT64(guidKey, unValue) {
        result := ComCall(22, this, "ptr", guidKey, "uint", unValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Float} fValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setdouble
     */
    SetDouble(guidKey, fValue) {
        result := ComCall(23, this, "ptr", guidKey, "double", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} guidValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setguid
     */
    SetGUID(guidKey, guidValue) {
        result := ComCall(24, this, "ptr", guidKey, "ptr", guidValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {PWSTR} wszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setstring
     */
    SetString(guidKey, wszValue) {
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(25, this, "ptr", guidKey, "ptr", wszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pBuf 
     * @param {Integer} cbBufSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setblob
     */
    SetBlob(guidKey, pBuf, cbBufSize) {
        pBufMarshal := pBuf is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, "ptr", guidKey, pBufMarshal, pBuf, "uint", cbBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-setunknown
     */
    SetUnknown(guidKey, pUnknown) {
        result := ComCall(27, this, "ptr", guidKey, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-lockstore
     */
    LockStore() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-unlockstore
     */
    UnlockStore() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getcount
     */
    GetCount(pcItems) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pcItemsMarshal, pcItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unIndex 
     * @param {Pointer<Guid>} pguidKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-getitembyindex
     */
    GetItemByIndex(unIndex, pguidKey, pValue) {
        result := ComCall(31, this, "uint", unIndex, "ptr", pguidKey, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAttributes} pDest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfattributes-copyallitems
     */
    CopyAllItems(pDest) {
        result := ComCall(32, this, "ptr", pDest, "HRESULT")
        return result
    }
}
