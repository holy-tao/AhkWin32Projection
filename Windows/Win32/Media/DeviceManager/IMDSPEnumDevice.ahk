#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPEnumDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPEnumDevice interface is used to enumerate the media devices.
 * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nn-mswmdm-imdspenumdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPEnumDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPEnumDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a11-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method retrieves a pointer to the next celtIMDSPDevice interfaces.
     * @remarks
     * When there are no more service provider interfaces for enumerated devices, or when there are fewer of these interfaces than requested by the <i>celt</i> parameter, the return value from <b>Next</b> is S_FALSE. When this happens, the <i>pceltFetched</i> parameter must be queried to determine how many interfaces, if any, were returned.
     * 
     * The device enumerator may not reflect the effect of device insertion and removal.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} celt Number of devices requested.
     * @param {Pointer<IMDSPDevice>} ppDevice Array of <i>celt</i> pointers <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspdevice">IMDSPDevice</a> allocated by the caller. Return <b>NULL</b> to indicate that no more devices exist or an error has occurred. If <i>celt</i> is more than 1, the caller must allocate enough memory to store <i>celt</i> number of interface pointers.
     * @param {Pointer<Integer>} pceltFetched Pointer to a <b>ULONG</b> variable that receives the number of interfaces retrieved.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspenumdevice-next
     */
    Next(celt, ppDevice, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", ppDevice, pceltFetchedMarshal, pceltFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Skip method skips over the next specified number of media device interface(s) in the enumeration sequence.
     * @remarks
     * If the number specified in the <i>celt</i> parameter is greater than the actual number of interfaces remaining in the enumeration sequence, then the return value from <b>Skip</b> is S_FALSE. When this happens, the <i>pceltFetched</i> parameter must be queried to determine how many interfaces were skipped. If you skip to the end of the array of enumerated media device interfaces, a subsequent call to <b>Next</b> returns S_FALSE.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @param {Integer} celt Number of elements to skip.
     * @returns {Integer} Pointer to the number of elements that actually were skipped.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspenumdevice-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pceltFetched
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning. A subsequent call to Next fetches the first Windows Media Device Manager interface in the enumeration sequence.
     * @remarks
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspenumdevice-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IMDSPEnumDevice.Clone)
     * @remarks
     * Using this function, a client can record a particular point in the enumeration sequence, and then return to that point later. The new enumerator supports the same interface as the original one.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPEnumDevice} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumdevice">IMDSPEnumDevice</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mswmdm/nf-mswmdm-imdspenumdevice-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMDSPEnumDevice(ppEnumDevice)
    }
}
