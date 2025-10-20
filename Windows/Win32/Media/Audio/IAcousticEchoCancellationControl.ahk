#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAcousticEchoCancellationControl extends IUnknown{
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
     * 
     * @param {PWSTR} endpointId 
     * @returns {HRESULT} 
     */
    SetEchoCancellationRenderEndpoint(endpointId) {
        endpointId := endpointId is String ? StrPtr(endpointId) : endpointId

        result := ComCall(3, this, "ptr", endpointId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
