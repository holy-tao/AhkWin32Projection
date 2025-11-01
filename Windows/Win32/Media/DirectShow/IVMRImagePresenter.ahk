#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenter interface is implemented by the default Allocator-Presenter for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrimagepresenter
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
     * 
     * @param {Pointer} dwUserID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-startpresenting
     */
    StartPresenting(dwUserID) {
        result := ComCall(3, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-stoppresenting
     */
    StopPresenting(dwUserID) {
        result := ComCall(4, this, "ptr", dwUserID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<VMRPRESENTATIONINFO>} lpPresInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenter-presentimage
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpPresInfo, "HRESULT")
        return result
    }
}
