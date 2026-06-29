#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidGraphSegment.ahk" { IMSVidGraphSegment }
#Import ".\IEnumMSVidGraphSegment.ahk" { IEnumMSVidGraphSegment }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IGraphBuilder.ahk" { IGraphBuilder }

/**
 * The IMSVidGraphSegmentContainer interface is exposed by the Video Control and contains one supported method, get_Graph, which obtains a pointer to the Filter Graph Manager.
 * @remarks
 * This interface has additional methods besides the one shown here, but they are not supported.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGraphSegmentContainer)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidgraphsegmentcontainer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidGraphSegmentContainer extends IUnknown {
    /**
     * The interface identifier for IMSVidGraphSegmentContainer
     * @type {Guid}
     */
    static IID := Guid("{3dd2903d-e0aa-11d2-b63a-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidGraphSegmentContainer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Graph           : IntPtr
        get_Input           : IntPtr
        get_Outputs         : IntPtr
        get_VideoRenderer   : IntPtr
        get_AudioRenderer   : IntPtr
        get_Features        : IntPtr
        get_Composites      : IntPtr
        get_ParentContainer : IntPtr
        Decompose           : IntPtr
        IsWindowless        : IntPtr
        GetFocus            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidGraphSegmentContainer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IGraphBuilder} 
     */
    Graph {
        get => this.get_Graph()
    }

    /**
     * @type {IMSVidGraphSegment} 
     */
    Input {
        get => this.get_Input()
    }

    /**
     * @type {IEnumMSVidGraphSegment} 
     */
    Outputs {
        get => this.get_Outputs()
    }

    /**
     * @type {IMSVidGraphSegment} 
     */
    VideoRenderer {
        get => this.get_VideoRenderer()
    }

    /**
     * @type {IMSVidGraphSegment} 
     */
    AudioRenderer {
        get => this.get_AudioRenderer()
    }

    /**
     * @type {IEnumMSVidGraphSegment} 
     */
    Features {
        get => this.get_Features()
    }

    /**
     * @type {IEnumMSVidGraphSegment} 
     */
    Composites {
        get => this.get_Composites()
    }

    /**
     * @type {IUnknown} 
     */
    ParentContainer {
        get => this.get_ParentContainer()
    }

    /**
     * The get_Graph method returns a pointer to the Filter Graph Manager.
     * @remarks
     * Objects can use this method to find a specific DirectShow filter in the filter graph. It is not recommended that applications use this method. Applications should always control the filter graph using the Video Control.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {IGraphBuilder} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgraphsegmentcontainer-get_graph
     */
    get_Graph() {
        result := ComCall(3, this, "ptr*", &ppGraph := 0, "HRESULT")
        return IGraphBuilder(ppGraph)
    }

    /**
     * 
     * @returns {IMSVidGraphSegment} 
     */
    get_Input() {
        result := ComCall(4, this, "ptr*", &ppInput := 0, "HRESULT")
        return IMSVidGraphSegment(ppInput)
    }

    /**
     * 
     * @returns {IEnumMSVidGraphSegment} 
     */
    get_Outputs() {
        result := ComCall(5, this, "ptr*", &ppOutputs := 0, "HRESULT")
        return IEnumMSVidGraphSegment(ppOutputs)
    }

    /**
     * 
     * @returns {IMSVidGraphSegment} 
     */
    get_VideoRenderer() {
        result := ComCall(6, this, "ptr*", &ppVR := 0, "HRESULT")
        return IMSVidGraphSegment(ppVR)
    }

    /**
     * 
     * @returns {IMSVidGraphSegment} 
     */
    get_AudioRenderer() {
        result := ComCall(7, this, "ptr*", &ppAR := 0, "HRESULT")
        return IMSVidGraphSegment(ppAR)
    }

    /**
     * 
     * @returns {IEnumMSVidGraphSegment} 
     */
    get_Features() {
        result := ComCall(8, this, "ptr*", &ppFeatures := 0, "HRESULT")
        return IEnumMSVidGraphSegment(ppFeatures)
    }

    /**
     * 
     * @returns {IEnumMSVidGraphSegment} 
     */
    get_Composites() {
        result := ComCall(9, this, "ptr*", &ppComposites := 0, "HRESULT")
        return IEnumMSVidGraphSegment(ppComposites)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_ParentContainer() {
        result := ComCall(10, this, "ptr*", &ppContainer := 0, "HRESULT")
        return IUnknown(ppContainer)
    }

    /**
     * 
     * @param {IMSVidGraphSegment} pSegment 
     * @returns {HRESULT} 
     */
    Decompose(pSegment) {
        result := ComCall(11, this, "ptr", pSegment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsWindowless() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the handle to the window that has the keyboard focus, if the window is attached to the calling thread's message queue.
     * @remarks
     * <b>GetFocus</b> returns the window with the keyboard focus for the current thread's message queue. If <b>GetFocus</b> returns <b>NULL</b>, another thread's queue may be attached to a window that has the keyboard focus.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getforegroundwindow">GetForegroundWindow</a> function to retrieve the handle to the window with which the user is currently working. You can associate your thread's message queue with the windows owned by another thread by using the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-attachthreadinput">AttachThreadInput</a> function.
     * 
     * To get the window with the keyboard focus on the foreground queue or the queue of another thread, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getguithreadinfo">GetGUIThreadInfo</a> function.
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getfocus
     */
    GetFocus() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidGraphSegmentContainer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Graph := CallbackCreate(GetMethod(implObj, "get_Graph"), flags, 2)
        this.vtbl.get_Input := CallbackCreate(GetMethod(implObj, "get_Input"), flags, 2)
        this.vtbl.get_Outputs := CallbackCreate(GetMethod(implObj, "get_Outputs"), flags, 2)
        this.vtbl.get_VideoRenderer := CallbackCreate(GetMethod(implObj, "get_VideoRenderer"), flags, 2)
        this.vtbl.get_AudioRenderer := CallbackCreate(GetMethod(implObj, "get_AudioRenderer"), flags, 2)
        this.vtbl.get_Features := CallbackCreate(GetMethod(implObj, "get_Features"), flags, 2)
        this.vtbl.get_Composites := CallbackCreate(GetMethod(implObj, "get_Composites"), flags, 2)
        this.vtbl.get_ParentContainer := CallbackCreate(GetMethod(implObj, "get_ParentContainer"), flags, 2)
        this.vtbl.Decompose := CallbackCreate(GetMethod(implObj, "Decompose"), flags, 2)
        this.vtbl.IsWindowless := CallbackCreate(GetMethod(implObj, "IsWindowless"), flags, 1)
        this.vtbl.GetFocus := CallbackCreate(GetMethod(implObj, "GetFocus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Graph)
        CallbackFree(this.vtbl.get_Input)
        CallbackFree(this.vtbl.get_Outputs)
        CallbackFree(this.vtbl.get_VideoRenderer)
        CallbackFree(this.vtbl.get_AudioRenderer)
        CallbackFree(this.vtbl.get_Features)
        CallbackFree(this.vtbl.get_Composites)
        CallbackFree(this.vtbl.get_ParentContainer)
        CallbackFree(this.vtbl.Decompose)
        CallbackFree(this.vtbl.IsWindowless)
        CallbackFree(this.vtbl.GetFocus)
    }
}
