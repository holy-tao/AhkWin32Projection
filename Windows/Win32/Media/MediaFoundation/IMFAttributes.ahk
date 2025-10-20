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
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetItem(guidKey, pValue) {
        result := ComCall(3, this, "ptr", guidKey, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetItemType(guidKey, pType) {
        result := ComCall(4, this, "ptr", guidKey, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} Value 
     * @param {Pointer<BOOL>} pbResult 
     * @returns {HRESULT} 
     */
    CompareItem(guidKey, Value, pbResult) {
        result := ComCall(5, this, "ptr", guidKey, "ptr", Value, "ptr", pbResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pTheirs 
     * @param {Integer} MatchType 
     * @param {Pointer<BOOL>} pbResult 
     * @returns {HRESULT} 
     */
    Compare(pTheirs, MatchType, pbResult) {
        result := ComCall(6, this, "ptr", pTheirs, "int", MatchType, "ptr", pbResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<UInt32>} punValue 
     * @returns {HRESULT} 
     */
    GetUINT32(guidKey, punValue) {
        result := ComCall(7, this, "ptr", guidKey, "uint*", punValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<UInt64>} punValue 
     * @returns {HRESULT} 
     */
    GetUINT64(guidKey, punValue) {
        result := ComCall(8, this, "ptr", guidKey, "uint*", punValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Double>} pfValue 
     * @returns {HRESULT} 
     */
    GetDouble(guidKey, pfValue) {
        result := ComCall(9, this, "ptr", guidKey, "double*", pfValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} pguidValue 
     * @returns {HRESULT} 
     */
    GetGUID(guidKey, pguidValue) {
        result := ComCall(10, this, "ptr", guidKey, "ptr", pguidValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<UInt32>} pcchLength 
     * @returns {HRESULT} 
     */
    GetStringLength(guidKey, pcchLength) {
        result := ComCall(11, this, "ptr", guidKey, "uint*", pcchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {PWSTR} pwszValue 
     * @param {Integer} cchBufSize 
     * @param {Pointer<UInt32>} pcchLength 
     * @returns {HRESULT} 
     */
    GetString(guidKey, pwszValue, cchBufSize, pcchLength) {
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(12, this, "ptr", guidKey, "ptr", pwszValue, "uint", cchBufSize, "uint*", pcchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PWSTR>} ppwszValue 
     * @param {Pointer<UInt32>} pcchLength 
     * @returns {HRESULT} 
     */
    GetAllocatedString(guidKey, ppwszValue, pcchLength) {
        result := ComCall(13, this, "ptr", guidKey, "ptr", ppwszValue, "uint*", pcchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<UInt32>} pcbBlobSize 
     * @returns {HRESULT} 
     */
    GetBlobSize(guidKey, pcbBlobSize) {
        result := ComCall(14, this, "ptr", guidKey, "uint*", pcbBlobSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} pBuf 
     * @param {Integer} cbBufSize 
     * @param {Pointer<UInt32>} pcbBlobSize 
     * @returns {HRESULT} 
     */
    GetBlob(guidKey, pBuf, cbBufSize, pcbBlobSize) {
        result := ComCall(15, this, "ptr", guidKey, "char*", pBuf, "uint", cbBufSize, "uint*", pcbBlobSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} ppBuf 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetAllocatedBlob(guidKey, ppBuf, pcbSize) {
        result := ComCall(16, this, "ptr", guidKey, "char*", ppBuf, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetUnknown(guidKey, riid, ppv) {
        result := ComCall(17, this, "ptr", guidKey, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<PROPVARIANT>} Value 
     * @returns {HRESULT} 
     */
    SetItem(guidKey, Value) {
        result := ComCall(18, this, "ptr", guidKey, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @returns {HRESULT} 
     */
    DeleteItem(guidKey) {
        result := ComCall(19, this, "ptr", guidKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAllItems() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Integer} unValue 
     * @returns {HRESULT} 
     */
    SetUINT32(guidKey, unValue) {
        result := ComCall(21, this, "ptr", guidKey, "uint", unValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Integer} unValue 
     * @returns {HRESULT} 
     */
    SetUINT64(guidKey, unValue) {
        result := ComCall(22, this, "ptr", guidKey, "uint", unValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Float} fValue 
     * @returns {HRESULT} 
     */
    SetDouble(guidKey, fValue) {
        result := ComCall(23, this, "ptr", guidKey, "double", fValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Guid>} guidValue 
     * @returns {HRESULT} 
     */
    SetGUID(guidKey, guidValue) {
        result := ComCall(24, this, "ptr", guidKey, "ptr", guidValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {PWSTR} wszValue 
     * @returns {HRESULT} 
     */
    SetString(guidKey, wszValue) {
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := ComCall(25, this, "ptr", guidKey, "ptr", wszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} pBuf 
     * @param {Integer} cbBufSize 
     * @returns {HRESULT} 
     */
    SetBlob(guidKey, pBuf, cbBufSize) {
        result := ComCall(26, this, "ptr", guidKey, "char*", pBuf, "uint", cbBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<IUnknown>} pUnknown 
     * @returns {HRESULT} 
     */
    SetUnknown(guidKey, pUnknown) {
        result := ComCall(27, this, "ptr", guidKey, "ptr", pUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockStore() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockStore() {
        result := ComCall(29, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcItems 
     * @returns {HRESULT} 
     */
    GetCount(pcItems) {
        result := ComCall(30, this, "uint*", pcItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} unIndex 
     * @param {Pointer<Guid>} pguidKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetItemByIndex(unIndex, pguidKey, pValue) {
        result := ComCall(31, this, "uint", unIndex, "ptr", pguidKey, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pDest 
     * @returns {HRESULT} 
     */
    CopyAllItems(pDest) {
        result := ComCall(32, this, "ptr", pDest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
