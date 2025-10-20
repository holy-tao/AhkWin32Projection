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
     * 
     * @param {Pointer} dwUserID 
     * @returns {HRESULT} 
     */
    StartPresenting(dwUserID) {
        result := ComCall(3, this, "ptr", dwUserID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @returns {HRESULT} 
     */
    StopPresenting(dwUserID) {
        result := ComCall(4, this, "ptr", dwUserID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} dwUserID 
     * @param {Pointer<VMRPRESENTATIONINFO>} lpPresInfo 
     * @returns {HRESULT} 
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpPresInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
