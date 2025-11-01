#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioObjectRenderStreamBase.ahk

/**
 * Provides methods for controlling an Hrtf spatial audio object render stream, including starting, stopping, and resetting the stream.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Many of the methods provided by this interface are implemented in the inherited <a href="https://docs.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreambase">ISpatialAudioObjectRenderStreamBase</a> interface.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiohrtf/nn-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioObjectRenderStreamForHrtf extends ISpatialAudioObjectRenderStreamBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamForHrtf
     * @type {Guid}
     */
    static IID => Guid("{e08deef9-5363-406e-9fdc-080ee247bbe0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateSpatialAudioObjectForHrtf"]

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<ISpatialAudioObjectForHrtf>} audioObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/nf-spatialaudiohrtf-ispatialaudioobjectrenderstreamforhrtf-activatespatialaudioobjectforhrtf
     */
    ActivateSpatialAudioObjectForHrtf(type, audioObject) {
        result := ComCall(10, this, "int", type, "ptr*", audioObject, "HRESULT")
        return result
    }
}
