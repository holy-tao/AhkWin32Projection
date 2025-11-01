#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVideoFrameStep interface steps through a video stream.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivideoframestep
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVideoFrameStep extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameStep
     * @type {Guid}
     */
    static IID => Guid("{e46a9787-2b71-444d-a4b5-1fab7b708d6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Step", "CanStep", "CancelStep"]

    /**
     * 
     * @param {Integer} dwFrames 
     * @param {IUnknown} pStepObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivideoframestep-step
     */
    Step(dwFrames, pStepObject) {
        result := ComCall(3, this, "uint", dwFrames, "ptr", pStepObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bMultiple 
     * @param {IUnknown} pStepObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivideoframestep-canstep
     */
    CanStep(bMultiple, pStepObject) {
        result := ComCall(4, this, "int", bMultiple, "ptr", pStepObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivideoframestep-cancelstep
     */
    CancelStep() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
