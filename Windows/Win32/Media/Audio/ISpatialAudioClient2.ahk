#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioClient.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioClient2 extends ISpatialAudioClient{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioClient2
     * @type {Guid}
     */
    static IID => Guid("{caabe452-a66a-4bee-a93e-e320463f6a53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsOffloadCapable", "GetMaxFrameCountForCategory"]

    /**
     * 
     * @param {Integer} category 
     * @param {Pointer<BOOL>} isOffloadCapable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient2-isoffloadcapable
     */
    IsOffloadCapable(category, isOffloadCapable) {
        result := ComCall(11, this, "int", category, "ptr", isOffloadCapable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {BOOL} offloadEnabled 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @param {Pointer<Integer>} frameCountPerBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioclient2-getmaxframecountforcategory
     */
    GetMaxFrameCountForCategory(category, offloadEnabled, objectFormat, frameCountPerBuffer) {
        frameCountPerBufferMarshal := frameCountPerBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", category, "int", offloadEnabled, "ptr", objectFormat, frameCountPerBufferMarshal, frameCountPerBuffer, "HRESULT")
        return result
    }
}
