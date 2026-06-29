#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPartsList.ahk" { IPartsList }
#Import ".\ISubunit.ahk" { ISubunit }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IConnector.ahk" { IConnector }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPart.ahk" { IPart }

/**
 * The IDeviceTopology interface provides access to the topology of an audio device.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-idevicetopology
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IDeviceTopology extends IUnknown {
    /**
     * The interface identifier for IDeviceTopology
     * @type {Guid}
     */
    static IID := Guid("{2a07407e-6497-4a18-9787-32f79bd0d98f}")

    /**
     * The class identifier for DeviceTopology
     * @type {Guid}
     */
    static CLSID := Guid("{1df639d0-5ec1-47aa-9379-828dc1aa8c59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeviceTopology interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConnectorCount : IntPtr
        GetConnector      : IntPtr
        GetSubunitCount   : IntPtr
        GetSubunit        : IntPtr
        GetPartById       : IntPtr
        GetDeviceId       : IntPtr
        GetSignalPath     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeviceTopology.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetConnectorCount method gets the number of connectors in the device-topology object.
     * @returns {Integer} Pointer to a <b>UINT</b> pointer variable into which the method writes the connector count (the number of connectors in the device topology).
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnectorcount
     */
    GetConnectorCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetConnector method gets the connector that is specified by a connector number.
     * @remarks
     * For code examples that call the <b>GetConnector</b> method, see the implementations of the GetHardwareDeviceTopology and SelectCaptureDevice functions in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @param {Integer} nIndex The connector number. If a device topology contains n connectors, the connectors are numbered 0 to n – 1. To get the number of connectors in the device topology, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getconnectorcount">IDeviceTopology::GetConnectorCount</a> method.
     * @returns {IConnector} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface of the connector object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetConnector</b> call fails,  <i>*ppConnector</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getconnector
     */
    GetConnector(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IConnector(ppConnector)
    }

    /**
     * The GetSubunitCount method gets the number of subunits in the device topology.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the subunit count (the number of subunits in the device topology).
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunitcount
     */
    GetSubunitCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetSubunit method gets the subunit that is specified by a subunit number.
     * @param {Integer} nIndex The subunit number. If a device topology contains <i>n</i> subunits, the subunits are numbered from 0 to <i>n</i>– 1. To get the number of subunits in the device topology, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getsubunitcount">IDeviceTopology::GetSubunitCount</a> method.
     * @returns {ISubunit} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-isubunit">ISubunit</a> interface of the subunit object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetSubunit</b> call fails,  <i>*ppSubunit</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsubunit
     */
    GetSubunit(nIndex) {
        result := ComCall(6, this, "uint", nIndex, "ptr*", &ppSubunit := 0, "HRESULT")
        return ISubunit(ppSubunit)
    }

    /**
     * The GetPartById method gets a part that is identified by its local ID.
     * @remarks
     * A local ID is a number that uniquely identifies a part among all the parts in a device topology. The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudioinputselector-getselection">IAudioInputSelector::GetSelection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiooutputselector-getselection">IAudioOutputSelector::GetSelection</a> methods retrieve the local ID of a connected part. The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudioinputselector-setselection">IAudioInputSelector::SetSelection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiooutputselector-setselection">IAudioOutputSelector::SetSelection</a> methods select the input or output that is connected to a part that is identified by its local ID. When you have a pointer to a part object, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-getlocalid">IPart::GetLocalId</a> method to get the local ID of the part.
     * @param {Integer} nId The part to get. This parameter is the local ID of the part. For more information, see Remarks.
     * @returns {IPart} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part object that is identified by <i>nId</i>. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetPartById</b> call fails,  <i>*ppPart</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getpartbyid
     */
    GetPartById(nId) {
        result := ComCall(7, this, "uint", nId, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }

    /**
     * The GetDeviceId method gets the device identifier of the device that is represented by the device-topology object.
     * @remarks
     * The device identifier obtained from this method can be used as an input parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdevice">IMMDeviceEnumerator::GetDevice</a> method.
     * 
     * For a code example that uses the <b>GetDeviceId</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the device identifier. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetDeviceId</b> call fails,  <i>*ppwstrDeviceId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getdeviceid
     */
    GetDeviceId() {
        result := ComCall(8, this, PWSTR.Ptr, &ppwstrDeviceId := 0, "HRESULT")
        return ppwstrDeviceId
    }

    /**
     * The GetSignalPath method gets a list of parts in the signal path that links two parts, if the path exists.
     * @remarks
     * This method creates an <b>IPartsList</b> interface instance that contains a list of the parts that lie along the specified signal path. The parts in the parts list are ordered according to their relative positions in the signal path. The "to" part is the first item in the list and the "from" part is the last item in the list.
     * 
     * If the list contains <i>n</i> parts, the "to" and "from" parts are identified by list indexes 0 and <i>n</i>– 1, respectively. To get the number of parts in a parts list, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipartslist-getcount">IPartsList::GetCount</a> method. To retrieve a part by its index, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipartslist-getpart">IPartsList::GetPart</a> method.
     * 
     * The parts in the signal path must all be part of the same device topology. The path cannot span boundaries between device topologies.
     * @param {IPart} pIPartFrom Pointer to the "from" part. This parameter is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part at the beginning of the signal path.
     * @param {IPart} pIPartTo Pointer to the "to" part. This parameter is a pointer to the <b>IPart</b> interface of the part at the end of the signal path.
     * @param {BOOL} bRejectMixedPaths Specifies whether to reject paths that contain mixed data. If <i>bRejectMixedPaths</i> is <b>TRUE</b> (nonzero), the method ignores any data path that contains a mixer (that is, a processing node that sums together two or more input signals). If <b>FALSE</b>, the method will try to find a path that connects the "from" and "to" parts regardless of whether the path contains a mixer.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface instance. This interface encapsulates the list of parts in the signal path that connects the "from" part to the "to" part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetSignalPath</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-idevicetopology-getsignalpath
     */
    GetSignalPath(pIPartFrom, pIPartTo, bRejectMixedPaths) {
        result := ComCall(9, this, "ptr", pIPartFrom, "ptr", pIPartTo, BOOL, bRejectMixedPaths, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    Query(iid) {
        if (IDeviceTopology.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConnectorCount := CallbackCreate(GetMethod(implObj, "GetConnectorCount"), flags, 2)
        this.vtbl.GetConnector := CallbackCreate(GetMethod(implObj, "GetConnector"), flags, 3)
        this.vtbl.GetSubunitCount := CallbackCreate(GetMethod(implObj, "GetSubunitCount"), flags, 2)
        this.vtbl.GetSubunit := CallbackCreate(GetMethod(implObj, "GetSubunit"), flags, 3)
        this.vtbl.GetPartById := CallbackCreate(GetMethod(implObj, "GetPartById"), flags, 3)
        this.vtbl.GetDeviceId := CallbackCreate(GetMethod(implObj, "GetDeviceId"), flags, 2)
        this.vtbl.GetSignalPath := CallbackCreate(GetMethod(implObj, "GetSignalPath"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConnectorCount)
        CallbackFree(this.vtbl.GetConnector)
        CallbackFree(this.vtbl.GetSubunitCount)
        CallbackFree(this.vtbl.GetSubunit)
        CallbackFree(this.vtbl.GetPartById)
        CallbackFree(this.vtbl.GetDeviceId)
        CallbackFree(this.vtbl.GetSignalPath)
    }
}
