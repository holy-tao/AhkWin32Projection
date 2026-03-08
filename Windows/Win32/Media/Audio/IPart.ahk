#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IControlInterface.ahk
#Include .\IPartsList.ahk
#Include .\IDeviceTopology.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPart interface represents a part (connector or subunit) of a device topology.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-ipart
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppwstrName := 0, "HRESULT")
        return ppwstrName
    }

    /**
     * The GetLocalId method gets the local ID of this part.
     * @remarks
     * When you have a pointer to a part object, you can call this method to get the local ID of the part. A local ID is a number that uniquely identifies a part among all parts in a device topology.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudioinputselector-getselection">IAudioInputSelector::GetSelection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiooutputselector-getselection">IAudioOutputSelector::GetSelection</a> methods retrieve the local ID of a connected part. The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudioinputselector-setselection">IAudioInputSelector::SetSelection</a> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iaudiooutputselector-setselection">IAudioOutputSelector::SetSelection</a> methods select the input or output that is connected to a part that is identified by its local ID. The <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-idevicetopology-getpartbyid">IDeviceTopology::GetPartById</a> method gets a part that is identified by its local ID.
     * 
     * For code examples that use the <b>GetLocalId</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>
     * </li>
     * </ul>
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the local ID of this part.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getlocalid
     */
    GetLocalId() {
        result := ComCall(4, this, "uint*", &pnId := 0, "HRESULT")
        return pnId
    }

    /**
     * The GetGlobalId method gets the global ID of this part.
     * @remarks
     * A global ID is a string that uniquely identifies a part among all parts in all device topologies in the system. Clients should treat this string as opaque. That is, clients should <i>not</i> attempt to parse the contents of the string to obtain information about the part. The reason is that the string format is undefined and might change from one implementation of the DeviceTopology API to the next.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the global ID. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetGlobalId</b> call fails,  <i>*ppwstrGlobalId</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getglobalid
     */
    GetGlobalId() {
        result := ComCall(5, this, "ptr*", &ppwstrGlobalId := 0, "HRESULT")
        return ppwstrGlobalId
    }

    /**
     * The GetPartType method gets the part type of this part.
     * @remarks
     * For a code example that uses this method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ne-devicetopology-parttype">PartType</a> variable into which the method writes the part type. The part type is one of the following <b>PartType</b> enumeration values, which indicate whether the part is a connector or subunit:
     * 
     * Connector
     * 
     * Subunit
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getparttype
     */
    GetPartType() {
        result := ComCall(6, this, "int*", &pPartType := 0, "HRESULT")
        return pPartType
    }

    /**
     * The GetSubType method gets the part subtype of this part.
     * @remarks
     * This method typically retrieves one of the KSNODETYPE_<i>Xxx</i> GUID values from header file Ksmedia.h, although some custom drivers might provide other GUID values. For more information about KSNODETYPE_<i>Xxx</i> GUIDs, see the Windows DDK documentation.
     * 
     * As explained in <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart Interface</a>, a part can be either a connector or a subunit.
     * 
     * For a part that is a connector, this method retrieves the pin-category GUID that the driver has assigned to the connector. The following are examples of pin-category GUIDs:
     * 
     * <ul>
     * <li>KSNODETYPE_ANALOG_CONNECTOR, if the connector is part of the data path to or from an analog device such as a microphone or speakers.</li>
     * <li>KSNODETYPE_SPDIF_INTERFACE, if the connector is part of the data path to or from an S/PDIF port.</li>
     * </ul>
     * For more information, see the discussion of the pin-category property, KSPROPERTY_PIN_CATEGORY, in the Windows DDK documentation.
     * 
     * For a part that is a subunit, this method retrieves a subtype GUID that indicates the stream-processing function that the subunit performs. For example, for a volume-control subunit, the method retrieves GUID value KSNODETYPE_VOLUME.
     * 
     * The following table lists some of the subtype GUIDs that can be retrieved by the <b>GetSubType</b> method for a subunit.
     * 
     * <table>
     * <tr>
     * <th>Subtype GUID
     *             </th>
     * <th>Control interface
     *             </th>
     * <th>Required or optional
     *             </th>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_3D_EFFECTS</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * </td>
     * <td>Optional</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_AGC</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioautogaincontrol">IAudioAutoGainControl</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_DAC</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * </td>
     * <td>Optional</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_DEMUX</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiooutputselector">IAudioOutputSelector</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_DEV_SPECIFIC</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicespecificproperty">IDeviceSpecificProperty</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_LOUDNESS</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioloudness">IAudioLoudness</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_MUTE</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomute">IAudioMute</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_MUX</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioinputselector">IAudioInputSelector</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_PEAKMETER</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiopeakmeter">IAudioPeakMeter</a>
     * </td>
     * <td>Required</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_PROLOGIC_DECODER</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * </td>
     * <td>Optional</td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_TONE</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiobass">IAudioBass</a>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomidrange">IAudioMidrange</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiotreble">IAudioTreble</a>
     * 
     * 
     * </td>
     * <td>OptionalOptional
     * 
     * Optional
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>KSNODETYPE_VOLUME</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiovolumelevel">IAudioVolumeLevel</a>
     * 
     * 
     * </td>
     * <td>OptionalRequired
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * In the preceding table, the middle column lists the control interfaces that are supported by subunits of the subtype specified in the left column. The right column indicates whether the subunit's support for a control interface is required or optional. If support is required, an application can rely on a subunit of the specified subtype to support the control interface. If support is optional, a subunit of the specified subtype can, but does not necessarily, support the control interface.
     * 
     * The control interfaces in the preceding table provide convenient access to the properties of subunits. However, some subunits have properties for which no corresponding control interfaces exist. Applications can access these properties through the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksproxy/nn-ksproxy-ikscontrol">IKsControl</a> interface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>.
     * @returns {Guid} Pointer to a GUID variable into which the method writes the subtype GUID for this part.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getsubtype
     */
    GetSubType() {
        pSubType := Guid()
        result := ComCall(7, this, "ptr", pSubType, "HRESULT")
        return pSubType
    }

    /**
     * The GetControlInterfaceCount method gets the number of control interfaces that this part supports.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of control interfaces on this part.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterfacecount
     */
    GetControlInterfaceCount() {
        result := ComCall(8, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetControlInterface method gets a reference to the specified control interface, if this part supports it.
     * @param {Integer} nIndex The control interface number. If a part supports <i>n</i> control interfaces, the control interfaces are numbered from 0 to <i>n</i>– 1.
     * @returns {IControlInterface} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolinterface">IControlInterface</a> interface of the specified audio function. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetControlInterface</b> call fails,  <i>*ppFunction</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-getcontrolinterface
     */
    GetControlInterface(nIndex) {
        result := ComCall(9, this, "uint", nIndex, "ptr*", &ppInterfaceDesc := 0, "HRESULT")
        return IControlInterface(ppInterfaceDesc)
    }

    /**
     * The EnumPartsIncoming method gets a list of all the incoming parts�that is, the parts that reside on data paths that are upstream from this part.
     * @remarks
     * A client application can traverse a device topology against the direction of audio data flow by iteratively calling this method at each step in the traversal to get the list of parts that lie immediately upstream from the current part.
     * 
     * If this part has no links to upstream parts, the method returns error code E_NOTFOUND and does not create a parts list (<i>*ppParts</i> is <b>NULL</b>). For example, the method returns this error code if the <b>IPart</b> interface represents a connector through which data enters a device topology.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface that encapsulates the list of parts that are immediately upstream from this part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>EnumPartsIncoming</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsincoming
     */
    EnumPartsIncoming() {
        result := ComCall(10, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * The EnumPartsOutgoing method retrieves a list of all the outgoing parts�that is, the parts that reside on data paths that are downstream from this part.
     * @remarks
     * A client application can traverse a device topology in the direction of audio data flow by iteratively calling this method at each step in the traversal to get the list of parts that lie immediately downstream from the current part.
     * 
     * If this part has no links to downstream parts, the method returns error code E_NOTFOUND and does not create a parts list (<i>*ppParts</i> is <b>NULL</b>). For example, the method returns this error code if the <b>IPart</b> interface represents a connector through which data exits a device topology.
     * 
     * For a code example that uses the <b>EnumPartsOutgoing</b> method, see the implementation of the SelectCaptureDevice function in <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>.
     * @returns {IPartsList} Pointer to a pointer variable into which the method writes the address of an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipartslist">IPartsList</a> interface that encapsulates the list of parts that are immediately downstream from this part. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>EnumPartsOutgoing</b> call fails,  <i>*ppParts</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-enumpartsoutgoing
     */
    EnumPartsOutgoing() {
        result := ComCall(11, this, "ptr*", &ppParts := 0, "HRESULT")
        return IPartsList(ppParts)
    }

    /**
     * The GetTopologyObject method gets a reference to the IDeviceTopology interface of the device-topology object that contains this part.
     * @remarks
     * For code examples that use this method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>
     * </li>
     * </ul>
     * @returns {IDeviceTopology} Pointer to a pointer variable into which the method writes the address of the <b>IDeviceTopology</b> interface of the device-topology object. The caller obtains a counted reference to the interface from this method. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetTopologyObject</b> call fails,  <i>*ppTopology</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-gettopologyobject
     */
    GetTopologyObject() {
        result := ComCall(12, this, "ptr*", &ppTopology := 0, "HRESULT")
        return IDeviceTopology(ppTopology)
    }

    /**
     * The Activate method activates a function-specific interface on a connector or subunit.
     * @remarks
     * The <b>Activate</b> method supports the following function-specific control interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioautogaincontrol">IAudioAutoGainControl</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiobass">IAudioBass</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioinputselector">IAudioInputSelector</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioloudness">IAudioLoudness</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomidrange">IAudioMidrange</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomute">IAudioMute</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiooutputselector">IAudioOutputSelector</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiopeakmeter">IAudioPeakMeter</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiotreble">IAudioTreble</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiovolumelevel">IAudioVolumeLevel</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicespecificproperty">IDeviceSpecificProperty</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iksformatsupport">IKsFormatSupport</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iksjackdescription">IKsJackDescription</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iksjackdescription2">IKsJackDescription2</a>
     * </li>
     * </ul>
     * To obtain the interface ID of the function-specific control interface of a part, call the part's <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolinterface-getiid">IControlInterface::GetIID</a> method. To obtain the interface ID of a function-specific control interface type, use the <b>__uuidof</b> operator. For example, the interface ID of <b>IAudioAutoGainControl</b> is defined as follows:
     * 
     * 
     * ``` syntax
     * 
     * const IID IID_IAudioAutoGainControl  __uuidof(IAudioAutoGainControl)
     * 
     * ```
     * 
     * For more information about the <b>__uuidof</b> operator, see the Windows SDK documentation.
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
     * IID_IKsJackDescription2
     * 
     * For more information, see Remarks.
     * @returns {Pointer<Void>} Pointer to a pointer variable into which the method writes the address of the interface that is specified by parameter <i>refiid</i>. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Activate</b> call fails,  <i>*ppObject</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-activate
     */
    Activate(dwClsContext, refiid) {
        result := ComCall(13, this, "uint", dwClsContext, "ptr", refiid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * The RegisterControlChangeCallback method registers the IControlChangeNotify interface, which the client implements to receive notifications of status changes in this part.
     * @remarks
     * Set parameter <i>riid</i> to one of the following GUID values:
     * 
     * <ul>
     * <li>IID_IAudioAutoGainControl</li>
     * <li>IID_IAudioBass</li>
     * <li>IID_IAudioChannelConfig</li>
     * <li>IID_IAudioInputSelector</li>
     * <li>IID_IAudioLoudness</li>
     * <li>IID_IAudioMidrange</li>
     * <li>IID_IAudioMute</li>
     * <li>IID_IAudioOutputSelector</li>
     * <li>IID_IAudioPeakMeter</li>
     * <li>IID_IAudioTreble</li>
     * <li>IID_IAudioVolumeLevel</li>
     * <li>IID_IDeviceSpecificProperty</li>
     * <li>IID_IKsFormatSupport</li>
     * <li>IID_IKsJackDescription</li>
     * </ul>
     * To obtain the interface ID of the function-specific control interface for a part, call the part's <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-icontrolinterface-getiid">IControlInterface::GetIID</a> method. To obtain the interface ID of a function-specific control interface type, use the <b>__uuidof</b> operator. For example, the interface ID of <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioautogaincontrol">IAudioAutoGainControl</a> is defined as follows:
     * 
     * 
     * ``` syntax
     * 
     * const IID IID_IAudioAutoGainControl  __uuidof(IAudioAutoGainControl)
     * 
     * ```
     * 
     * For more information about the <b>__uuidof</b> operator, see the Windows SDK documentation.
     * 
     * Before the client releases its final reference to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolchangenotify">IControlChangeNotify</a> interface, it should call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-unregistercontrolchangecallback">IPart::UnregisterControlChangeCallback</a> method to unregister the interface. Otherwise, the application leaks the resources held by the <b>IControlChangeNotify</b> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> objects. Note that <b>RegisterControlChangeCallback</b> calls the client's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IControlChangeNotify::AddRef</a> method, and <b>UnregisterControlChangeCallback</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IControlChangeNotify::Release</a> method. If the client errs by releasing its reference to the <b>IControlChangeNotify</b> interface before calling <b>UnregisterControlChangeCallback</b>, the <b>IPart</b> object never releases its reference to the <b>IControlChangeNotify</b> interface. For example, a poorly designed <b>IControlChangeNotify</b> implementation might call <b>UnregisterControlChangeCallback</b> from the destructor for the <b>IControlChangeNotify</b> object. In this case, the client will not call <b>UnregisterControlChangeCallback</b> until the <b>IPart</b> object releases its reference to the <b>IControlChangeNotify</b> interface, and the <b>IPart</b> object will not release its reference to the <b>IControlChangeNotify</b> interface until the client calls <b>UnregisterControlChangeCallback</b>. For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface in the Windows SDK documentation.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-registercontrolchangecallback
     */
    RegisterControlChangeCallback(riid, pNotify) {
        result := ComCall(14, this, "ptr", riid, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The UnregisterControlChangeCallback method removes the registration of an IControlChangeNotify interface that the client previously registered by a call to the IPart::RegisterControlChangeCallback method.
     * @remarks
     * Before the client releases its final reference to the <b>IControlChangeNotify</b> interface, it should call <b>UnregisterControlChangeCallback</b> to unregister the interface. Otherwise, the application leaks the resources held by the <b>IControlChangeNotify</b> and <b>IPart</b> objects. Note that the <b>IPart::RegisterControlChangeCallback</b> method calls the client's <b>IControlChangeNotify::AddRef</b> method, and <b>UnregisterControlChangeCallback</b> calls the <b>IControlChangeNotify::Release</b> method. If the client errs by releasing its reference to the <b>IControlChangeNotify</b> interface before calling <b>UnregisterControlChangeCallback</b>, the <b>IPart</b> object never releases its reference to the <b>IControlChangeNotify</b> interface. For example, a poorly designed <b>IControlChangeNotify</b> implementation might call <b>UnregisterControlChangeCallback</b> from the destructor for the <b>IControlChangeNotify</b> object. In this case, the client will not call <b>UnregisterControlChangeCallback</b> until the <b>IPart</b> object releases its reference to the <b>IControlChangeNotify</b> interface, and the <b>IPart</b> object will not release its reference to the <b>IControlChangeNotify</b> interface until the client calls <b>UnregisterControlChangeCallback</b>. For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <b>IUnknown</b> interface in the Windows SDK documentation.
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
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipart-unregistercontrolchangecallback
     */
    UnregisterControlChangeCallback(pNotify) {
        result := ComCall(15, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
