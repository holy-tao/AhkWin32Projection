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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "put_Enabled", "get_HWND", "put_HWND", "get_WindowInputRectangle", "put_WindowInputRectangle", "AddStylusSyncPlugin", "RemoveStylusSyncPlugin", "RemoveAllStylusSyncPlugins", "GetStylusSyncPlugin", "GetStylusSyncPluginCount", "AddStylusAsyncPlugin", "RemoveStylusAsyncPlugin", "RemoveAllStylusAsyncPlugins", "GetStylusAsyncPlugin", "GetStylusAsyncPluginCount", "get_ChildRealTimeStylusPlugin", "putref_ChildRealTimeStylusPlugin", "AddCustomStylusDataToQueue", "ClearStylusQueues", "SetAllTabletsMode", "SetSingleTabletMode", "GetTablet", "GetTabletContextIdFromTablet", "GetTabletFromTabletContextId", "GetAllTabletContextIds", "GetStyluses", "GetStylusForId", "SetDesiredPacketDescription", "GetDesiredPacketDescription", "GetPacketDescriptionData"]

    /**
     * 
     * @param {Pointer<BOOL>} pfEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_enabled
     */
    get_Enabled(pfEnable) {
        result := ComCall(3, this, "ptr", pfEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-put_enabled
     */
    put_Enabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE_PTR>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_hwnd
     */
    get_HWND(phwnd) {
        result := ComCall(5, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE_PTR} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-put_hwnd
     */
    put_HWND(hwnd) {
        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcWndInputRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_windowinputrectangle
     */
    get_WindowInputRectangle(prcWndInputRect) {
        result := ComCall(7, this, "ptr", prcWndInputRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcWndInputRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-put_windowinputrectangle
     */
    put_WindowInputRectangle(prcWndInputRect) {
        result := ComCall(8, this, "ptr", prcWndInputRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {IStylusSyncPlugin} piPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-addstylussyncplugin
     */
    AddStylusSyncPlugin(iIndex, piPlugin) {
        result := ComCall(9, this, "uint", iIndex, "ptr", piPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusSyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-removestylussyncplugin
     */
    RemoveStylusSyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(10, this, "uint", iIndex, "ptr*", ppiPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-removeallstylussyncplugins
     */
    RemoveAllStylusSyncPlugins() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusSyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugin
     */
    GetStylusSyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(12, this, "uint", iIndex, "ptr*", ppiPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcPlugins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugincount
     */
    GetStylusSyncPluginCount(pcPlugins) {
        result := ComCall(13, this, "uint*", pcPlugins, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {IStylusAsyncPlugin} piPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-addstylusasyncplugin
     */
    AddStylusAsyncPlugin(iIndex, piPlugin) {
        result := ComCall(14, this, "uint", iIndex, "ptr", piPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusAsyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-removestylusasyncplugin
     */
    RemoveStylusAsyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(15, this, "uint", iIndex, "ptr*", ppiPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-removeallstylusasyncplugins
     */
    RemoveAllStylusAsyncPlugins() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<IStylusAsyncPlugin>} ppiPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugin
     */
    GetStylusAsyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(17, this, "uint", iIndex, "ptr*", ppiPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcPlugins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugincount
     */
    GetStylusAsyncPluginCount(pcPlugins) {
        result := ComCall(18, this, "uint*", pcPlugins, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRealTimeStylus>} ppiRTS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_childrealtimestylusplugin
     */
    get_ChildRealTimeStylusPlugin(ppiRTS) {
        result := ComCall(19, this, "ptr*", ppiRTS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRealTimeStylus} piRTS 
     * @returns {HRESULT} 
     */
    putref_ChildRealTimeStylusPlugin(piRTS) {
        result := ComCall(20, this, "ptr", piRTS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sq 
     * @param {Pointer<Guid>} pGuidId 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-addcustomstylusdatatoqueue
     */
    AddCustomStylusDataToQueue(sq, pGuidId, cbData, pbData) {
        result := ComCall(21, this, "int", sq, "ptr", pGuidId, "uint", cbData, "char*", pbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-clearstylusqueues
     */
    ClearStylusQueues() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fUseMouseForInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-setalltabletsmode
     */
    SetAllTabletsMode(fUseMouseForInput) {
        result := ComCall(23, this, "int", fUseMouseForInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTablet} piTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-setsingletabletmode
     */
    SetSingleTabletMode(piTablet) {
        result := ComCall(24, this, "ptr", piTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkTablet>} ppiSingleTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettablet
     */
    GetTablet(ppiSingleTablet) {
        result := ComCall(25, this, "ptr*", ppiSingleTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTablet} piTablet 
     * @param {Pointer<Integer>} ptcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettabletcontextidfromtablet
     */
    GetTabletContextIdFromTablet(piTablet, ptcid) {
        result := ComCall(26, this, "ptr", piTablet, "uint*", ptcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Pointer<IInkTablet>} ppiTablet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettabletfromtabletcontextid
     */
    GetTabletFromTabletContextId(tcid, ppiTablet) {
        result := ComCall(27, this, "uint", tcid, "ptr*", ppiTablet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcTcidCount 
     * @param {Pointer<Pointer<Integer>>} ppTcids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getalltabletcontextids
     */
    GetAllTabletContextIds(pcTcidCount, ppTcids) {
        result := ComCall(28, this, "uint*", pcTcidCount, "ptr*", ppTcids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkCursors>} ppiInkCursors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstyluses
     */
    GetStyluses(ppiInkCursors) {
        result := ComCall(29, this, "ptr*", ppiInkCursors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sid 
     * @param {Pointer<IInkCursor>} ppiInkCursor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusforid
     */
    GetStylusForId(sid, ppiInkCursor) {
        result := ComCall(30, this, "uint", sid, "ptr*", ppiInkCursor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<Guid>} pPropertyGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription
     */
    SetDesiredPacketDescription(cProperties, pPropertyGuids) {
        result := ComCall(31, this, "uint", cProperties, "ptr", pPropertyGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcProperties 
     * @param {Pointer<Pointer<Guid>>} ppPropertyGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getdesiredpacketdescription
     */
    GetDesiredPacketDescription(pcProperties, ppPropertyGuids) {
        result := ComCall(32, this, "uint*", pcProperties, "ptr*", ppPropertyGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Pointer<Float>} pfInkToDeviceScaleX 
     * @param {Pointer<Float>} pfInkToDeviceScaleY 
     * @param {Pointer<Integer>} pcPacketProperties 
     * @param {Pointer<Pointer<PACKET_PROPERTY>>} ppPacketProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getpacketdescriptiondata
     */
    GetPacketDescriptionData(tcid, pfInkToDeviceScaleX, pfInkToDeviceScaleY, pcPacketProperties, ppPacketProperties) {
        result := ComCall(33, this, "uint", tcid, "float*", pfInkToDeviceScaleX, "float*", pfInkToDeviceScaleY, "uint*", pcPacketProperties, "ptr*", ppPacketProperties, "HRESULT")
        return result
    }
}
