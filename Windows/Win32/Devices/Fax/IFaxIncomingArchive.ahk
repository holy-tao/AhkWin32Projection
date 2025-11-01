#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<VARIANT_BOOL>} pbUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_usearchive
     */
    get_UseArchive(pbUseArchive) {
        result := ComCall(7, this, "ptr", pbUseArchive, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrArchiveFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_archivefolder
     */
    get_ArchiveFolder(pbstrArchiveFolder) {
        result := ComCall(9, this, "ptr", pbstrArchiveFolder, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizequotawarning
     */
    get_SizeQuotaWarning(pbSizeQuotaWarning) {
        result := ComCall(11, this, "ptr", pbSizeQuotaWarning, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_highquotawatermark
     */
    get_HighQuotaWaterMark(plHighQuotaWaterMark) {
        result := ComCall(13, this, "int*", plHighQuotaWaterMark, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_lowquotawatermark
     */
    get_LowQuotaWaterMark(plLowQuotaWaterMark) {
        result := ComCall(15, this, "int*", plLowQuotaWaterMark, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_agelimit
     */
    get_AgeLimit(plAgeLimit) {
        result := ComCall(17, this, "int*", plAgeLimit, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plSizeLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizelow
     */
    get_SizeLow(plSizeLow) {
        result := ComCall(19, this, "int*", plSizeLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-get_sizehigh
     */
    get_SizeHigh(plSizeHigh) {
        result := ComCall(20, this, "int*", plSizeHigh, "HRESULT")
        return result
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
     * @param {Pointer<IFaxIncomingMessageIterator>} pFaxIncomingMessageIterator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingarchive-getmessages
     */
    GetMessages(lPrefetchSize, pFaxIncomingMessageIterator) {
        result := ComCall(23, this, "int", lPrefetchSize, "ptr*", pFaxIncomingMessageIterator, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @param {Pointer<IFaxIncomingMessage>} pFaxIncomingMessage 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function retrieves a message other than <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a>, the return value is nonzero.
     * 
     * If the function retrieves the <a href="/windows/desktop/winmsg/wm-quit">WM_QUIT</a> message, the return value is zero. 
     * 
     * If there is an error, the return value is -1. For example, the function fails if <i>hWnd</i> is an invalid window handle or <i>lpMsg</i> is an invalid pointer. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Because the return value can be nonzero, zero, or -1, avoid code like this:
     * 
     * 
     * ```
     * while (GetMessage( lpMsg, hWnd, 0, 0)) ...
     * ```
     * 
     * 
     * The possibility of a -1 return value in the case that hWnd is an invalid parameter (such as referring to a window that has already been destroyed) means that such code can lead to fatal application errors. Instead, use code like this:
     * 
     * 
     * ```
     * BOOL bRet;
     * 
     * while( (bRet = GetMessage( &msg, hWnd, 0, 0 )) != 0)
     * { 
     *     if (bRet == -1)
     *     {
     *         // handle the error and possibly exit
     *     }
     *     else
     *     {
     *         TranslateMessage(&msg); 
     *         DispatchMessage(&msg); 
     *     }
     * }
     * ```
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmessage
     */
    GetMessage(bstrMessageId, pFaxIncomingMessage) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(24, this, "ptr", bstrMessageId, "ptr*", pFaxIncomingMessage, "HRESULT")
        return result
    }
}
