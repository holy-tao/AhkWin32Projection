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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMute", "GetMute"]

    /**
     * 
     * @param {Integer} bMuted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammute-setmute
     */
    SetMute(bMuted) {
        result := ComCall(3, this, "char", bMuted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbMuted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointoffloadstreammute-getmute
     */
    GetMute(pbMuted) {
        pbMutedMarshal := pbMuted is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbMutedMarshal, pbMuted, "HRESULT")
        return result
    }
}
