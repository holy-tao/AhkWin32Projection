#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenter interface is implemented by the default Allocator-Presenter for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrimagepresenter
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImagePresenter
     * @type {Guid}
     */
    static IID => Guid("{ce704fe7-e71e-41fb-baa2-c4403e1182f5}")

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
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-startpresenting
     */
    StartPresenting(dwUserID) {
        result := ComCall(3, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * The StopPresenting method is called just after the video stops playing. The allocator-presenter should perform any necessary cleanup in this method.
     * @remarks
     * <c>StopPresenting</c> can be called only when the VMR is in a running state.
     * @param {Pointer} dwUserID An application-defined <b>DWORD_PTR</b> cookie that uniquely identifies this instance of the VMR for use in scenarios when one instance of the allocator-presenter is used with multiple VMR instances.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-stoppresenting
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
     * Applications can create custom blending effects by using a single instance of an Allocator-Presenter with multiple instances of the VMR either in a single filter graph or in multiple filter graphs. Using the allocator presenter in this way enables applications to blend streams from different filter graphs, or blend different streams within the same filter graph. If you are using a single instance of the VMR, set this value to zero.
     * @param {Pointer} dwUserID An application-defined DWORD_PTR that uniquely identifies this instance of the VMR in scenarios when multiple instances of the VMR are being used with a single instance of an Allocator-Presenter. See Remarks
     * @param {Pointer<VMRPRESENTATIONINFO>} lpPresInfo Specifies the [VMRPRESENTATIONINFO](/windows/desktop/api/strmif/ns-strmif-vmrpresentationinfo) structure.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-presentimage
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpPresInfo, "HRESULT")
        return result
    }
}
