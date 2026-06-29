#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPDevice.ahk" { IMDSPDevice }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMDSPEnumDevice interface is used to enumerate the media devices.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspenumdevice
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPEnumDevice extends IUnknown {
    /**
     * The interface identifier for IMDSPEnumDevice
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a11-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPEnumDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPEnumDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumdevice-next
     */
    Next(celt, ppDevice, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IMDSPDevice.Ptr, ppDevice, pceltFetchedMarshal, pceltFetched, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumdevice-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "uint*", &pceltFetched := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumdevice-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates another enumerator that contains the same enumeration state as the current one. (IMDSPEnumDevice.Clone)
     * @remarks
     * Using this function, a client can record a particular point in the enumeration sequence, and then return to that point later. The new enumerator supports the same interface as the original one.
     * 
     * This method must be implemented. It must not return WMDM_E_NOTSUPPORTED or E_NOTIMPL. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/mandatory-and-optional-interfaces">Mandatory and Optional Interfaces</a>.
     * @returns {IMDSPEnumDevice} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumdevice">IMDSPEnumDevice</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspenumdevice-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IMDSPEnumDevice(ppEnumDevice)
    }

    Query(iid) {
        if (IMDSPEnumDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
