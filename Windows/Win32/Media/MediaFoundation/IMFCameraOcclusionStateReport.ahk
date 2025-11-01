#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateReport extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOcclusionState"]

    /**
     * 
     * @param {Pointer<Integer>} occlusionState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereport-getocclusionstate
     */
    GetOcclusionState(occlusionState) {
        occlusionStateMarshal := occlusionState is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, occlusionStateMarshal, occlusionState, "HRESULT")
        return result
    }
}
