#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the stylus packet data from a digitizer in real time.
 * @remarks
 * 
  * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a>.
  * 
  * Extensibility is provided through synchronous and asynchronous plug-in models, using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interfaces respectively to conduct custom processing. Use asynchronous plug-ins for computationally intense operations to avoid blocking the packet stream.
  * 
  * We recommend that you do not use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> interface implementations for CPU and time-intensive operations since this blocks the packet stream flow. These operations should be conducted in <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interface implementation classes which run on a different thread than the thread that maintains the packet stream flow.
  * 
  * <div class="alert"><b>Note</b>  The synchronous and asynchronous plug-in collections on the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> can be modified without disabling and then re-enabling the <b>RealTimeStylus Class</b> object.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-irealtimestylus
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IRealTimeStylus extends IUnknown{
    /**
     * The interface identifier for IRealTimeStylus
     * @type {Guid}
     */
    static IID => Guid("{a8bb5d22-3144-4a7b-93cd-f34a16be513a}")

    /**
     * The class identifier for RealTimeStylus
     * @type {Guid}
     */
    static CLSID => Guid("{e26b366d-f998-43ce-836f-cb6d904432b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     */
    get_Enabled(pfEnable) {
        result := ComCall(3, this, "ptr", pfEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    put_Enabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} phwnd 
     * @returns {HRESULT} 
     */
    get_HWND(phwnd) {
        result := ComCall(5, this, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hwnd 
     * @returns {HRESULT} 
     */
    put_HWND(hwnd) {
        result := ComCall(6, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcWndInputRect 
     * @returns {HRESULT} 
     */
    get_WindowInputRectangle(prcWndInputRect) {
        result := ComCall(7, this, "ptr", prcWndInputRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcWndInputRect 
     * @returns {HRESULT} 
     */
    put_WindowInputRectangle(prcWndInputRect) {
        result := ComCall(8, this, "ptr", prcWndInputRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusSyncPlugin>} piPlugin 
     * @returns {HRESULT} 
     */
    AddStylusSyncPlugin(iIndex, piPlugin) {
        result := ComCall(9, this, "uint", iIndex, "ptr", piPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusSyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     */
    RemoveStylusSyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(10, this, "uint", iIndex, "ptr", ppiPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllStylusSyncPlugins() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusSyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     */
    GetStylusSyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(12, this, "uint", iIndex, "ptr", ppiPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcPlugins 
     * @returns {HRESULT} 
     */
    GetStylusSyncPluginCount(pcPlugins) {
        result := ComCall(13, this, "uint*", pcPlugins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusAsyncPlugin>} piPlugin 
     * @returns {HRESULT} 
     */
    AddStylusAsyncPlugin(iIndex, piPlugin) {
        result := ComCall(14, this, "uint", iIndex, "ptr", piPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusAsyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     */
    RemoveStylusAsyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(15, this, "uint", iIndex, "ptr", ppiPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllStylusAsyncPlugins() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusAsyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     */
    GetStylusAsyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(17, this, "uint", iIndex, "ptr", ppiPlugin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcPlugins 
     * @returns {HRESULT} 
     */
    GetStylusAsyncPluginCount(pcPlugins) {
        result := ComCall(18, this, "uint*", pcPlugins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} ppiRTS 
     * @returns {HRESULT} 
     */
    get_ChildRealTimeStylusPlugin(ppiRTS) {
        result := ComCall(19, this, "ptr", ppiRTS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} piRTS 
     * @returns {HRESULT} 
     */
    putref_ChildRealTimeStylusPlugin(piRTS) {
        result := ComCall(20, this, "ptr", piRTS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sq 
     * @param {Pointer<Guid>} pGuidId 
     * @param {Integer} cbData 
     * @param {Pointer<Byte>} pbData 
     * @returns {HRESULT} 
     */
    AddCustomStylusDataToQueue(sq, pGuidId, cbData, pbData) {
        result := ComCall(21, this, "int", sq, "ptr", pGuidId, "uint", cbData, "char*", pbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearStylusQueues() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fUseMouseForInput 
     * @returns {HRESULT} 
     */
    SetAllTabletsMode(fUseMouseForInput) {
        result := ComCall(23, this, "int", fUseMouseForInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} piTablet 
     * @returns {HRESULT} 
     */
    SetSingleTabletMode(piTablet) {
        result := ComCall(24, this, "ptr", piTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} ppiSingleTablet 
     * @returns {HRESULT} 
     */
    GetTablet(ppiSingleTablet) {
        result := ComCall(25, this, "ptr", ppiSingleTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} piTablet 
     * @param {Pointer<UInt32>} ptcid 
     * @returns {HRESULT} 
     */
    GetTabletContextIdFromTablet(piTablet, ptcid) {
        result := ComCall(26, this, "ptr", piTablet, "uint*", ptcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Pointer<IInkTablet>} ppiTablet 
     * @returns {HRESULT} 
     */
    GetTabletFromTabletContextId(tcid, ppiTablet) {
        result := ComCall(27, this, "uint", tcid, "ptr", ppiTablet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcTcidCount 
     * @param {Pointer<UInt32>} ppTcids 
     * @returns {HRESULT} 
     */
    GetAllTabletContextIds(pcTcidCount, ppTcids) {
        result := ComCall(28, this, "uint*", pcTcidCount, "uint*", ppTcids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkCursors>} ppiInkCursors 
     * @returns {HRESULT} 
     */
    GetStyluses(ppiInkCursors) {
        result := ComCall(29, this, "ptr", ppiInkCursors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sid 
     * @param {Pointer<IInkCursor>} ppiInkCursor 
     * @returns {HRESULT} 
     */
    GetStylusForId(sid, ppiInkCursor) {
        result := ComCall(30, this, "uint", sid, "ptr", ppiInkCursor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<Guid>} pPropertyGuids 
     * @returns {HRESULT} 
     */
    SetDesiredPacketDescription(cProperties, pPropertyGuids) {
        result := ComCall(31, this, "uint", cProperties, "ptr", pPropertyGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcProperties 
     * @param {Pointer<Guid>} ppPropertyGuids 
     * @returns {HRESULT} 
     */
    GetDesiredPacketDescription(pcProperties, ppPropertyGuids) {
        result := ComCall(32, this, "uint*", pcProperties, "ptr", ppPropertyGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Pointer<Single>} pfInkToDeviceScaleX 
     * @param {Pointer<Single>} pfInkToDeviceScaleY 
     * @param {Pointer<UInt32>} pcPacketProperties 
     * @param {Pointer<PACKET_PROPERTY>} ppPacketProperties 
     * @returns {HRESULT} 
     */
    GetPacketDescriptionData(tcid, pfInkToDeviceScaleX, pfInkToDeviceScaleY, pcPacketProperties, ppPacketProperties) {
        result := ComCall(33, this, "uint", tcid, "float*", pfInkToDeviceScaleX, "float*", pfInkToDeviceScaleY, "uint*", pcPacketProperties, "ptr", ppPacketProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
