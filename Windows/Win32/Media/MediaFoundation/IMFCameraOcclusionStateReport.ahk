#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateReport extends IUnknown{
    /**
     * The interface identifier for IMFCameraOcclusionStateReport
     * @type {Guid}
     */
    static IID => Guid("{1640b2cf-74da-4462-a43b-b76d3bdc1434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} occlusionState 
     * @returns {HRESULT} 
     */
    GetOcclusionState(occlusionState) {
        result := ComCall(3, this, "uint*", occlusionState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
