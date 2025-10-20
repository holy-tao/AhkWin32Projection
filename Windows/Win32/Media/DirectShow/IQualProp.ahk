#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQualProp interface provides methods for retrieving performance information from video renderers.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-iqualprop
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQualProp extends IUnknown{
    /**
     * The interface identifier for IQualProp
     * @type {Guid}
     */
    static IID => Guid("{1bd0ecb0-f8e2-11ce-aac6-0020af0b99a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pcFrames 
     * @returns {HRESULT} 
     */
    get_FramesDroppedInRenderer(pcFrames) {
        result := ComCall(3, this, "int*", pcFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcFramesDrawn 
     * @returns {HRESULT} 
     */
    get_FramesDrawn(pcFramesDrawn) {
        result := ComCall(4, this, "int*", pcFramesDrawn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piAvgFrameRate 
     * @returns {HRESULT} 
     */
    get_AvgFrameRate(piAvgFrameRate) {
        result := ComCall(5, this, "int*", piAvgFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iJitter 
     * @returns {HRESULT} 
     */
    get_Jitter(iJitter) {
        result := ComCall(6, this, "int*", iJitter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piAvg 
     * @returns {HRESULT} 
     */
    get_AvgSyncOffset(piAvg) {
        result := ComCall(7, this, "int*", piAvg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piDev 
     * @returns {HRESULT} 
     */
    get_DevSyncOffset(piDev) {
        result := ComCall(8, this, "int*", piDev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
