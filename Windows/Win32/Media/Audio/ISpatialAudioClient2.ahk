#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpatialAudioClient.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISpatialAudioClient2 extends ISpatialAudioClient{
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
     * 
     * @param {Integer} category 
     * @param {Pointer<BOOL>} isOffloadCapable 
     * @returns {HRESULT} 
     */
    IsOffloadCapable(category, isOffloadCapable) {
        result := ComCall(11, this, "int", category, "ptr", isOffloadCapable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @param {BOOL} offloadEnabled 
     * @param {Pointer<WAVEFORMATEX>} objectFormat 
     * @param {Pointer<UInt32>} frameCountPerBuffer 
     * @returns {HRESULT} 
     */
    GetMaxFrameCountForCategory(category, offloadEnabled, objectFormat, frameCountPerBuffer) {
        result := ComCall(12, this, "int", category, "int", offloadEnabled, "ptr", objectFormat, "uint*", frameCountPerBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
