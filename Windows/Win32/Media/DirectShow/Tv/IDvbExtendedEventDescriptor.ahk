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
     * Gets the tag that identifies a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB  extended event descriptors, this value is "0x4E".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the event descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the descriptor number from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the descriptor number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getdescriptornumber
     */
    GetDescriptorNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of the last descriptor associated with this descriptor from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the last descriptor number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlastdescriptornumber
     */
    GetLastDescriptorNumber() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Pointer to the buffer that receives the language code. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(7, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * Gets the number of item records in a Digital Video Broadcast (DVB) extended event descriptor.
     * @returns {Integer} Receives the number of item records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the item and descriptor from a Digital Videl Broadcast (DVB) extended event descriptor, in Unicode string format.
     * @param {Integer} bRecordIndex Specifies the item record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords">IDvbExtendedEventDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc Pointer to a buffer that receives the item description. The caller is responsible for freeing this memory.
     * @param {Pointer<BSTR>} pbstrItem Pointer to a buffer that receives the item text. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemw
     */
    GetRecordItemW(bRecordIndex, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(9, this, "char", bRecordIndex, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "HRESULT")
        return result
    }

    /**
     * Concatenates the bytes from the item in the current Digital Video Broadcast (DVB) extended event descriptor with the bytes from the item in the next DVB extended event descriptor and returns the concatenated data as a Unicode string.
     * @param {IDvbExtendedEventDescriptor} pFollowingDescriptor Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor">IDvbExtendedEventDescriptor</a> interface for the next DVB extended event descriptor associated with the current one.
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrDesc Pointer to a buffer that receives the concatenated item descriptor. The caller is responsible for freeing this memory.
     * @param {Pointer<BSTR>} pbstrItem Pointer to a buffer that receives the concatenated item string. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenateditemw
     */
    GetConcatenatedItemW(pFollowingDescriptor, convMode, pbstrDesc, pbstrItem) {
        result := ComCall(10, this, "ptr", pFollowingDescriptor, "int", convMode, "ptr", pbstrDesc, "ptr", pbstrItem, "HRESULT")
        return result
    }

    /**
     * Gets the text describing an itemfrom a Digital Video Broadcast (DVB) extended event descriptor, in string format.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the event description. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(11, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * Gets the concatenation of the text description in the current item with the text description in the next item (both in Unicode format) of a Digital Video Broadcast (DVB) extended event descriptor.
     * @param {IDvbExtendedEventDescriptor} FollowingDescriptor Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvbextendedeventdescriptor">IDvbExtendedEventDescriptor</a> interface for the next extended event descriptor that is associated with the current event descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to the buffer that receives the concatenated item text. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getconcatenatedtextw
     */
    GetConcatenatedTextW(FollowingDescriptor, convMode) {
        pbstrText := BSTR()
        result := ComCall(12, this, "ptr", FollowingDescriptor, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * Gets the raw data from the current item in a Digital Video Broadcast (DVB) extended event descriptor.
     * @param {Integer} bRecordIndex Specifies the item record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getcountofrecords">IDvbExtendedEventDescriptor::GetCountOfRecords</a>method to get the number of records in the extended event descriptor.
     * @param {Pointer<Pointer<Integer>>} ppbRawItem Pointer to a buffer that gets the item data. The caller is responsible for freeing this memory.
     * @param {Pointer<Integer>} pbItemLength Receives the number of bytes in the item description.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbextendedeventdescriptor-getrecorditemrawbytes
     */
    GetRecordItemRawBytes(bRecordIndex, ppbRawItem, pbItemLength) {
        ppbRawItemMarshal := ppbRawItem is VarRef ? "ptr*" : "ptr"
        pbItemLengthMarshal := pbItemLength is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "char", bRecordIndex, ppbRawItemMarshal, ppbRawItem, pbItemLengthMarshal, pbItemLength, "HRESULT")
        return result
    }
}
