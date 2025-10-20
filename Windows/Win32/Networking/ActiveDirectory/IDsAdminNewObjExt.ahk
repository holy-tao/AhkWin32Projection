#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObjExt interface is implemented by an object creation wizard extension.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadminnewobjext
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNewObjExt extends IUnknown{
    /**
     * The interface identifier for IDsAdminNewObjExt
     * @type {Guid}
     */
    static IID => Guid("{6088eae2-e7bf-11d2-82af-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IADsContainer>} pADsContainerObj 
     * @param {Pointer<IADs>} pADsCopySource 
     * @param {PWSTR} lpszClassName 
     * @param {Pointer<IDsAdminNewObj>} pDsAdminNewObj 
     * @param {Pointer<DSA_NEWOBJ_DISPINFO>} pDispInfo 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName, pDsAdminNewObj, pDispInfo) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "ptr", pDsAdminNewObj, "ptr", pDispInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} lpfnAddPage 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    AddPages(lpfnAddPage, lParam) {
        result := ComCall(4, this, "ptr", lpfnAddPage, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IADs>} pADsObj 
     * @returns {HRESULT} 
     */
    SetObject(pADsObj) {
        result := ComCall(5, this, "ptr", pADsObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} uContext 
     * @returns {HRESULT} 
     */
    WriteData(hWnd, uContext) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(6, this, "ptr", hWnd, "uint", uContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {HRESULT} hr 
     * @param {Integer} uContext 
     * @returns {HRESULT} 
     */
    OnError(hWnd, hr, uContext) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(7, this, "ptr", hWnd, "int", hr, "uint", uContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrText 
     * @returns {HRESULT} 
     */
    GetSummaryInfo(pBstrText) {
        result := ComCall(8, this, "ptr", pBstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
