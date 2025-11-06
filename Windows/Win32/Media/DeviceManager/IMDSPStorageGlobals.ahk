#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include .\IMDSPDevice.ahk
#Include .\IMDSPStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorageGlobals interface, acquired from the IMDSPStorage interface, provides methods for retrieving global information about a storage medium. This might include the amount of free space, serial number of the medium, and so on.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorageglobals
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorageGlobals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPStorageGlobals
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a17-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "GetSerialNumber", "GetTotalSize", "GetTotalFree", "GetTotalBad", "GetStatus", "Initialize", "GetDevice", "GetRootStorage"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "HRESULT")
        return pdwCapabilities
    }

    /**
     * 
     * @param {Pointer<Integer>} abMac 
     * @returns {WMDMID} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNum := WMDMID()
        result := ComCall(4, this, "ptr", pSerialNum, abMacMarshal, abMac, "HRESULT")
        return pSerialNum
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwTotalSizeLow 
     * @param {Pointer<Integer>} pdwTotalSizeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalsize
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        pdwTotalSizeLowMarshal := pdwTotalSizeLow is VarRef ? "uint*" : "ptr"
        pdwTotalSizeHighMarshal := pdwTotalSizeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwTotalSizeLowMarshal, pdwTotalSizeLow, pdwTotalSizeHighMarshal, pdwTotalSizeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFreeLow 
     * @param {Pointer<Integer>} pdwFreeHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalfree
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        pdwFreeLowMarshal := pdwFreeLow is VarRef ? "uint*" : "ptr"
        pdwFreeHighMarshal := pdwFreeHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwFreeLowMarshal, pdwFreeLow, pdwFreeHighMarshal, pdwFreeHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBadLow 
     * @param {Pointer<Integer>} pdwBadHigh 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-gettotalbad
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        pdwBadLowMarshal := pdwBadLow is VarRef ? "uint*" : "ptr"
        pdwBadHighMarshal := pdwBadHigh is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwBadLowMarshal, pdwBadLow, pdwBadHighMarshal, pdwBadHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
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

    /**
     * 
     * @returns {IMDSPDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-getdevice
     */
    GetDevice() {
        result := ComCall(10, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IMDSPDevice(ppDevice)
    }

    /**
     * 
     * @returns {IMDSPStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspstorageglobals-getrootstorage
     */
    GetRootStorage() {
        result := ComCall(11, this, "ptr*", &ppRoot := 0, "HRESULT")
        return IMDSPStorage(ppRoot)
    }
}
