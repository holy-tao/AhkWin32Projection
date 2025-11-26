#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConnector.ahk
#Include .\ISubunit.ahk
#Include .\IPart.ahk
#Include .\IPartsList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDeviceTopology interface provides access to the topology of an audio device.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-idevicetopology
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IDeviceTopology extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceTopology
     * @type {Guid}
     */
    static IID => Guid("{2a07407e-6497-4a18-9787-32f79bd0d98f}")

    /**
     * The class identifier for DeviceTopology
     * @type {Guid}
     */
    static CLSID => Guid("{1df639d0-5ec1-47aa-9379-828dc1aa8c59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectorCount", "GetConnector", "GetSubunitCount", "GetSubunit", "GetPartById", "GetDeviceId", "GetSignalPath"]

    /**
     * The GetConnectorCount method gets the number of connectors in the device-topology object.
     * @returns {Integer} Pointer to a <b>UINT</b> pointer variable into which the method writes the connector count (the number of connectors in the device topology).
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getconnectorcount
     */
    GetConnectorCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetConnector method gets the connector that is specified by a connector number.
     * @param {Integer} nIndex The connector number. If a device topology contains n connectors, the connectors are numbered 0 to n – 1. To get the number of connectors in the device topology, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getconnectorcount">IDeviceTopology::GetConnectorCount</a> method.
     * @returns {IConnector} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iconnector">IConnector</a> interface of the connector object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetConnector</b> call fails,  <i>*ppConnector</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getconnector
     */
    GetConnector(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IConnector(ppConnector)
    }

    /**
     * The GetSubunitCount method gets the number of subunits in the device topology.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the subunit count (the number of subunits in the device topology).
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getsubunitcount
     */
    GetSubunitCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetSubunit method gets the subunit that is specified by a subunit number.
     * @param {Integer} nIndex The subunit number. If a device topology contains <i>n</i> subunits, the subunits are numbered from 0 to <i>n</i>– 1. To get the number of subunits in the device topology, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getsubunitcount">IDeviceTopology::GetSubunitCount</a> method.
     * @returns {ISubunit} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-isubunit">ISubunit</a> interface of the subunit object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetSubunit</b> call fails,  <i>*ppSubunit</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getsubunit
     */
    GetSubunit(nIndex) {
        result := ComCall(6, this, "uint", nIndex, "ptr*", &ppSubunit := 0, "HRESULT")
        return ISubunit(ppSubunit)
    }

    /**
     * The GetPartById method gets a part that is identified by its local ID.
     * @param {Integer} nId The part to get. This parameter is the local ID of the part. For more information, see Remarks.
     * @returns {IPart} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part object that is identified by <i>nId</i>. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetPartById</b> call fails,  <i>*ppPart</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getpartbyid
     */
    GetPartById(nId) {
        result := ComCall(7, this, "uint", nId, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }

    /**
     * The GetDeviceId method gets the device identifier of the device that is represented by the device-topology object.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the device identifier. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetDeviceId</b> call fails,  <i>*ppwstrDeviceId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getdeviceid
     */
    GetDeviceId() {
        result := ComCall(8, this, "ptr*", &ppwstrDeviceId := 0, "HRESULT")
        return ppwstrDeviceId
    }

    /**
     * The GetSignalPath method gets a list of parts in the signal path that links two parts, if the path exists.
     * @param {IPart} pIPartFrom Pointer to the "from" part. This parameter is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part at the beginning of the signal path.
     * @param {IPart} pIPartTo Pointer to the "to" part. This parameter is a pointer to the <b>IPart</b> interface of the part at the end of the signal path.
     * @param {BOOL} bRejectMixedPaths Specifies whether to reject paths that contain mixed data. If <i>bRejectMixedPaths</i> is <b>TRUE</b> (nonzero), the method ignores any data path that contains a mixer (that is, a processing node that sums together two or more input signals). If <b>FALSE</b>, the method will try to find a path that connects the "from" and "to" parts regardless of whether the path contains a mixer.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface instance. This interface encapsulates the list of parts in the signal path that connects the "from" part to the "to" part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetSignalPath</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-idevicetopology-getsignalpath
     */
    GetSignalPath(pIPartFrom, pIPartTo, bRejectMixedPaths) {
        result := ComCall(9, this, "ptr", pIPartFrom, "ptr", pIPartTo, "int", bRejectMixedPaths, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }
}
