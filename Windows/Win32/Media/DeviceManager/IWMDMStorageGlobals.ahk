#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMStorageGlobals interface provides methods for retrieving global information about a storage medium (such as a flash ROM card) on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmstorageglobals
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMStorageGlobals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMStorageGlobals
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a07-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "GetSerialNumber", "GetTotalSize", "GetTotalFree", "GetTotalBad", "GetStatus", "Initialize"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-getcapabilities
     */
    GetCapabilities(pdwCapabilities) {
        result := ComCall(3, this, "uint*", pdwCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WMDMID>} pSerialNum 
     * @param {Pointer<Integer>} abMac 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-getserialnumber
     */
    GetSerialNumber(pSerialNum, abMac) {
        result := ComCall(4, this, "ptr", pSerialNum, "char*", abMac, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwTotalSizeLow 
     * @param {Pointer<Integer>} pdwTotalSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalsize
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        result := ComCall(5, this, "uint*", pdwTotalSizeLow, "uint*", pdwTotalSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFreeLow 
     * @param {Pointer<Integer>} pdwFreeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalfree
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        result := ComCall(6, this, "uint*", pdwFreeLow, "uint*", pdwFreeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBadLow 
     * @param {Pointer<Integer>} pdwBadHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-gettotalbad
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        result := ComCall(7, this, "uint*", pdwBadLow, "uint*", pdwBadHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmstorageglobals-getstatus
     */
    GetStatus(pdwStatus) {
        result := ComCall(8, this, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} fuMode 
     * @param {IWMDMProgress} pProgress 
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
    Initialize(fuMode, pProgress) {
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "HRESULT")
        return result
    }
}
