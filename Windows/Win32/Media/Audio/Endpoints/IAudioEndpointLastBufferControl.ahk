#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality to allow an offload stream client to notify the endpoint that the last buffer has been sent only partially filled.
 * @remarks
 * 
 * This is an optional interface on an endpoint.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioendpointlastbuffercontrol
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointLastBufferControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointLastBufferControl
     * @type {Guid}
     */
    static IID => Guid("{f8520dd3-8f9d-4437-9861-62f584c33dd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsLastBufferControlSupported", "ReleaseOutputDataPointerForLastBuffer"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointlastbuffercontrol-islastbuffercontrolsupported
     */
    IsLastBufferControlSupported() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pConnectionProperty 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointlastbuffercontrol-releaseoutputdatapointerforlastbuffer
     */
    ReleaseOutputDataPointerForLastBuffer(pConnectionProperty) {
        ComCall(4, this, "ptr", pConnectionProperty)
    }
}
