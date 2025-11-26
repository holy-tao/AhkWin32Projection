#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives notifications of RealTimeStylus Class events to enable you to perform custom processing based on those events.
 * @remarks
 * 
 * Both the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interfaces derive from this interface and can be added to <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> plug-in collections.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-istylusplugin
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
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} cTcidCount Number of tablet context identifiers the RTS has encountered. Valid values are 0 through 8, inclusive.
     * @param {Pointer<Integer>} pTcids The tablet context identifiers.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-realtimestylusenabled
     */
    RealTimeStylusEnabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the RealTimeStylus Class (RTS) object is disabled.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} cTcidCount Number of tablet context identifiers the RTS has encountered. Valid values are 0 through 8, inclusive.
     * @param {Pointer<Integer>} pTcids The tablet context identifiers.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled
     */
    RealTimeStylusDisabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the stylus is entering the detection range of the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} tcid Tablet context identifier.
     * @param {Integer} sid Stylus identifier.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusinrange
     */
    StylusInRange(piRtsSrc, tcid, sid) {
        result := ComCall(5, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the stylus has left the detection range of the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} tcid Tablet context identifier.
     * @param {Integer} sid Stylus identifier.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusoutofrange
     */
    StylusOutOfRange(piRtsSrc, tcid, sid) {
        result := ComCall(6, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the tablet pen has touched the digitizer surface.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the stylus.
     * @param {Integer} cPropCountPerPkt Number of properties per packet. Valid values are 0 through 32, inclusive.
     * @param {Pointer<Integer>} pPacket The start of the packet data.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt A pointer to the modified stylus data packet. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the packet has been modified and RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusdown
     */
    StylusDown(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user has raised the tablet pen from the tablet digitizer surface.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the pen.
     * @param {Integer} cPropCountPerPkt Number of properties per packet. Valid values are 0 through 32, inclusive.
     * @param {Pointer<Integer>} pPacket The start of the packet data.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt A pointer to the modified stylus data packet. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the packet has been modified and RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusup
     */
    StylusUp(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user is pressing a stylus button.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Integer} sid Security identifier.
     * @param {Pointer<Guid>} pGuidStylusButton The GUID-type identifier for the stylus button data. The GUID indcates the unique identifier for this data object.
     * @param {Pointer<POINT>} pStylusPos A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that is associated with the stylus.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusbuttondown
     */
    StylusButtonDown(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(9, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that the user has released a stylus button.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} sid Security identifier.
     * @param {Pointer<Guid>} pGuidStylusButton The globally unique identifier (GUID) for the stylus button data.
     * @param {Pointer<POINT>} pStylusPos A<a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> containing the information about the RTS that is associated with the stylus.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-stylusbuttonup
     */
    StylusButtonUp(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(10, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * Notifies the object implementing the plug-in that the stylus is moving above the digitizer.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> structure containing the information about the RTS that is associated with the stylus.
     * @param {Integer} cPktCount The number of properties per data packet.
     * @param {Integer} cPktBuffLength The length, in <b>bytes</b>, of the buffer pointed to by <i>pPackets</i>. The memory occupied by each packet is (<i>cPktBuffLength</i> / <i>cPktCount</i>). Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data. It is read-only.
     * @param {Pointer<Integer>} pcInOutPkts The number of <b>LONGs</b> in <i>ppInOutPkt</i>.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts A pointer to an array of modified stylus data packets. The plug-in can use this parameter to feed modified packet data to downstream packets. For a value other than <b>NULL</b>, RTS will send this data down to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-inairpackets
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
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {Pointer<StylusInfo>} pStylusInfo A <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ns-rtscom-stylusinfo">StylusInfo Structure</a> structure which contains information about the RTS that is associated with the pen.
     * @param {Integer} cPktCount The number of properties per data packet.
     * @param {Integer} cPktBuffLength The length, in <b>bytes</b>, of the buffer pointed to by <i>pPackets</i>. The memory occupied by each packet is (<i>cPktBuffLength</i> / <i>cPktCount</i>). Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pPackets A pointer to the start of the packet data.
     * @param {Pointer<Integer>} pcInOutPkts The number of <b>LONGs</b> in <i>ppInOutPkt</i>.
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts A pointer to an array of modified stylus data packets. The plug-in can use this parameter to feed modified packet data to downstream packets. A value other than <b>NULL</b> indicates that the RTS will send this data to plug-ins by using the <i>pPacket</i> parameter.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-packets
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
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Pointer<Guid>} pGuidId The globally unique identifier (GUID) for the custom data.
     * @param {Integer} cbData The size, in chars, of the buffer, <i>pbData</i>. Valid values are 0 through 0x7FFF, inclusive.
     * @param {Pointer<Integer>} pbData A pointer to the buffer containing the custom data sent by the RTS object.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-customstylusdataadded
     */
    CustomStylusDataAdded(piRtsSrc, pGuidId, cbData, pbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "ptr", piRtsSrc, "ptr", pGuidId, "uint", cbData, pbDataMarshal, pbData, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing plug-in that a system event is available.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} tcid The tablet context identifier for the event.
     * @param {Integer} sid The security identifier.
     * @param {Integer} event The system event sent by the RTS object
     * @param {SYSTEM_EVENT_DATA} eventdata The 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-system_event_data">SYSTEM_EVENT_DATA</a> structure containing information about the system event, <i>event</i>.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-systemevent
     */
    SystemEvent(piRtsSrc, tcid, sid, event, eventdata) {
        result := ComCall(14, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "ushort", event, "ptr", eventdata, "HRESULT")
        return result
    }

    /**
     * Notifies an implementing plug-in when an ITablet object is attached to the system.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @param {IInkTablet} piTablet The added tablet object.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-tabletadded
     */
    TabletAdded(piRtsSrc, piTablet) {
        result := ComCall(15, this, "ptr", piRtsSrc, "ptr", piTablet, "HRESULT")
        return result
    }

    /**
     * Notifies an implementing plug-in when an ITablet object is removed from the system.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {Integer} iTabletIndex The tablet index.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-tabletremoved
     */
    TabletRemoved(piRtsSrc, iTabletIndex) {
        result := ComCall(16, this, "ptr", piRtsSrc, "int", iTabletIndex, "HRESULT")
        return result
    }

    /**
     * Notifies the implementing object that this plug-in or one of the previous plug-ins in either the IStylusAsyncPlugin or IStylusSyncPlugin collection threw an exception.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> (RTS) object that sent the notification.
     * @param {IStylusPlugin} piPlugin The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin</a> object that sent the notification.
     * @param {Integer} dataInterest Identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusplugin">IStylusPlugin</a> method that generated the error.
     * @param {HRESULT} hrErrorCode The <b>HRESULT</b> code for the error that occurred.
     * @param {Pointer<Pointer>} lptrKey Used internally by the system.
     * @returns {HRESULT} For a description of return values, see <a href="/windows/desktop/tablet/classes-and-interfaces---ink-analysis">Classes and Interfaces - Ink Analysis</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-error
     */
    Error(piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey) {
        lptrKeyMarshal := lptrKey is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", piRtsSrc, "ptr", piPlugin, "int", dataInterest, "int", hrErrorCode, lptrKeyMarshal, lptrKey, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in when display properties, such as dpi or orientation, change.
     * @param {IRealTimeStylus} piRtsSrc The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object that sent the notification.
     * @returns {HRESULT} For a description of the return values, see <a href="/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-updatemapping
     */
    UpdateMapping(piRtsSrc) {
        result := ComCall(18, this, "ptr", piRtsSrc, "HRESULT")
        return result
    }

    /**
     * Retrieves the events for which the plug-in is to receive notifications.
     * @returns {Integer} The bitmask indicating the events for which the plug-in is to receive notifications.
     * @see https://docs.microsoft.com/windows/win32/api//rtscom/nf-rtscom-istylusplugin-datainterest
     */
    DataInterest() {
        result := ComCall(19, this, "int*", &pDataInterest := 0, "HRESULT")
        return pDataInterest
    }
}
