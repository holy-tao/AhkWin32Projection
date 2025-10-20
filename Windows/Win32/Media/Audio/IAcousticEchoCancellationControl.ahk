#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-iacousticechocancellationcontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAcousticEchoCancellationControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcousticEchoCancellationControl
     * @type {Guid}
     */
    static IID => Guid("{f4ae25b5-aaa3-437d-b6b3-dbbe2d0e9549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEchoCancellationRenderEndpoint"]

    /**
     * 
     * @param {PWSTR} endpointId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iacousticechocancellationcontrol-setechocancellationrenderendpoint
     */
    SetEchoCancellationRenderEndpoint(endpointId) {
        endpointId := endpointId is String ? StrPtr(endpointId) : endpointId

        result := ComCall(3, this, "ptr", endpointId, "HRESULT")
        return result
    }
}
