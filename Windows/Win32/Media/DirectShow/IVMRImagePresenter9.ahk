#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenter9 interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrimagepresenter9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenter9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImagePresenter9
     * @type {Guid}
     */
    static IID => Guid("{69188c61-12a3-40f0-8ffc-342e7b433fd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartPresenting", "StopPresenting", "PresentImage"]

    /**
     * The StartPresenting method is called just before the video starts playing. The allocator-presenter should perform any necessary configuration in this method.
     * @remarks
     * <b>PresentImage</b> can be called when the filter is in either a running or a paused state. <c>StartPresenting</code> and <b>StopPresenting</b> can be called only in a running state. Therefore, if the graph is paused before it is run, <b>PresentImage</b> will be called before <code>StartPresenting</c>.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenter9-startpresenting
     */
    StartPresenting(dwUserID) {
        result := ComCall(3, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * The StopPresenting method is called just after the video stops playing. The allocator-presenter should perform any necessary cleanup in this method.
     * @remarks
     * <c>StopPresenting</c> can be called only when the VMR is in a running state.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenter9-stoppresenting
     */
    StopPresenting(dwUserID) {
        result := ComCall(4, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * The PresentImage method is called at precisely the moment this video frame should be presented.
     * @remarks
     * <c>PresentImage</code> can be called when the filter is in either a running or a paused state. <b>StartPresenting</b> and <b>StopPresenting</b> can be called only in a running state. Therefore, if the graph is paused before it is run, <code>PresentImage</c> will be called before <b>StartPresenting</b>.
     * 
     * Applications can create custom blending effects by using a single instance of an allocator-presenter with multiple instances of the VMR either in a single filter graph or in multiple filter graphs. Using the allocator presenter in this way enables applications to blend streams from different filter graphs, or blend different streams within the same filter graph. If you are using a single instance of the VMR, set this value to zero.
     * 
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR that uniquely identifies this instance of the VMR in scenarios when multiple instances of the VMR are being used with a single instance of an allocator-presenter. See Remarks.
     * @param {Pointer<VMR9PresentationInfo>} lpPresInfo Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9presentationinfo">VMR9PresentationInfo</a> structure that contains information about the video frame.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagepresenter9-presentimage
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpPresInfo, "HRESULT")
        return result
    }
}
