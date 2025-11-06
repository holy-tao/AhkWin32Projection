#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IAudioSourceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSourceProvider
     * @type {Guid}
     */
    static IID => Guid("{ebbaf249-afc2-4582-91c6-b60df2e84954}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvideInput"]

    /**
     * 
     * @param {Integer} dwSampleCount 
     * @param {Pointer<Integer>} pdwChannelCount 
     * @returns {Float} 
     */
    ProvideInput(dwSampleCount, pdwChannelCount) {
        pdwChannelCountMarshal := pdwChannelCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwSampleCount, pdwChannelCountMarshal, pdwChannelCount, "float*", &pInterleavedAudioData := 0, "HRESULT")
        return pInterleavedAudioData
    }
}
