#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointOffloadStreamMute interface allows a client to manipulate the mute status of the offloaded audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpointoffloadstreammute
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointOffloadStreamMute extends IUnknown{
    /**
     * The interface identifier for IAudioEndpointOffloadStreamMute
     * @type {Guid}
     */
    static IID => Guid("{dfe21355-5ec2-40e0-8d6b-710ac3c00249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} bMuted 
     * @returns {HRESULT} 
     */
    SetMute(bMuted) {
        result := ComCall(3, this, "char", bMuted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbMuted 
     * @returns {HRESULT} 
     */
    GetMute(pbMuted) {
        result := ComCall(4, this, "char*", pbMuted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
