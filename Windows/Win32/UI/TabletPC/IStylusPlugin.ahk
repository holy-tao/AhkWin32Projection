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
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} cTcidCount 
     * @param {Pointer<Integer>} pTcids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-realtimestylusenabled
     */
    RealTimeStylusEnabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} cTcidCount 
     * @param {Pointer<Integer>} pTcids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled
     */
    RealTimeStylusDisabled(piRtsSrc, cTcidCount, pTcids) {
        pTcidsMarshal := pTcids is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", piRtsSrc, "uint", cTcidCount, pTcidsMarshal, pTcids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusinrange
     */
    StylusInRange(piRtsSrc, tcid, sid) {
        result := ComCall(5, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusoutofrange
     */
    StylusOutOfRange(piRtsSrc, tcid, sid) {
        result := ComCall(6, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPropCountPerPkt 
     * @param {Pointer<Integer>} pPacket 
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusdown
     */
    StylusDown(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPropCountPerPkt 
     * @param {Pointer<Integer>} pPacket 
     * @param {Pointer<Pointer<Integer>>} ppInOutPkt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusup
     */
    StylusUp(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        pPacketMarshal := pPacket is VarRef ? "int*" : "ptr"
        ppInOutPktMarshal := ppInOutPkt is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, pPacketMarshal, pPacket, ppInOutPktMarshal, ppInOutPkt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} sid 
     * @param {Pointer<Guid>} pGuidStylusButton 
     * @param {Pointer<POINT>} pStylusPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusbuttondown
     */
    StylusButtonDown(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(9, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} sid 
     * @param {Pointer<Guid>} pGuidStylusButton 
     * @param {Pointer<POINT>} pStylusPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-stylusbuttonup
     */
    StylusButtonUp(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(10, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPktCount 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Integer>} pPackets 
     * @param {Pointer<Integer>} pcInOutPkts 
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts 
     * @returns {HRESULT} 
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
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPktCount 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Integer>} pPackets 
     * @param {Pointer<Integer>} pcInOutPkts 
     * @param {Pointer<Pointer<Integer>>} ppInOutPkts 
     * @returns {HRESULT} 
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
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Pointer<Guid>} pGuidId 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-customstylusdataadded
     */
    CustomStylusDataAdded(piRtsSrc, pGuidId, cbData, pbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "ptr", piRtsSrc, "ptr", pGuidId, "uint", cbData, pbDataMarshal, pbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Integer} event 
     * @param {SYSTEM_EVENT_DATA} eventdata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-systemevent
     */
    SystemEvent(piRtsSrc, tcid, sid, event, eventdata) {
        result := ComCall(14, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "ushort", event, "ptr", eventdata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {IInkTablet} piTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-tabletadded
     */
    TabletAdded(piRtsSrc, piTablet) {
        result := ComCall(15, this, "ptr", piRtsSrc, "ptr", piTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {Integer} iTabletIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-tabletremoved
     */
    TabletRemoved(piRtsSrc, iTabletIndex) {
        result := ComCall(16, this, "ptr", piRtsSrc, "int", iTabletIndex, "HRESULT")
        return result
    }

    /**
     * Indicates a significant problem.
     * @param {IRealTimeStylus} piRtsSrc 
     * @param {IStylusPlugin} piPlugin 
     * @param {Integer} dataInterest 
     * @param {HRESULT} hrErrorCode 
     * @param {Pointer<Pointer>} lptrKey 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error(piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey) {
        lptrKeyMarshal := lptrKey is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", piRtsSrc, "ptr", piPlugin, "int", dataInterest, "int", hrErrorCode, lptrKeyMarshal, lptrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRtsSrc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-updatemapping
     */
    UpdateMapping(piRtsSrc) {
        result := ComCall(18, this, "ptr", piRtsSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDataInterest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-istylusplugin-datainterest
     */
    DataInterest(pDataInterest) {
        pDataInterestMarshal := pDataInterest is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pDataInterestMarshal, pDataInterest, "HRESULT")
        return result
    }
}
