#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) extended event descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbExtendedEventDescriptor extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDescriptorNumber", "GetLastDescriptorNumber", "GetLanguageCode", "GetCountOfRecords", "GetRecordItemW", "GetConcatenatedItemW", "GetTextW", "GetConcatenatedTextW", "GetRecordItemRawBytes"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getdescriptornumber
     */
    GetDescriptorNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlastdescriptornumber
     */
    GetLastDescriptorNumber() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(7, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @param {Pointer<BSTR>} pbstrItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemw
     */
    GetRecordItemW(bRecordIndex, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(9, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDvbExtendedEventDescriptor} pFollowingDescriptor 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc 
     * @param {Pointer<BSTR>} pbstrItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenateditemw
     */
    GetConcatenatedItemW(pFollowingDescriptor, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(10, this, "ptr", pFollowingDescriptor, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(11, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * 
     * @param {IDvbExtendedEventDescriptor} FollowingDescriptor 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenatedtextw
     */
    GetConcatenatedTextW(FollowingDescriptor, convMode) {
        pbstrText := BSTR()
        result := ComCall(12, this, "ptr", FollowingDescriptor, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Pointer<Integer>>} ppbRawItem 
     * @param {Pointer<Integer>} pbItemLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemrawbytes
     */
    GetRecordItemRawBytes(bRecordIndex, ppbRawItem, pbItemLength) {
        ppbRawItemMarshal := ppbRawItem is VarRef ? "ptr*" : "ptr"
        pbItemLengthMarshal := pbItemLength is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "char", bRecordIndex, ppbRawItemMarshal, ppbRawItem, pbItemLengthMarshal, pbItemLength, "HRESULT")
        return result
    }
}
