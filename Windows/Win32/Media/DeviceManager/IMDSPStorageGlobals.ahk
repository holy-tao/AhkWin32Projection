#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPStorageGlobals interface, acquired from the IMDSPStorage interface, provides methods for retrieving global information about a storage medium. This might include the amount of free space, serial number of the medium, and so on.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspstorageglobals
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPStorageGlobals extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(pdwCapabilities) {
        result := ComCall(3, this, "uint*", pdwCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WMDMID>} pSerialNum 
     * @param {Pointer<Byte>} abMac 
     * @returns {HRESULT} 
     */
    GetSerialNumber(pSerialNum, abMac) {
        result := ComCall(4, this, "ptr", pSerialNum, "char*", abMac, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwTotalSizeLow 
     * @param {Pointer<UInt32>} pdwTotalSizeHigh 
     * @returns {HRESULT} 
     */
    GetTotalSize(pdwTotalSizeLow, pdwTotalSizeHigh) {
        result := ComCall(5, this, "uint*", pdwTotalSizeLow, "uint*", pdwTotalSizeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFreeLow 
     * @param {Pointer<UInt32>} pdwFreeHigh 
     * @returns {HRESULT} 
     */
    GetTotalFree(pdwFreeLow, pdwFreeHigh) {
        result := ComCall(6, this, "uint*", pdwFreeLow, "uint*", pdwFreeHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBadLow 
     * @param {Pointer<UInt32>} pdwBadHigh 
     * @returns {HRESULT} 
     */
    GetTotalBad(pdwBadLow, pdwBadHigh) {
        result := ComCall(7, this, "uint*", pdwBadLow, "uint*", pdwBadHigh, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(8, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} fuMode 
     * @param {Pointer<IWMDMProgress>} pProgress 
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
        result := ComCall(9, this, "uint", fuMode, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPDevice>} ppDevice 
     * @returns {HRESULT} 
     */
    GetDevice(ppDevice) {
        result := ComCall(10, this, "ptr", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMDSPStorage>} ppRoot 
     * @returns {HRESULT} 
     */
    GetRootStorage(ppRoot) {
        result := ComCall(11, this, "ptr", ppRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
