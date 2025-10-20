#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) extended event descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbExtendedEventDescriptor extends IUnknown{
    /**
     * The interface identifier for IDvbExtendedEventDescriptor
     * @type {Guid}
     */
    static IID => Guid("{c9b22eca-85f4-499f-b1db-efa93a91ee57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetDescriptorNumber(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLastDescriptorNumber(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pszCode 
     * @returns {HRESULT} 
     */
    GetLanguageCode(pszCode) {
        result := ComCall(7, this, "char*", pszCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @param {Pointer<BSTR>} pbstrItem 
     * @returns {HRESULT} 
     */
    GetRecordItemW(bRecordIndex, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(9, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDvbExtendedEventDescriptor>} pFollowingDescriptor 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @param {Pointer<BSTR>} pbstrItem 
     * @returns {HRESULT} 
     */
    GetConcatenatedItemW(pFollowingDescriptor, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(10, this, "ptr", pFollowingDescriptor, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    GetTextW(convMode, pbstrText) {
        result := ComCall(11, this, "int", convMode, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDvbExtendedEventDescriptor>} FollowingDescriptor 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    GetConcatenatedTextW(FollowingDescriptor, convMode, pbstrText) {
        result := ComCall(12, this, "ptr", FollowingDescriptor, "int", convMode, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Byte>} ppbRawItem 
     * @param {Pointer<Byte>} pbItemLength 
     * @returns {HRESULT} 
     */
    GetRecordItemRawBytes(bRecordIndex, ppbRawItem, pbItemLength) {
        result := ComCall(13, this, "char", bRecordIndex, "char*", ppbRawItem, "char*", pbItemLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
