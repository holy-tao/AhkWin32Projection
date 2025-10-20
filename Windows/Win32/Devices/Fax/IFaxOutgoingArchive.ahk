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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseArchive 
     * @returns {HRESULT} 
     */
    get_UseArchive(pbUseArchive) {
        result := ComCall(7, this, "ptr", pbUseArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseArchive 
     * @returns {HRESULT} 
     */
    put_UseArchive(bUseArchive) {
        result := ComCall(8, this, "short", bUseArchive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrArchiveFolder 
     * @returns {HRESULT} 
     */
    get_ArchiveFolder(pbstrArchiveFolder) {
        result := ComCall(9, this, "ptr", pbstrArchiveFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrArchiveFolder 
     * @returns {HRESULT} 
     */
    put_ArchiveFolder(bstrArchiveFolder) {
        bstrArchiveFolder := bstrArchiveFolder is String ? BSTR.Alloc(bstrArchiveFolder).Value : bstrArchiveFolder

        result := ComCall(10, this, "ptr", bstrArchiveFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSizeQuotaWarning 
     * @returns {HRESULT} 
     */
    get_SizeQuotaWarning(pbSizeQuotaWarning) {
        result := ComCall(11, this, "ptr", pbSizeQuotaWarning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSizeQuotaWarning 
     * @returns {HRESULT} 
     */
    put_SizeQuotaWarning(bSizeQuotaWarning) {
        result := ComCall(12, this, "short", bSizeQuotaWarning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHighQuotaWaterMark 
     * @returns {HRESULT} 
     */
    get_HighQuotaWaterMark(plHighQuotaWaterMark) {
        result := ComCall(13, this, "int*", plHighQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lHighQuotaWaterMark 
     * @returns {HRESULT} 
     */
    put_HighQuotaWaterMark(lHighQuotaWaterMark) {
        result := ComCall(14, this, "int", lHighQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLowQuotaWaterMark 
     * @returns {HRESULT} 
     */
    get_LowQuotaWaterMark(plLowQuotaWaterMark) {
        result := ComCall(15, this, "int*", plLowQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLowQuotaWaterMark 
     * @returns {HRESULT} 
     */
    put_LowQuotaWaterMark(lLowQuotaWaterMark) {
        result := ComCall(16, this, "int", lLowQuotaWaterMark, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAgeLimit 
     * @returns {HRESULT} 
     */
    get_AgeLimit(plAgeLimit) {
        result := ComCall(17, this, "int*", plAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAgeLimit 
     * @returns {HRESULT} 
     */
    put_AgeLimit(lAgeLimit) {
        result := ComCall(18, this, "int", lAgeLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSizeLow 
     * @returns {HRESULT} 
     */
    get_SizeLow(plSizeLow) {
        result := ComCall(19, this, "int*", plSizeLow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSizeHigh 
     * @returns {HRESULT} 
     */
    get_SizeHigh(plSizeHigh) {
        result := ComCall(20, this, "int*", plSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPrefetchSize 
     * @param {Pointer<IFaxOutgoingMessageIterator>} pFaxOutgoingMessageIterator 
     * @returns {HRESULT} 
     */
    GetMessages(lPrefetchSize, pFaxOutgoingMessageIterator) {
        result := ComCall(23, this, "int", lPrefetchSize, "ptr", pFaxOutgoingMessageIterator, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(24, this, "ptr", bstrMessageId, "ptr", pFaxOutgoingMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
