#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IStylusSyncPlugin.ahk
#Include .\IStylusAsyncPlugin.ahk
#Include .\IRealTimeStylus.ahk
#Include .\IInkTablet.ahk
#Include .\IInkCursors.ahk
#Include .\IInkCursor.ahk
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
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {HANDLE_PTR} 
     */
    HWND {
        get => this.get_HWND()
        set => this.put_HWND(value)
    }

    /**
     * @type {RECT} 
     */
    WindowInputRectangle {
        get => this.get_WindowInputRectangle()
        set => this.put_WindowInputRectangle(value)
    }

    /**
     * @type {IRealTimeStylus} 
     */
    ChildRealTimeStylusPlugin {
        get => this.get_ChildRealTimeStylusPlugin()
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
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
     * @returns {HANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_hwnd
     */
    get_HWND() {
        result := ComCall(5, this, "ptr*", &phwnd := 0, "HRESULT")
        return phwnd
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
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_windowinputrectangle
     */
    get_WindowInputRectangle() {
        prcWndInputRect := RECT()
        result := ComCall(7, this, "ptr", prcWndInputRect, "HRESULT")
        return prcWndInputRect
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
     * @returns {IStylusSyncPlugin} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugin
     */
    GetStylusSyncPlugin(iIndex) {
        result := ComCall(12, this, "uint", iIndex, "ptr*", &ppiPlugin := 0, "HRESULT")
        return IStylusSyncPlugin(ppiPlugin)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugincount
     */
    GetStylusSyncPluginCount() {
        result := ComCall(13, this, "uint*", &pcPlugins := 0, "HRESULT")
        return pcPlugins
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
     * @returns {IStylusAsyncPlugin} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugin
     */
    GetStylusAsyncPlugin(iIndex) {
        result := ComCall(17, this, "uint", iIndex, "ptr*", &ppiPlugin := 0, "HRESULT")
        return IStylusAsyncPlugin(ppiPlugin)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugincount
     */
    GetStylusAsyncPluginCount() {
        result := ComCall(18, this, "uint*", &pcPlugins := 0, "HRESULT")
        return pcPlugins
    }

    /**
     * 
     * @returns {IRealTimeStylus} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-get_childrealtimestylusplugin
     */
    get_ChildRealTimeStylusPlugin() {
        result := ComCall(19, this, "ptr*", &ppiRTS := 0, "HRESULT")
        return IRealTimeStylus(ppiRTS)
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
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "int", sq, "ptr", pGuidId, "uint", cbData, pbDataMarshal, pbData, "HRESULT")
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
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettablet
     */
    GetTablet() {
        result := ComCall(25, this, "ptr*", &ppiSingleTablet := 0, "HRESULT")
        return IInkTablet(ppiSingleTablet)
    }

    /**
     * 
     * @param {IInkTablet} piTablet 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettabletcontextidfromtablet
     */
    GetTabletContextIdFromTablet(piTablet) {
        result := ComCall(26, this, "ptr", piTablet, "uint*", &ptcid := 0, "HRESULT")
        return ptcid
    }

    /**
     * 
     * @param {Integer} tcid 
     * @returns {IInkTablet} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-gettabletfromtabletcontextid
     */
    GetTabletFromTabletContextId(tcid) {
        result := ComCall(27, this, "uint", tcid, "ptr*", &ppiTablet := 0, "HRESULT")
        return IInkTablet(ppiTablet)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcTcidCount 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getalltabletcontextids
     */
    GetAllTabletContextIds(pcTcidCount) {
        pcTcidCountMarshal := pcTcidCount is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, pcTcidCountMarshal, pcTcidCount, "ptr*", &ppTcids := 0, "HRESULT")
        return ppTcids
    }

    /**
     * 
     * @returns {IInkCursors} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstyluses
     */
    GetStyluses() {
        result := ComCall(29, this, "ptr*", &ppiInkCursors := 0, "HRESULT")
        return IInkCursors(ppiInkCursors)
    }

    /**
     * 
     * @param {Integer} sid 
     * @returns {IInkCursor} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getstylusforid
     */
    GetStylusForId(sid) {
        result := ComCall(30, this, "uint", sid, "ptr*", &ppiInkCursor := 0, "HRESULT")
        return IInkCursor(ppiInkCursor)
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
     * @returns {Pointer<Guid>} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getdesiredpacketdescription
     */
    GetDesiredPacketDescription(pcProperties) {
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, pcPropertiesMarshal, pcProperties, "ptr*", &ppPropertyGuids := 0, "HRESULT")
        return ppPropertyGuids
    }

    /**
     * 
     * @param {Integer} tcid 
     * @param {Pointer<Float>} pfInkToDeviceScaleX 
     * @param {Pointer<Float>} pfInkToDeviceScaleY 
     * @param {Pointer<Integer>} pcPacketProperties 
     * @returns {Pointer<PACKET_PROPERTY>} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus-getpacketdescriptiondata
     */
    GetPacketDescriptionData(tcid, pfInkToDeviceScaleX, pfInkToDeviceScaleY, pcPacketProperties) {
        pfInkToDeviceScaleXMarshal := pfInkToDeviceScaleX is VarRef ? "float*" : "ptr"
        pfInkToDeviceScaleYMarshal := pfInkToDeviceScaleY is VarRef ? "float*" : "ptr"
        pcPacketPropertiesMarshal := pcPacketProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, "uint", tcid, pfInkToDeviceScaleXMarshal, pfInkToDeviceScaleX, pfInkToDeviceScaleYMarshal, pfInkToDeviceScaleY, pcPacketPropertiesMarshal, pcPacketProperties, "ptr*", &ppPacketProperties := 0, "HRESULT")
        return ppPacketProperties
    }
}
