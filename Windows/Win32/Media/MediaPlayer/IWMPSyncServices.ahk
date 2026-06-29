#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPSyncDevice.ahk" { IWMPSyncDevice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPSyncServices interface provides methods to enumerate available devices that can synchronize digital media files with Windows Media Player 10 or later.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpsyncservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPSyncServices extends IUnknown {
    /**
     * The interface identifier for IWMPSyncServices
     * @type {Guid}
     */
    static IID := Guid("{8b5050ff-e0a4-4808-b3a8-893a9e1ed894}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPSyncServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_deviceCount : IntPtr
        getDevice       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPSyncServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    deviceCount {
        get => this.get_deviceCount()
    }

    /**
     * The get_deviceCount method retrieves the number of available devices.
     * @remarks
     * This method may return devices that have been connected previously, but that do not have a partnership established. Therefore, the list of returned devices does not represent a list of devices with partnerships.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that contains the device count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncservices-get_devicecount
     */
    get_deviceCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getDevice method retrieves a pointer to a device interface.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lIndex <b>long</b> that contains the index of the device to retrieve. Device indexes are zero-based.
     * @returns {IWMPSyncDevice} Pointer to a pointer to an <b>IWMPSyncDevice</b> interface that represents the device having the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncservices-getdevice
     */
    getDevice(lIndex) {
        result := ComCall(4, this, "int", lIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IWMPSyncDevice(ppDevice)
    }

    Query(iid) {
        if (IWMPSyncServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_deviceCount := CallbackCreate(GetMethod(implObj, "get_deviceCount"), flags, 2)
        this.vtbl.getDevice := CallbackCreate(GetMethod(implObj, "getDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_deviceCount)
        CallbackFree(this.vtbl.getDevice)
    }
}
