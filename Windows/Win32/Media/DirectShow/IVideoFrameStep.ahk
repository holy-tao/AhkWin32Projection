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
     * 
     * @param {Integer} dwFrames 
     * @param {Pointer<IUnknown>} pStepObject 
     * @returns {HRESULT} 
     */
    Step(dwFrames, pStepObject) {
        result := ComCall(3, this, "uint", dwFrames, "ptr", pStepObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bMultiple 
     * @param {Pointer<IUnknown>} pStepObject 
     * @returns {HRESULT} 
     */
    CanStep(bMultiple, pStepObject) {
        result := ComCall(4, this, "int", bMultiple, "ptr", pStepObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelStep() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
