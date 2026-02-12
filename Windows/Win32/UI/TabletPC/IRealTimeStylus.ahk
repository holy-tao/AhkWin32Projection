#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE_PTR.ahk
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
 * This interface is implemented by the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a>.
 * 
 * Extensibility is provided through synchronous and asynchronous plug-in models, using the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interfaces respectively to conduct custom processing. Use asynchronous plug-ins for computationally intense operations to avoid blocking the packet stream.
 * 
 * We recommend that you do not use the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> interface implementations for CPU and time-intensive operations since this blocks the packet stream flow. These operations should be conducted in <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> interface implementation classes which run on a different thread than the thread that maintains the packet stream flow.
 * 
 * <div class="alert"><b>Note</b>  The synchronous and asynchronous plug-in collections on the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> can be modified without disabling and then re-enabling the <b>RealTimeStylus Class</b> object.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nn-rtscom-irealtimestylus
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
     * Gets or sets a value that specifies whether the RealTimeStylus object collects tablet pen data. (Get)
     * @remarks
     * Multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> objects can exist on the same window provided they are not enabled with overlapping window input rectangles. Enabled <b>RealTimeStylus</b> objects on the same window with overlapping input rectangles result in undetermined behavior.
     * 
     * <div class="alert"><b>Note</b>  An overlap can occur without an error if only one of the input rectangles is enabled at any one time.</div>
     * <div> </div>
     * A child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object must be connected to be enabled.
     * 
     * Although a <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object can be enabled when it has no plug-ins attached to it, it must have at least one plug-in to be useful.
     * 
     * You receive no events when an object is not enabled.
     * 
     * When the <b>IRealTimeStylus::Enabled Property</b> of a container control is set to <b>false</b>, all of its contained controls are also disabled.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-get_enabled
     */
    get_Enabled() {
        result := ComCall(3, this, "int*", &pfEnable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEnable
    }

    /**
     * Gets or sets a value that specifies whether the RealTimeStylus object collects tablet pen data. (Put)
     * @remarks
     * Multiple <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> objects can exist on the same window provided they are not enabled with overlapping window input rectangles. Enabled <b>RealTimeStylus</b> objects on the same window with overlapping input rectangles result in undetermined behavior.
     * 
     * <div class="alert"><b>Note</b>  An overlap can occur without an error if only one of the input rectangles is enabled at any one time.</div>
     * <div> </div>
     * A child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object must be connected to be enabled.
     * 
     * Although a <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object can be enabled when it has no plug-ins attached to it, it must have at least one plug-in to be useful.
     * 
     * You receive no events when an object is not enabled.
     * 
     * When the <b>IRealTimeStylus::Enabled Property</b> of a container control is set to <b>false</b>, all of its contained controls are also disabled.
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-put_enabled
     */
    put_Enabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the handle value associated with the window the RealTimeStylus object uses. (Get)
     * @remarks
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * The HRESULT E_INVALIDOPERATION is returned when you attempt set this property on a child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object.
     * @returns {HANDLE_PTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-get_hwnd
     */
    get_HWND() {
        phwnd := HANDLE_PTR()
        result := ComCall(5, this, "ptr", phwnd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phwnd
    }

    /**
     * Gets or sets the handle value associated with the window the RealTimeStylus object uses. (Put)
     * @remarks
     * If two or more windows exist, this property allows you to specify which window collects ink.
     * 
     * The HRESULT E_INVALIDOPERATION is returned when you attempt set this property on a child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object.
     * @param {HANDLE_PTR} hwnd_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-put_hwnd
     */
    put_HWND(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the window input rectangle for the RealTimeStylus Class object. (Get)
     * @remarks
     * Each <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object receives tablet pen data for specific section of a window based on the defined window input rectangle for that <b>RealTimeStylus Class</b> object.
     * 
     * The default value is an empty window input rectangle, <b>IRealTimeStylus::WindowInputRectangle Property</b>, value. When the <b>IRealTimeStylus::WindowInputRectangle Property</b> value is empty, {0, 0, 0, 0}, the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object collects pen input over the entire window, even after the window is resized.
     * 
     * After the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object starts collecting pen data, it continues to collect the data until the pen is raised, even if the pen is moved outside of the input region.
     * 
     * Use either an attached <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> object or the attached <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> object to uniquely handle pen data that is collected outside of the input region.
     * 
     * The E_INVALIDOPERATION HRESULT is returned when you attempt to set this property on a child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-get_windowinputrectangle
     */
    get_WindowInputRectangle() {
        prcWndInputRect := RECT()
        result := ComCall(7, this, "ptr", prcWndInputRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prcWndInputRect
    }

    /**
     * Gets or sets the window input rectangle for the RealTimeStylus Class object. (Put)
     * @remarks
     * Each <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object receives tablet pen data for specific section of a window based on the defined window input rectangle for that <b>RealTimeStylus Class</b> object.
     * 
     * The default value is an empty window input rectangle, <b>IRealTimeStylus::WindowInputRectangle Property</b>, value. When the <b>IRealTimeStylus::WindowInputRectangle Property</b> value is empty, {0, 0, 0, 0}, the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object collects pen input over the entire window, even after the window is resized.
     * 
     * After the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object starts collecting pen data, it continues to collect the data until the pen is raised, even if the pen is moved outside of the input region.
     * 
     * Use either an attached <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylussyncplugin">IStylusSyncPlugin</a> object or the attached <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-istylusasyncplugin">IStylusAsyncPlugin</a> object to uniquely handle pen data that is collected outside of the input region.
     * 
     * The E_INVALIDOPERATION HRESULT is returned when you attempt to set this property on a child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object.
     * @param {Pointer<RECT>} prcWndInputRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-put_windowinputrectangle
     */
    put_WindowInputRectangle(prcWndInputRect) {
        result := ComCall(8, this, "ptr", prcWndInputRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an IStylusSyncPlugin to the synchronous plug-in collection at the specified index.
     * @remarks
     * Use this to dynamically add a plug-in to the synchronous plug-in collection.
     * 
     * The synchronous and asynchronous plug-in collections on the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object can be modified without disabling and then re-enabling the <b>RealTimeStylus Class</b> object.
     * 
     * Plugins must aggregate the free threaded marshaler and must not be single threaded apartment objects.
     * @param {Integer} iIndex The index of the synchronous plug-in collection where the plug-in is added.
     * @param {IStylusSyncPlugin} piPlugin The plug-in that is added.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-addstylussyncplugin
     */
    AddStylusSyncPlugin(iIndex, piPlugin) {
        result := ComCall(9, this, "uint", iIndex, "ptr", piPlugin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an IStylusSyncPlugin from the collection at the specified index.
     * @remarks
     * Use to dynamically remove a specific plug-in from the synchronous plug-in collection.
     * 
     * The synchronous and asynchronous plug-in collections on <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> can be modified without disabling and then re-enabling <b>RealTimeStylus Class</b>.
     * @param {Integer} iIndex The index of the plug-in to be removed.
     * @param {Pointer<IStylusSyncPlugin>} ppiPlugin A pointer to the plug-in to remove. If you are not interested in receiving the pointer to the removed plug-in, pass <b>NULL</b> for this parameter.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-removestylussyncplugin
     */
    RemoveStylusSyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(10, this, "uint", iIndex, "ptr*", ppiPlugin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all of the plug-ins from the synchronous plug-in collection.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-removeallstylussyncplugins
     */
    RemoveAllStylusSyncPlugins() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the plug-in at the specified index in the synchronous plug-in collection.
     * @param {Integer} iIndex The index for the plug-in that is in the synchronous plug-in collection.
     * @returns {IStylusSyncPlugin} A pointer to  the plug-in.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugin
     */
    GetStylusSyncPlugin(iIndex) {
        result := ComCall(12, this, "uint", iIndex, "ptr*", &ppiPlugin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStylusSyncPlugin(ppiPlugin)
    }

    /**
     * Retrieves the number of plug-ins in the synchronous plug-in collection.
     * @returns {Integer} The number of plug-ins in the synchronous plug-in collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstylussyncplugincount
     */
    GetStylusSyncPluginCount() {
        result := ComCall(13, this, "uint*", &pcPlugins := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcPlugins
    }

    /**
     * Adds an IStylusAsyncPlugin to the asynchronous plug-in collection at the specified index.
     * @remarks
     * You cannot add asynchronous plug-ins if <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has a child <b>RealTimeStylus Class</b> object.
     * @param {Integer} iIndex Specifies the index of the plug-in in the asynchronous plug-in collection.
     * @param {IStylusAsyncPlugin} piPlugin The plug-in to add to.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-addstylusasyncplugin
     */
    AddStylusAsyncPlugin(iIndex, piPlugin) {
        result := ComCall(14, this, "uint", iIndex, "ptr", piPlugin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes and optionally returns an IStylusAsyncPlugin with the specified index in the asynchronous plug-in collection.
     * @param {Integer} iIndex The index of the plug-in to be removed.
     * @param {Pointer<IStylusAsyncPlugin>} ppiPlugin A pointer to the plug-in to remove. If you are not interested in receiving the pointer to the removed plug-in, pass <b>NULL</b> for this parameter.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-removestylusasyncplugin
     */
    RemoveStylusAsyncPlugin(iIndex, ppiPlugin) {
        result := ComCall(15, this, "uint", iIndex, "ptr*", ppiPlugin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all the plug-ins from the asynchronous plug-in collection.
     * @remarks
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-removestylusasyncplugin">IRealTimeStylus::RemoveStylusAsyncPlugin Method</a> to remove a specific asynchronous plug-in.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-removeallstylusasyncplugins
     */
    RemoveAllStylusAsyncPlugins() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the plug-in at the specified index in the asynchronous plug-in collection.
     * @param {Integer} iIndex The index for the plug-in that is in the asynchronous plug-in collection.
     * @returns {IStylusAsyncPlugin} A pointer to the plug-in.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugin
     */
    GetStylusAsyncPlugin(iIndex) {
        result := ComCall(17, this, "uint", iIndex, "ptr*", &ppiPlugin := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStylusAsyncPlugin(ppiPlugin)
    }

    /**
     * Retrieves the number of plug-ins in the asynchronous plug-in collection.
     * @returns {Integer} The plug-in count for the asynchronous plug-in collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugincount
     */
    GetStylusAsyncPluginCount() {
        result := ComCall(18, this, "uint*", &pcPlugins := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcPlugins
    }

    /**
     * Gets or sets a RealTimeStylus object as an asynchronous plug-in of the current RealTimeStylus object.
     * @remarks
     * If there is no child RTS, getting the property returns S_OK with the <i>ppiRTS</i> parameter set to <b>NULL</b>. Setting the child RTS property to <b>NULL</b> breaks the cascade.
     * 
     * <div class="alert"><b>Note</b>  If there is no child RTS, setting the property to <b>NULL</b> returns S_OK.</div>
     * <div> </div>
     * A child <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> cannot have another cascaded child <b>RealTimeStylus</b>.
     * 
     * Plug-ins in the asynchronous collection cannot have children.
     * 
     * If a <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> object is set as a child by using the <b>IRealTimeStylus::ChildRealTimeStylusPlugin Property</b> property, no other asynchronous plug-ins can be added to the parent <b>RealTimeStylus</b>. The depth and breadth of the chain is limited to one child <b>RealTimeStylus</b> object. A child <b>RealTimeStylus</b> can have asynchronous plug-ins.
     * 
     * With the exception of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getstylusasyncplugincount">IRealTimeStylus::GetStylusAsyncPluginCount Method</a>, the asynchronous plug-in methods, such as <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-addstylusasyncplugin">IRealTimeStylus::AddStylusAsyncPlugin Method</a>, return E_INVALIDOPERATION when called on a parent <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a>.
     * @returns {IRealTimeStylus} 
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-get_childrealtimestylusplugin
     */
    get_ChildRealTimeStylusPlugin() {
        result := ComCall(19, this, "ptr*", &ppiRTS := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRealTimeStylus(ppiRTS)
    }

    /**
     * 
     * @param {IRealTimeStylus} piRTS 
     * @returns {HRESULT} 
     */
    putref_ChildRealTimeStylusPlugin(piRTS) {
        result := ComCall(20, this, "ptr", piRTS, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds custom data to the specified queue of the RealTimeStylus Class object.
     * @remarks
     * Specify which queue to add the data to with the <i>sq</i> parameter. Identify the data by using its GUID.
     * 
     * The <i>sq</i> parameter specifies where to add the custom data. It specifies adding the custom data as one of the following:
     * 
     * <ul>
     * <li>The next packet to be processed in the Input queue.</li>
     * <li>A packet to be added to the output queue before the packet currently being processed.</li>
     * <li>A packet to be added to the output queue after the packet currently being processed in the queue.</li>
     * </ul>
     * When data is added to the input queue, it is automatically added to the output queue. The order of the inserted data can only be controlled on the output queue by passing <b>AsyncStylusQueueImmediate</b> in the <i>sq</i> parameter.
     * 
     * The GUID can be used by objects other than plug-ins and real time styluses to add customized information to the queue. This method can be called from any object that has a reference to the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object. The calling object does not have to be a plug-in.
     * 
     * <b>IRealTimeStylus::AddCustomStylusDataToQueue Method</b> enables you to add functionality, such as selection and erase.
     * @param {Integer} sq The <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/ne-rtscom-stylusqueue">StylusQueue Enumeration</a> specifying the stylus queue to which to add the custom data.
     * @param {Pointer<Guid>} pGuidId The GUID for the data to add to the queue specified in <i>sq</i>.
     * @param {Integer} cbData The size, in chars, of the data that <i>pbData</i> points to and which is to be added to the specified queue.
     * @param {Pointer<Integer>} pbData The custom data to add to the specified queue. May not be <b>NULL</b>.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-addcustomstylusdatatoqueue
     */
    AddCustomStylusDataToQueue(sq, pGuidId, cbData, pbData) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "int", sq, "ptr", pGuidId, "uint", cbData, pbDataMarshal, pbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clears the RealTimeStylus Class input and output queues of data.
     * @remarks
     * The <b>ClearStylusQueues</b> method can be used to quickly clear the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> queues. This method clears the queues of all data.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-clearstylusqueues
     */
    ClearStylusQueues() {
        result := ComCall(22, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the mode for the RealTimeStylus Class object to collect data from all digitizers.
     * @remarks
     * This method enables the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object to collect stylus events from any tablet attached to the Tablet PC. The <i>fUseMouseForInput</i> parameter specifies whether the mouse device, as well as the stylus, can be used for input.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setsingletabletmode">IRealTimeStylus::SetSingleTabletMode Method</a> () was initially called and <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is enabled, this call is invalid and TPC_E_INVALID_MODE HRESULT is returned.
     * 
     * <div class="alert"><b>Note</b>  The <b>IRealTimeStylus::SetAllTabletsMode Method</b> method will fail if the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus</a> is enabled. On Microsoft Windows XP, this method will return <b>S_OK</b> but will have no effect. On Windows Vista, this method will return <b>E_INVALID_MODE</b>.</div>
     * <div> </div>
     * @param {BOOL} fUseMouseForInput <b>TRUE</b> for both the mouse and stylus to be used for input; <b>FALSE</b> for the mouse not to be used as input.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-setalltabletsmode
     */
    SetAllTabletsMode(fUseMouseForInput) {
        result := ComCall(23, this, "int", fUseMouseForInput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Modifies the mode for RealTimeStylus Class (RTS) object to collect input from only one tablet object representing a digitizer attached to the Tablet PC. Stylus input from other digitizers is ignored by the RealTimeStylus.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> can be set to one of two tablet-related modes:
     * 
     * <ul>
     * <li>All tablets mode (default)</li>
     * <li>Single tablet mode</li>
     * </ul>
     * If <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setalltabletsmode">IRealTimeStylus::SetAllTabletsMode Method</a> () was initially called and the RealTimeStylus is enabled, the TPC_E_INVALID_MODE HRESULT is returned.
     * @param {IInkTablet} piTablet The <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet Interface</a> object that represents the digitizer device attached to the Tablet PC.
     * @returns {HRESULT} For a description of the return values, see <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus Classes and Interfaces</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-setsingletabletmode
     */
    SetSingleTabletMode(piTablet) {
        result := ComCall(24, this, "ptr", piTablet, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an IInkTablet Interface object to the caller.
     * @remarks
     * This method returns, <i>ppiSingleTablet</i> will contain <b>NULL</b> when the RealTimeStylus is receiving data from more that one tablet. For instance, when the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setalltabletsmode">IRealTimeStylus::SetAllTabletsMode Method</a> is called with a value of <b>TRUE</b> on a machine with a digitizer and mouse.
     * @returns {IInkTablet} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinktablet">IInkTablet Interface</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-gettablet
     */
    GetTablet() {
        result := ComCall(25, this, "ptr*", &ppiSingleTablet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkTablet(ppiSingleTablet)
    }

    /**
     * Retrieves the TabletContextId property that is associated with a given tablet digitizer object.
     * @remarks
     * A digitizer context identifier is specific to an <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object. Two <b>RealTimeStylus Class</b> objects may have different context identifiers for the same digitizer object. A tablet context identifier is valid only while a <b>RealTimeStylus Class</b> object is enabled. If a <b>RealTimeStylus Class</b> object is disabled and then re-enabled, the TCID for each digitizer object might have a different value than it had when the <b>RealTimeStylus Class</b> object was first enabled.
     * 
     * This method can be called even if the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is not enabled as long as the <b>RealTimeStylus Class</b> has not finished processing data in the queue. This method can be called until the last asynchronous plug-in receives <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled">IStylusPlugin::RealTimeStylusDisabled Method</a>.
     * @param {IInkTablet} piTablet Specifies the tablet object associated with a digitizer for which to get the unique identifier for the tablet context.
     * @returns {Integer} The unique identifier for the tablet context.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-gettabletcontextidfromtablet
     */
    GetTabletContextIdFromTablet(piTablet) {
        result := ComCall(26, this, "ptr", piTablet, "uint*", &ptcid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ptcid
    }

    /**
     * Retrieves an IInkTablet Interface for a specified tablet context.
     * @remarks
     * A tablet context identifier is specific to a <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object. Two <b>RealTimeStylus Class</b> objects can have different context identifiers for the same tablet object. A tablet context identifier is only valid while a <b>RealTimeStylus Class</b> object is enabled. If a <b>RealTimeStylus Class</b> object is disabled and then re-enabled, the tablet context identifier for each tablet object may have a different value than when the <b>RealTimeStylus Class</b> object was first enabled.
     * 
     * This method can be called even if <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-get_enabled">IRealTimeStylus::Enabled Property</a> returns <b>false</b> as long as the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled">IStylusPlugin::RealTimeStylusDisabled Method</a> has not finished processing data in the queue. This method can be called until the last asynchronous plug-in receives <b>IStylusPlugin::RealTimeStylusDisabled Method</b>.
     * @param {Integer} tcid Specifies the unique identifier for the tablet context.
     * @returns {IInkTablet} A pointer to the digitizer object specified by the tablet context identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-gettabletfromtabletcontextid
     */
    GetTabletFromTabletContextId(tcid) {
        result := ComCall(27, this, "uint", tcid, "ptr*", &ppiTablet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkTablet(ppiTablet)
    }

    /**
     * Retrieves an array containing all of the currently active tablet context identifiers.
     * @remarks
     * <b>IRealTimeStylus::GetAllTabletContextIds Method</b> method provides access to all the tablet context identifiers that are currently active. This method enables you to get these identifiers directly instead of caching data from <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-realtimestylusenabled">IStylusPlugin::RealTimeStylusEnabled Method</a> notifications.
     * 
     * The scope of the TabletContextID property is limited to a given instance of the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a>; a Tablet object may have a different unique identifier for each instance of the <b>RealTimeStylus Class</b>.
     * @param {Pointer<Integer>} pcTcidCount The number of tablet context identifiers.
     * @returns {Pointer<Integer>} Pointer to the array of tablet context identifiers
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getalltabletcontextids
     */
    GetAllTabletContextIds(pcTcidCount) {
        pcTcidCountMarshal := pcTcidCount is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, pcTcidCountMarshal, pcTcidCount, "ptr*", &ppTcids := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppTcids
    }

    /**
     * Retrieves the collection of styluses the RealTimeStylus Class object has encountered.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> collection includes the styluses for which a tablet context has been created. The collection does not include all styluses available in the system in the stylus collection.
     * 
     * If no stylus object has been detected on the tablet objects associated with the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object, this method returns an empty array.
     * 
     * This method cannot be called unless it the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is connected and enabled <b>RealTimeStylus Class</b>.
     * 
     * <div class="alert"><b>Note</b>  This method can be called if <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-get_enabled">IRealTimeStylus::Enabled Property</a> returns false as long as the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has not finished processing data in the queue. This method can be called until the last asynchronous plug-in receives <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-realtimestylusdisabled">IStylusPlugin::RealTimeStylusDisabled Method</a>.</div>
     * <div> </div>
     * @returns {IInkCursors} When this method returns, contains a pointer to the collection of styluses the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object has encountered.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstyluses
     */
    GetStyluses() {
        result := ComCall(29, this, "ptr*", &ppiInkCursors := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkCursors(ppiInkCursors)
    }

    /**
     * Retrieves a stylus for the specified stylus identifier.
     * @param {Integer} sid_ Specifies security identifier (SID) for the collection.
     * @returns {IInkCursor} When this method returns, contains a pointer to an IInkCursor that describes the stylus for the <i>sid</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getstylusforid
     */
    GetStylusForId(sid_) {
        result := ComCall(30, this, "uint", sid_, "ptr*", &ppiInkCursor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInkCursor(ppiInkCursor)
    }

    /**
     * Requests properties to be included in the packet stream.
     * @remarks
     * Events receive the actual packet properties in the following order.
     * 
     * <table>
     * <tr>
     * <th>Packet order</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * 1st position
     * 
     * </td>
     * <td>
     * Contains the x-coordinate data for the property regardless of whether X was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription">DesiredPacketDescription Property</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 2nd position
     * 
     * </td>
     * <td>
     * Contains the y-coordinate data for the property regardless of whether Y was specified in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription">DesiredPacketDescription Property</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * End position
     * 
     * </td>
     * <td>
     * Contains the packet status when packet status is in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_desiredpacketdescription">DesiredPacketDescription Property</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  The result of <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getpacketdescriptiondata">IRealTimeStylus::GetPacketDescriptionData Method</a> may not match the <b>IRealTimeStylus::SetDesiredPacketDescription Method</b> properties as some of the properties may not be supported by the tablet.</div>
     * <div> </div>
     * If the specified packet properties are not supported by the tablet devices, the property data is not returned and is not represented in the packet data array. If the same GUID appears multiple times in the <i>packetDescription</i> argument, only the first appearance is preserved and all following appearances are filtered out. The <b>IRealTimeStylus::SetDesiredPacketDescription Method</b> method can be called only while the <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-class">RealTimeStylus Class</a> object is disabled.
     * 
     * Attempting to pass in 0 for <i>cProperties</i> and <b>NULL</b> for <i>pPropertyGuids</i> returns E_INVALIDARG.
     * 
     * Calls to the <b>IRealTimeStylus::SetDesiredPacketDescription Method</b> method are immediately reflected in the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-getdesiredpacketdescription">IRealTimeStylus::GetDesiredPacketDescription Method</a> method.
     * @param {Integer} cProperties Count of the properties specified by the <i>pPropertyGuids</i> parameter. Valid values are between 0 and 32, inclusive.
     * @param {Pointer<Guid>} pPropertyGuids The array of globally unique identifiers (GUIDs) for the properties requested to be included in the packet stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription
     */
    SetDesiredPacketDescription(cProperties, pPropertyGuids) {
        result := ComCall(31, this, "uint", cProperties, "ptr", pPropertyGuids, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of properties that have been requested to be included in the packet stream.
     * @remarks
     * Use this method to get the array of packet properties to which the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-irealtimestylus">IRealTimeStylus</a> object has subscribed by calling <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a>. The packet properties are represented by an array of globally unique identifiers (GUIDs). For a complete list of properties for which you can retrieve metrics, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketPropertyGuids Constants</a>.
     * 
     * The default is an array of GUIDs that contains the X, Y and normal pressure GUIDs.
     * 
     * The <b>IRealTimeStylus::GetDesiredPacketDescription Method</b> uses <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> to allocate space for the GUIDs. The caller should call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when the array is no longer needed.
     * 
     * If called on a child <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-irealtimestylus">IRealTimeStylus</a> object (cascading configuration) and connected, this method returns the parent's packet description if connected, otherwise this method returns the default (X, Y, pressure) or whatever properties were set in an earlier call to the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a>.
     * 
     * The following list describes how the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nn-rtscom-irealtimestylus">IRealTimeStylus</a> object orders the packet property GUIDs.
     * 
     * <ul>
     * <li>By default, the <b>IRealTimeStylus::GetDesiredPacketDescription Method</b> method returns GUID_X, GUID_Y, and GUID_NORMAL_PRESSURE.</li>
     * <li>The X and Y GUIDs are always returned in the first two positions in the array by the <b>IRealTimeStylus::GetDesiredPacketDescription Method</b> method, whether they were specified in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a> method.</li>
     * <li>If GUID_PACKET_STATUS is specified in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a> method, GUID_PACKET_STATUS is always returned in the last position in the array by the <b>IRealTimeStylus::GetDesiredPacketDescription Method</b> method.</li>
     * <li>If any GUIDs are specified more than once in the call to the <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a> method, each GUID occurs only once in the array returned by the <b>IRealTimeStylus::GetDesiredPacketDescription Method</b> method.</li>
     * </ul>
     * @param {Pointer<Integer>} pcProperties The size, in bytes, of the <i>ppPropertyGUIDS</i> buffer.
     * @returns {Pointer<Guid>} A pointer to a list of GUIDs specifying which properties, such as X, Y, and NormalPressure, are present in the packet data. For a list of predefined properties, see <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">PacketPropertyGuids Constants</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getdesiredpacketdescription
     */
    GetDesiredPacketDescription(pcProperties) {
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, pcPropertiesMarshal, pcProperties, "ptr*", &ppPropertyGuids := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppPropertyGuids
    }

    /**
     * Retrieves the packet properties and scaling factors.
     * @remarks
     * You can pass <b>NULL</b> if you do not want the scaling parameters.
     * 
     * The <b>IRealTimeStylus::GetPacketDescriptionData Method</b> uses <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> to allocate space for <i>ppPacketProperties</i>. The caller should call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when the array is no longer needed.
     * 
     * The order of properties in the stream of data sent to plug-ins is the same as the order of the properties returned by <b>IRealTimeStylus::GetPacketDescriptionData Method</b>. Use this method to determine what the hardware is reporting versus what was requested when calling <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-irealtimestylus-setdesiredpacketdescription">IRealTimeStylus::SetDesiredPacketDescription Method</a>.
     * @param {Integer} tcid Specifies the tablet context identifier.
     * @param {Pointer<Float>} pfInkToDeviceScaleX Specifies the conversion factor for the horizontal axis from ink space to digitizer coordinates.
     * @param {Pointer<Float>} pfInkToDeviceScaleY Specifies the conversion factor for the vertical axis from ink space to digitizer coordinates.
     * @param {Pointer<Integer>} pcPacketProperties The number of properties in each packet.
     * @returns {Pointer<PACKET_PROPERTY>} Pointer to an array containing the GUIDs and property metrics for each packet property.
     * @see https://learn.microsoft.com/windows/win32/api//content/rtscom/nf-rtscom-irealtimestylus-getpacketdescriptiondata
     */
    GetPacketDescriptionData(tcid, pfInkToDeviceScaleX, pfInkToDeviceScaleY, pcPacketProperties) {
        pfInkToDeviceScaleXMarshal := pfInkToDeviceScaleX is VarRef ? "float*" : "ptr"
        pfInkToDeviceScaleYMarshal := pfInkToDeviceScaleY is VarRef ? "float*" : "ptr"
        pcPacketPropertiesMarshal := pcPacketProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, "uint", tcid, pfInkToDeviceScaleXMarshal, pfInkToDeviceScaleX, pfInkToDeviceScaleYMarshal, pfInkToDeviceScaleY, pcPacketPropertiesMarshal, pcPacketProperties, "ptr*", &ppPacketProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppPacketProperties
    }
}
