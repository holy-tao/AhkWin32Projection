#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFaxIncomingMessageIterator.ahk
#Include .\IFaxIncomingMessage.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxIncomingArchive interface is used by a fax client application to access and configure the archive of inbound fax messages received successfully by the fax service.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxincomingarchive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxIncomingArchive extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxIncomingArchive
     * @type {Guid}
     */
    static IID => Guid("{76062cc7-f714-4fbd-aa06-ed6e4a4b70f3}")

    /**
     * The class identifier for FaxIncomingArchive
     * @type {Guid}
     */
    static CLSID => Guid("{8426c56a-35a1-4c6f-af93-fc952422e2c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseArchive", "put_UseArchive", "get_ArchiveFolder", "put_ArchiveFolder", "get_SizeQuotaWarning", "put_SizeQuotaWarning", "get_HighQuotaWaterMark", "put_HighQuotaWaterMark", "get_LowQuotaWaterMark", "put_LowQuotaWaterMark", "get_AgeLimit", "put_AgeLimit", "get_SizeLow", "get_SizeHigh", "Refresh", "Save", "GetMessages", "GetMessage"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_usearchive
     */
    get_UseArchive() {
        result := ComCall(7, this, "short*", &pbUseArchive := 0, "HRESULT")
        return pbUseArchive
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_archivefolder
     */
    get_ArchiveFolder() {
        pbstrArchiveFolder := BSTR()
        result := ComCall(9, this, "ptr", pbstrArchiveFolder, "HRESULT")
        return pbstrArchiveFolder
    }

    /**
     * 
     * @param {BSTR} bstrArchiveFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_archivefolder
     */
    put_ArchiveFolder(bstrArchiveFolder) {
        bstrArchiveFolder := bstrArchiveFolder is String ? BSTR.Alloc(bstrArchiveFolder).Value : bstrArchiveFolder

        result := ComCall(10, this, "ptr", bstrArchiveFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizequotawarning
     */
    get_SizeQuotaWarning() {
        result := ComCall(11, this, "short*", &pbSizeQuotaWarning := 0, "HRESULT")
        return pbSizeQuotaWarning
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_highquotawatermark
     */
    get_HighQuotaWaterMark() {
        result := ComCall(13, this, "int*", &plHighQuotaWaterMark := 0, "HRESULT")
        return plHighQuotaWaterMark
    }

    /**
     * 
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_lowquotawatermark
     */
    get_LowQuotaWaterMark() {
        result := ComCall(15, this, "int*", &plLowQuotaWaterMark := 0, "HRESULT")
        return plLowQuotaWaterMark
    }

    /**
     * 
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_agelimit
     */
    get_AgeLimit() {
        result := ComCall(17, this, "int*", &plAgeLimit := 0, "HRESULT")
        return plAgeLimit
    }

    /**
     * 
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-put_agelimit
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(18, this, "int", lAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizelow
     */
    get_SizeLow() {
        result := ComCall(19, this, "int*", &plSizeLow := 0, "HRESULT")
        return plSizeLow
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizehigh
     */
    get_SizeHigh() {
        result := ComCall(20, this, "int*", &plSizeHigh := 0, "HRESULT")
        return plSizeHigh
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-refresh
     */
    Refresh() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-save
     */
    Save() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @returns {IFaxIncomingMessageIterator} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize) {
        result := ComCall(23, this, "int", lPrefetchSize, "ptr*", &pFaxIncomingMessageIterator := 0, "HRESULT")
        return IFaxIncomingMessageIterator(pFaxIncomingMessageIterator)
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @returns {IFaxIncomingMessage} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(bstrMessageId) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(24, this, "ptr", bstrMessageId, "ptr*", &pFaxIncomingMessage := 0, "HRESULT")
        return IFaxIncomingMessage(pFaxIncomingMessage)
    }
}
