#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRImagePresenter9 interface is implemented by the default allocator-presenter for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrimagepresenter9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenter9 extends IUnknown{
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
     * @param {Pointer<VMR9PresentationInfo>} lpPresInfo 
     * @returns {HRESULT} 
     */
    PresentImage(dwUserID, lpPresInfo) {
        result := ComCall(5, this, "ptr", dwUserID, "ptr", lpPresInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
