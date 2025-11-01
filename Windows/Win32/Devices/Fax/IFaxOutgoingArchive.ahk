#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutgoingArchive interface describes a configuration object that is used by a fax client application to access and configure the archive of outbound fax messages transmitted successfully by the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutgoingArchive</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingarchive">FaxOutgoingArchive</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutgoingarchive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutgoingArchive extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutgoingArchive
     * @type {Guid}
     */
    static IID => Guid("{c9c28f40-8d80-4e53-810f-9a79919b49fd}")

    /**
     * The class identifier for FaxOutgoingArchive
     * @type {Guid}
     */
    static CLSID => Guid("{43c28403-e04f-474d-990c-b94669148f59}")

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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_usearchive
     */
    get_UseArchive(pbUseArchive) {
        result := ComCall(7, this, "ptr", pbUseArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_usearchive
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrArchiveFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_archivefolder
     */
    get_ArchiveFolder(pbstrArchiveFolder) {
        result := ComCall(9, this, "ptr", pbstrArchiveFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrArchiveFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_archivefolder
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
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_sizequotawarning
     */
    get_SizeQuotaWarning(pbSizeQuotaWarning) {
        result := ComCall(11, this, "ptr", pbSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_sizequotawarning
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_highquotawatermark
     */
    get_HighQuotaWaterMark(plHighQuotaWaterMark) {
        plHighQuotaWaterMarkMarshal := plHighQuotaWaterMark is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plHighQuotaWaterMarkMarshal, plHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_highquotawatermark
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_lowquotawatermark
     */
    get_LowQuotaWaterMark(plLowQuotaWaterMark) {
        plLowQuotaWaterMarkMarshal := plLowQuotaWaterMark is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plLowQuotaWaterMarkMarshal, plLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_lowquotawatermark
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_agelimit
     */
    get_AgeLimit(plAgeLimit) {
        plAgeLimitMarshal := plAgeLimit is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plAgeLimitMarshal, plAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-put_agelimit
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(18, this, "int", lAgeLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeLow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_sizelow
     */
    get_SizeLow(plSizeLow) {
        plSizeLowMarshal := plSizeLow is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plSizeLowMarshal, plSizeLow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-get_sizehigh
     */
    get_SizeHigh(plSizeHigh) {
        plSizeHighMarshal := plSizeHigh is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, plSizeHighMarshal, plSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-refresh
     */
    Refresh() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-save
     */
    Save() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @param {Pointer<IFaxOutgoingMessageIterator>} pFaxOutgoingMessageIterator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingarchive-getmessages
     */
    GetMessages(lPrefetchSize, pFaxOutgoingMessageIterator) {
        result := ComCall(23, this, "int", lPrefetchSize, "ptr*", pFaxOutgoingMessageIterator, "HRESULT")
        return result
    }

    /**
     * Retrieves a message from the calling thread's message queue. The function dispatches incoming sent messages until a posted message is available for retrieval.
     * @param {BSTR} bstrMessageId 
     * @param {Pointer<IFaxOutgoingMessage>} pFaxOutgoingMessage 
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
    GetMessage(bstrMessageId, pFaxOutgoingMessage) {
        bstrMessageId := bstrMessageId is String ? BSTR.Alloc(bstrMessageId).Value : bstrMessageId

        result := ComCall(24, this, "ptr", bstrMessageId, "ptr*", pFaxOutgoingMessage, "HRESULT")
        return result
    }
}
