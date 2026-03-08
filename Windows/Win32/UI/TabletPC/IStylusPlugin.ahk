#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives notifications of RealTimeStylus Class events to enable you to perform custom processing based on those events.
 * @remarks
 * Both the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interfaces derive from this interface and can be added to <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> plug-in collections.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-istylusplugin
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IStylusPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStylusPlugin
     * @type {Guid}
     */
    static IID => Guid("{a81436d8-4757-4fd1-a185-133f97c6c545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RealTimeStylusEnabled", "RealTimeStylusDisabled", "StylusInRange", "StylusOutOfRange", "StylusDown", "StylusUp", "StylusButtonDown", "StylusButtonUp", "InAirPackets", "Packets", "CustomStylusDataAdded", "SystemEvent", "TabletAdded", "TabletRemoved", "Error", "UpdateMapping", "DataInterest"]

    /**
     * Notifies the implementing plug-in that the RealTimeStylus Class (RTS) object is enabled.
     * @remarks
     * This method is called when the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has been enabled, or when a plug-in is added to a collection.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} cTcidCount Number of tablet context identifiers the RTS has encountered. Valid values are 0 through 8, inclusive.
     * @param {Pointer<Integer>} pTcids The tablet context identifiers.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-realtimestylusenabled
     */
    RealTimeStylusEnabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the RealTimeStylus Class (RTS) object is disabled.
     * @remarks
     * This method is called when the RTS object has been disabled, or when a plug-in is removed from a collection.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} cTcidCount Number of tablet context identifiers the RTS has encountered. Valid values are 0 through 8, inclusive.
     * @param {Pointer<Integer>} pTcids The tablet context identifiers.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled
     */
    RealTimeStylusDisabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the stylus is entering the detection range of the digitizer.
     * @remarks
     * The stylus is in range of the digitizer. This is a good place to check if the stylus is inverted and if so, switch to eraser mode.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} tcid Tablet context identifier.
     * @param {Integer} sid Stylus identifier.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusinrange
     */
    StylusInRange(piRtsSrc, tcid, sid) {
        result := ComCall(5, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the stylus has left the detection range of the digitizer.
     * @remarks
     * The stylus is out of range of the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} tcid Tablet context identifier.
     * @param {Integer} sid Stylus identifier.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusoutofrange
     */
    StylusOutOfRange(piRtsSrc, tcid, sid) {
        result := ComCall(6, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the tablet pen has touched the digitizer surface.
     * @remarks
     * You can return an array of modified packets in the buffer, <i>ppInOutPkt</i>. Packets used by the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">IStylusPlugin::StylusUp Method</a> and <b>IStylusPlugin::StylusDown Method</b> methods can only be changed. Packets used by the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">IStylusPlugin::Packets Method</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-inairpackets">IStylusPlugin::InAirPackets Method</a> methods can be deleted.
     * 
     * If you modify packets, then <i>cPropCountPerPkt</i>, which is the number of LONGs in <i>ppInOutPkt</i>, must be divisible by the current desired packet properties (DPP) available on the current input device.
     * 
     * You can modify packets by updating the <i>cPropCountPerPkt</i> and <i>ppInOutPkts</i> parameters. Change <i>cPropCountPerPkt</i> to a valid total packet property count and change <i>ppInOutPkts</i> to pointer to a valid data buffer accounting for values for each DPP in every packet. Only one packet can be present at that location for <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusup">IStylusPlugin::StylusUp Method</a> and <b>IStylusPlugin::StylusDown Method</b>.
     * 
     * For example, if you add three packets and your DPP is currently X,Y and Pressure, then you must have nine LONG values in this buffer and set <i>cPropCountPerPkt</i> to 9.
     * 
     * The <i>cPropCountPerPkt</i> value is useful to help clarify the boundaries between packets in the flat array of integers that comes in for events such as the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newpackets">NewPackets Event</a> event. Packets can be bundled in order to be more efficient with data transfer, such that it is not required that a plug-in is called once per packet.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the stylus.
     * @param {Integer} cPropCountPerPkt Number of properties per packet. Valid values are 0 through 32, inclusive.
     * @param {Pointer<Integer>} pPacket The start of the packet data.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt A pointer to the modified stylus data packet. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the packet has been modified and RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusdown
     */
    StylusDown(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user has raised the tablet pen from the tablet digitizer surface.
     * @remarks
     * This method is used when the pen leaves the digitizer surface.
     * 
     * You can return an array of modified packets in the buffer, <i>ppInOutPkt</i>. Packets used by the <b>IStylusPlugin::StylusUp Method</b> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">IStylusPlugin::StylusDown Method</a> methods can only be modified. They cannot be deleted. Packets used by the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">IStylusPlugin::Packets Method</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-inairpackets">IStylusPlugin::InAirPackets Method</a> methods can be deleted.
     * 
     * If you modify packets, then <i>cPropCountPerPkt</i>, which is the number of LONGs in <i>ppInOutPkt</i>, must be divisible by the current desired packet properties (DPP) available on the current input device.
     * 
     * You modify packets by updating the <i>cPropCountPerPkt</i> and <i>ppInOutPkts</i> parameters. Change <i>cPropCountPerPkt</i> to a valid total packet property count and <i>ppInOutPkts</i> to a valid data buffer accounting for values for each DPP in every packet. Only one packet can be present at that location for <b>IStylusPlugin::StylusUp Method</b> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-stylusdown">IStylusPlugin::StylusDown Method</a>.
     * 
     * For example, if you add three packets and your DPP is currently X,Y and Pressure, then you must have nine LONG values in this buffer and set <i>cPropCountPerPkt</i> to 9.
     * 
     * The <i>cPropCountPerPkt</i> value is useful to help clarify the boundaries between packets in the flat array of integers that comes in for events such as the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkcollector-newpackets">NewPackets Event</a> event. Packets can be bundled in order to be more efficient with data transfer, such that it is not required that a plug-is called once per packet.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the pen.
     * @param {Integer} cPropCountPerPkt Number of properties per packet. Valid values are 0 through 32, inclusive.
     * @param {Pointer<Integer>} pPacket The start of the packet data.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt A pointer to the modified stylus data packet. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the packet has been modified and RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusup
     */
    StylusUp(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user is pressing a stylus button.
     * @remarks
     * This notification is used to when the stylus button is down and the stylus is in range of the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} sid Security identifier.
     * @param {Pointer<Guid>} pGuidStylusButton The GUID-type identifier for the stylus button data. The GUID indicates the unique identifier for this data object.
     * @param {Pointer<POINT>} pStylusPos A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that is associated with the stylus.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusbuttondown
     */
    StylusButtonDown(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(9, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user has released a stylus button.
     * @remarks
     * The stylus button is no longer down and the stylus is in range of the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} sid Security identifier.
     * @param {Pointer<Guid>} pGuidStylusButton The globally unique identifier (GUID) for the stylus button data.
     * @param {Pointer<POINT>} pStylusPos A<a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the stylus.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusbuttonup
     */
    StylusButtonUp(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(10, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * Notifies the object implementing the plug-in that the stylus is moving above the digitizer.
     * @remarks
     * This method is called when data packets are created by the stylus when it is in range but is moving above the digitizer and not touching the digitizer. You can return an array of modified packets by using the <i>ppInOutPkt</i> parameter. Create a buffer and point <i>ppInOutPkts</i> to it. Only one packet can be present at that location.
     * 
     * <div class="alert"><b>Note</b>  Packets used by the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">IStylusPlugin::Packets Method</a> and <b>IStylusPlugin::InAirPackets Method</b> methods can be deleted.</div>
     * <div> </div>
     * A stylus plug-in may be associated with a single RTS or with many. Use the <i>piRtsSrc</i> parameter in the following cases:
     * 
     * <ul>
     * <li>When the notification requires that the plug-in acquires more information about the specific digitizer from which the notification originated.</li>
     * <li>When you input additional custom notifications through the system.</li>
     * </ul>
     * Packets can be bundled for more efficient data transfer. Therefore a plug-in is not required to be called once per packet. <b>IStylusPlugin::InAirPackets Method</b> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-packets">IStylusPlugin::Packets Method</a> can send one or more packets.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> structure containing the information about the RTS that is associated with the stylus.
     * @param {Integer} cPktCount The number of properties per data packet.
     * @param {Integer} cPktBuffLength The length, in <b>bytes</b>, of the buffer pointed to by <i>pPackets</i>. The memory occupied by each packet is (<i>cPktBuffLength</i> / <i>cPktCount</i>). Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data. It is read-only.
     * @param {Pointer<Integer>} pcInOutPkts The number of <b>LONGs</b> in <i>ppInOutPkt</i>.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts A pointer to an array of modified stylus data packets. The plug-in can use this parameter to feed modified packet data to downstream packets. For a value other than <b>NULL</b>, RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-inairpackets
     */
    InAirPackets(piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"
        pcInOutPktsMarshal := pcInOutPkts is VarRef ? "uint*" : "ptr"
        ppInOutPktsMarshal := ppInOutPkts is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPktCount, "uint", cPktBuffLength, pPacketsMarshal, pPackets, pcInOutPktsMarshal, pcInOutPkts, ppInOutPktsMarshal, ppInOutPkts, "HRESULT")
        return result
    }

    /**
     * Notifies the object implementing the plug-in that the tablet pen is moving on the digitizer.
     * @remarks
     * Occurs when the pen is moving and is touching the digitizer surface. Use this notification to constrain the packet data within a specified rectangle. Packets used by the <b>IStylusPlugin::Packets Method</b> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-inairpackets">IStylusPlugin::InAirPackets Method</a> methods can be deleted.
     * 
     * You can return an array of modified packets by using the <i>ppInOutPkt</i> parameter.
     * 
     * Packets can be bundled in order to make the data transfer more efficient, such that a plug-in is not required to be called once per packet. <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-inairpackets">IStylusPlugin::InAirPackets Method</a> and <b>IStylusPlugin::Packets Method</b> can send one or more packets.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> structure which contains information about the RTS that is associated with the pen.
     * @param {Integer} cPktCount The number of properties per data packet.
     * @param {Integer} cPktBuffLength The length, in <b>bytes</b>, of the buffer pointed to by <i>pPackets</i>. The memory occupied by each packet is (<i>cPktBuffLength</i> / <i>cPktCount</i>). Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data.
     * @param {Pointer<Integer>} pcInOutPkts The number of <b>LONGs</b> in <i>ppInOutPkt</i>.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts A pointer to an array of modified stylus data packets. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the RTS will send this data to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-packets
     */
    Packets(piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts) {
        pPacketsMarshal := pPackets is VarRef ? "int*" : "ptr"
        pcInOutPktsMarshal := pcInOutPkts is VarRef ? "uint*" : "ptr"
        ppInOutPktsMarshal := ppInOutPkts is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPktCount, "uint", cPktBuffLength, pPacketsMarshal, pPackets, pcInOutPktsMarshal, pcInOutPkts, ppInOutPktsMarshal, ppInOutPkts, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that custom stylus data is available.
     * @remarks
     * This method is called when <b>IStylusPlugin::CustomStylusDataAdded Method</b> is being processed. The custom data is passed in the <i>pbData</i> member, with a GUID in the <i>pGuidId</i> member to pass type information. This class cannot be inherited.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<Guid>} pGuidId The globally unique identifier (GUID) for the custom data.
     * @param {Integer} cbData The size, in chars, of the buffer, <i>pbData</i>. Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pbData A pointer to the buffer containing the custom data sent by the RTS object.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded
     */
    CustomStylusDataAdded(piRtsSrc, pGuidId, cbData, pbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "ptr", piRtsSrc, "ptr", pGuidId, "uint", cbData, pbDataMarshal, pbData, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that a system event is available.
     * @remarks
     * When a system event is being processed the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object provides real time stylus events on a specific window handle within a specific window input rectangle.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getdesiredpacketdescription">IRealTimeStylus::GetDesiredPacketDescription Method</a> method to determine what packet properties are sent in the events.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} tcid The tablet context identifier for the event.
     * @param {Integer} sid The security identifier.
     * @param {Integer} event The system event sent by the RTS object
     * @param {SYSTEM_EVENT_DATA} eventdata The 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-system_event_data">SYSTEM_EVENT_DATA</a> structure containing information about the system event, <i>event</i>.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-systemevent
     */
    SystemEvent(piRtsSrc, tcid, sid, event, eventdata) {
        result := ComCall(14, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "ushort", event, "ptr", eventdata, "HRESULT")
        return result
    }

    /**
     * Notifies an implementing plug-in when an ITablet object is attached to the system.
     * @remarks
     * This method is called by the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object, whether the <b>RealTimeStylus Class</b> object is enabled or disabled.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {IInkTablet} piTablet The added tablet object.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-tabletadded
     */
    TabletAdded(piRtsSrc, piTablet) {
        result := ComCall(15, this, "ptr", piRtsSrc, "ptr", piTablet, "HRESULT")
        return result
    }

    /**
     * Notifies an implementing plug-in when an ITablet object is removed from the system.
     * @remarks
     * This method is called by the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object, whether the RTS object is enabled or disabled.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} iTabletIndex The tablet index.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-tabletremoved
     */
    TabletRemoved(piRtsSrc, iTabletIndex) {
        result := ComCall(16, this, "ptr", piRtsSrc, "int", iTabletIndex, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing object that this plug-in or one of the previous plug-ins in either the IStylusAsyncPlugin or IStylusSyncPlugin collection threw an exception.
     * @remarks
     * This method is called when the RTS object has caught an exception.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {IStylusPlugin} piPlugin The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin</a> object that sent the notification.
     * @param {Integer} dataInterest Identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin</a> method that generated the error.
     * @param {HRESULT} hrErrorCode The <b>HRESULT</b> code for the error that occurred.
     * @param {Pointer<Pointer>} lptrKey Used internally by the system.
     * @returns {HRESULT} For a description of return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-error
     */
    Error(piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey) {
        lptrKeyMarshal := lptrKey is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", piRtsSrc, "ptr", piPlugin, "int", dataInterest, "int", hrErrorCode, lptrKeyMarshal, lptrKey, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in when display properties, such as dpi or orientation, change.
     * @remarks
     * This method is called when display properties, such as dpi or orientation, change. Call the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getalltabletcontextids">IRealTimeStylus::GetAllTabletContextIds Method</a> method to get more information about the change.
     * 
     * The <b>IStylusPlugin::UpdateMapping Method</b> method provides a mechanism for applications to determine when tablet display properties change. This method is called on <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-displaychange">WM_DISPLAYCHANGE</a> messages.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-updatemapping
     */
    UpdateMapping(piRtsSrc) {
        result := ComCall(18, this, "ptr", piRtsSrc, "HRESULT")
        return result
    }

    /**
     * Retrieves the events for which the plug-in is to receive notifications.
     * @remarks
     * The default is <b>RTSDI_None</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-realtimestylusdatainterest">RealTimeStylusDataInterest Enumeration</a> enumeration bitmask is retrieved every time a plug-in is enabled or disabled. The <b>DataInterest</b> mask of a plug-in is queried by the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object when the plug-in has been added to the plug-in collections.
     * @returns {Integer} The bitmask indicating the events for which the plug-in is to receive notifications.
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-datainterest
     */
    DataInterest() {
        result := ComCall(19, this, "int*", &pDataInterest := 0, "HRESULT")
        return pDataInterest
    }
}
