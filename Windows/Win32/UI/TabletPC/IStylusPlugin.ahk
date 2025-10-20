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
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} cTcidCount 
     * @param {Pointer<UInt32>} pTcids 
     * @returns {HRESULT} 
     */
    RealTimeStylusEnabled(piRtsSrc, cTcidCount, pTcids) {
        result := ComCall(3, this, "ptr", piRtsSrc, "uint", cTcidCount, "uint*", pTcids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} cTcidCount 
     * @param {Pointer<UInt32>} pTcids 
     * @returns {HRESULT} 
     */
    RealTimeStylusDisabled(piRtsSrc, cTcidCount, pTcids) {
        result := ComCall(4, this, "ptr", piRtsSrc, "uint", cTcidCount, "uint*", pTcids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @returns {HRESULT} 
     */
    StylusInRange(piRtsSrc, tcid, sid) {
        result := ComCall(5, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @returns {HRESULT} 
     */
    StylusOutOfRange(piRtsSrc, tcid, sid) {
        result := ComCall(6, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPropCountPerPkt 
     * @param {Pointer<Int32>} pPacket 
     * @param {Pointer<Int32>} ppInOutPkt 
     * @returns {HRESULT} 
     */
    StylusDown(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        result := ComCall(7, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, "int*", pPacket, "int*", ppInOutPkt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPropCountPerPkt 
     * @param {Pointer<Int32>} pPacket 
     * @param {Pointer<Int32>} ppInOutPkt 
     * @returns {HRESULT} 
     */
    StylusUp(piRtsSrc, pStylusInfo, cPropCountPerPkt, pPacket, ppInOutPkt) {
        result := ComCall(8, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPropCountPerPkt, "int*", pPacket, "int*", ppInOutPkt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} sid 
     * @param {Pointer<Guid>} pGuidStylusButton 
     * @param {Pointer<POINT>} pStylusPos 
     * @returns {HRESULT} 
     */
    StylusButtonDown(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(9, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} sid 
     * @param {Pointer<Guid>} pGuidStylusButton 
     * @param {Pointer<POINT>} pStylusPos 
     * @returns {HRESULT} 
     */
    StylusButtonUp(piRtsSrc, sid, pGuidStylusButton, pStylusPos) {
        result := ComCall(10, this, "ptr", piRtsSrc, "uint", sid, "ptr", pGuidStylusButton, "ptr", pStylusPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPktCount 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Int32>} pPackets 
     * @param {Pointer<UInt32>} pcInOutPkts 
     * @param {Pointer<Int32>} ppInOutPkts 
     * @returns {HRESULT} 
     */
    InAirPackets(piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts) {
        result := ComCall(11, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPktCount, "uint", cPktBuffLength, "int*", pPackets, "uint*", pcInOutPkts, "int*", ppInOutPkts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<StylusInfo>} pStylusInfo 
     * @param {Integer} cPktCount 
     * @param {Integer} cPktBuffLength 
     * @param {Pointer<Int32>} pPackets 
     * @param {Pointer<UInt32>} pcInOutPkts 
     * @param {Pointer<Int32>} ppInOutPkts 
     * @returns {HRESULT} 
     */
    Packets(piRtsSrc, pStylusInfo, cPktCount, cPktBuffLength, pPackets, pcInOutPkts, ppInOutPkts) {
        result := ComCall(12, this, "ptr", piRtsSrc, "ptr", pStylusInfo, "uint", cPktCount, "uint", cPktBuffLength, "int*", pPackets, "uint*", pcInOutPkts, "int*", ppInOutPkts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<Guid>} pGuidId 
     * @param {Integer} cbData 
     * @param {Pointer<Byte>} pbData 
     * @returns {HRESULT} 
     */
    CustomStylusDataAdded(piRtsSrc, pGuidId, cbData, pbData) {
        result := ComCall(13, this, "ptr", piRtsSrc, "ptr", pGuidId, "uint", cbData, "char*", pbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} tcid 
     * @param {Integer} sid 
     * @param {Integer} event 
     * @param {SYSTEM_EVENT_DATA} eventdata 
     * @returns {HRESULT} 
     */
    SystemEvent(piRtsSrc, tcid, sid, event, eventdata) {
        result := ComCall(14, this, "ptr", piRtsSrc, "uint", tcid, "uint", sid, "ushort", event, "ptr", eventdata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<IInkTablet>} piTablet 
     * @returns {HRESULT} 
     */
    TabletAdded(piRtsSrc, piTablet) {
        result := ComCall(15, this, "ptr", piRtsSrc, "ptr", piTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Integer} iTabletIndex 
     * @returns {HRESULT} 
     */
    TabletRemoved(piRtsSrc, iTabletIndex) {
        result := ComCall(16, this, "ptr", piRtsSrc, "int", iTabletIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates a significant problem.
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @param {Pointer<IStylusPlugin>} piPlugin 
     * @param {Integer} dataInterest 
     * @param {HRESULT} hrErrorCode 
     * @param {Pointer<IntPtr>} lptrKey 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error(piRtsSrc, piPlugin, dataInterest, hrErrorCode, lptrKey) {
        result := ComCall(17, this, "ptr", piRtsSrc, "ptr", piPlugin, "int", dataInterest, "int", hrErrorCode, "ptr*", lptrKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRtsSrc 
     * @returns {HRESULT} 
     */
    UpdateMapping(piRtsSrc) {
        result := ComCall(18, this, "ptr", piRtsSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDataInterest 
     * @returns {HRESULT} 
     */
    DataInterest(pDataInterest) {
        result := ComCall(19, this, "int*", pDataInterest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
