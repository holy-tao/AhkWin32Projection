#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRVideoStreamControl9 interface is implemented on each input pin of the Video Mixing Renderer Filter 9.
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrvideostreamcontrol9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRVideoStreamControl9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRVideoStreamControl9
     * @type {Guid}
     */
    static IID => Guid("{d0cfe38b-93e7-4772-8957-0400c49a4485}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamActiveState", "GetStreamActiveState"]

    /**
     * 
     * @param {BOOL} fActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrvideostreamcontrol9-setstreamactivestate
     */
    SetStreamActiveState(fActive) {
        result := ComCall(3, this, "int", fActive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} lpfActive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrvideostreamcontrol9-getstreamactivestate
     */
    GetStreamActiveState(lpfActive) {
        result := ComCall(4, this, "ptr", lpfActive, "HRESULT")
        return result
    }
}
