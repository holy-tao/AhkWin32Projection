#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IGraphBuilder.ahk
#Include .\IMSVidGraphSegment.ahk
#Include .\IEnumMSVidGraphSegment.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IMSVidGraphSegmentContainer interface is exposed by the Video Control and contains one supported method, get_Graph, which obtains a pointer to the Filter Graph Manager.
 * @remarks
 * 
 * This interface has additional methods besides the one shown here, but they are not supported.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGraphSegmentContainer)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidgraphsegmentcontainer
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGraphSegmentContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidGraphSegmentContainer
     * @type {Guid}
     */
    static IID => Guid("{3dd2903d-e0aa-11d2-b63a-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Graph", "get_Input", "get_Outputs", "get_VideoRenderer", "get_AudioRenderer", "get_Features", "get_Composites", "get_ParentContainer", "Decompose", "IsWindowless", "GetFocus"]

    /**
     * 
     * @returns {IGraphBuilder} 
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
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * The return value is the handle to the window with the keyboard focus. If the calling thread's message queue does not have an associated window with the keyboard focus, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getfocus
     */
    GetFocus() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
