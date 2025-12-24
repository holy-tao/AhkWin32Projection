#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IControlInterface.ahk
#Include .\IPartsList.ahk
#Include .\IDeviceTopology.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPart interface represents a part (connector or subunit) of a device topology.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-ipart
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPart extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPart
     * @type {Guid}
     */
    static IID => Guid("{ae2de0e4-5bca-4f2d-aa46-5d13f8fdb3a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetLocalId", "GetGlobalId", "GetPartType", "GetSubType", "GetControlInterfaceCount", "GetControlInterface", "EnumPartsIncoming", "EnumPartsOutgoing", "GetTopologyObject", "Activate", "RegisterControlChangeCallback", "UnregisterControlChangeCallback"]

    /**
     * The GetName method gets the friendly name of this part.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the friendly name of this part. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetName</b> call fails,  <i>*ppwstrName</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppwstrName := 0, "HRESULT")
        return ppwstrName
    }

    /**
     * The GetLocalId method gets the local ID of this part.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the local ID of this part.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getlocalid
     */
    GetLocalId() {
        result := ComCall(4, this, "uint*", &pnId := 0, "HRESULT")
        return pnId
    }

    /**
     * The GetGlobalId method gets the global ID of this part.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the global ID. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetGlobalId</b> call fails,  <i>*ppwstrGlobalId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getglobalid
     */
    GetGlobalId() {
        result := ComCall(5, this, "ptr*", &ppwstrGlobalId := 0, "HRESULT")
        return ppwstrGlobalId
    }

    /**
     * The GetPartType method gets the part type of this part.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-parttype">PartType</a> variable into which the method writes the part type. The part type is one of the following <b>PartType</b> enumeration values, which indicate whether the part is a connector or subunit:
     * 
     * Connector
     * 
     * Subunit
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getparttype
     */
    GetPartType() {
        result := ComCall(6, this, "int*", &pPartType := 0, "HRESULT")
        return pPartType
    }

    /**
     * The GetSubType method gets the part subtype of this part.
     * @returns {Guid} Pointer to a GUID variable into which the method writes the subtype GUID for this part.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getsubtype
     */
    GetSubType() {
        pSubType := Guid()
        result := ComCall(7, this, "ptr", pSubType, "HRESULT")
        return pSubType
    }

    /**
     * The GetControlInterfaceCount method gets the number of control interfaces that this part supports.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of control interfaces on this part.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getcontrolinterfacecount
     */
    GetControlInterfaceCount() {
        result := ComCall(8, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetControlInterface method gets a reference to the specified control interface, if this part supports it.
     * @param {Integer} nIndex The control interface number. If a part supports <i>n</i> control interfaces, the control interfaces are numbered from 0 to <i>n</i>– 1.
     * @returns {IControlInterface} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolinterface">IControlInterface</a> interface of the specified audio function. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetControlInterface</b> call fails,  <i>*ppFunction</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-getcontrolinterface
     */
    GetControlInterface(nIndex) {
        result := ComCall(9, this, "uint", nIndex, "ptr*", &ppInterfaceDesc := 0, "HRESULT")
        return IControlInterface(ppInterfaceDesc)
    }

    /**
     * The EnumPartsIncoming method gets a list of all the incoming parts�that is, the parts that reside on data paths that are upstream from this part.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface that encapsulates the list of parts that are immediately upstream from this part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>EnumPartsIncoming</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-enumpartsincoming
     */
    EnumPartsIncoming() {
        result := ComCall(10, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * The EnumPartsOutgoing method retrieves a list of all the outgoing parts�that is, the parts that reside on data paths that are downstream from this part.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface that encapsulates the list of parts that are immediately downstream from this part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>EnumPartsOutgoing</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-enumpartsoutgoing
     */
    EnumPartsOutgoing() {
        result := ComCall(11, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * The GetTopologyObject method gets a reference to the IDeviceTopology interface of the device-topology object that contains this part.
     * @returns {IDeviceTopology} Pointer to a pointer variable into which the method writes the address of the <b>IDeviceTopology</b> interface of the device-topology object. The caller obtains a counted reference to the interface from this method. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetTopologyObject</b> call fails,  <i>*ppTopology</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-gettopologyobject
     */
    GetTopologyObject() {
        result := ComCall(12, this, "ptr*", &ppTopology := 0, "HRESULT")
        return IDeviceTopology(ppTopology)
    }

    /**
     * The Activate method activates a function-specific interface on a connector or subunit.
     * @param {Integer} dwClsContext The execution context in which the code that manages the newly created object will run. The caller can restrict the context by setting this parameter to the bitwise <b>OR</b> of one or more <b>CLSCTX</b> enumeration values. The client can avoid imposing any context restrictions by specifying CLSCTX_ALL. For more information about <b>CLSCTX</b>, see the Windows SDK documentation.
     * @param {Pointer<Guid>} refiid The interface ID for the requested control function. The client should set this parameter to one of the following <b>REFIID</b> values:
     * 
     * IID_IAudioAutoGainControl
     * 
     * IID_IAudioBass
     * 
     * IID_IAudioChannelConfig
     * 
     * IID_IAudioInputSelector
     * 
     * IID_IAudioLoudness
     * 
     * IID_IAudioMidrange
     * 
     * IID_IAudioMute
     * 
     * IID_IAudioOutputSelector
     * 
     * IID_IAudioPeakMeter
     * 
     * IID_IAudioTreble
     * 
     * IID_IAudioVolumeLevel
     * 
     * IID_IDeviceSpecificProperty
     * 
     * IID_IKsFormatSupport
     * 
     * IID_IKsJackDescription
     * 
     * For more information, see Remarks.
     * @returns {Pointer<Void>} Pointer to a pointer variable into which the method writes the address of the interface that is specified by parameter <i>refiid</i>. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Activate</b> call fails,  <i>*ppObject</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-activate
     */
    Activate(dwClsContext, refiid) {
        result := ComCall(13, this, "uint", dwClsContext, "ptr", refiid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * The RegisterControlChangeCallback method registers the IControlChangeNotify interface, which the client implements to receive notifications of status changes in this part.
     * @param {Pointer<Guid>} riid The function-specific control interface that is to be monitored for control changes. For more information, see Remarks.
     * @param {IControlChangeNotify} pNotify Pointer to the client's <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interface. If the method succeeds, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the client's <b>IControlChangeNotify</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>riid</i> is not a valid control-interface identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-registercontrolchangecallback
     */
    RegisterControlChangeCallback(riid, pNotify) {
        result := ComCall(14, this, "ptr", riid, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The UnregisterControlChangeCallback method removes the registration of an IControlChangeNotify interface that the client previously registered by a call to the IPart::RegisterControlChangeCallback method.
     * @param {IControlChangeNotify} pNotify Pointer to the <b>IControlChangeNotify</b> interface whose registration is to be deleted. The client passed this same interface pointer to the part object in a previous call to the <b>IPart::RegisterControlChangeCallback</b> method. If the <b>UnregisterControlChangeCallback</b> method succeeds, it calls the <b>Release</b> method on the client's <b>IControlChangeNotify</b> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interface instance  <i>*pNotify</i> is not currently registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipart-unregistercontrolchangecallback
     */
    UnregisterControlChangeCallback(pNotify) {
        result := ComCall(15, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
