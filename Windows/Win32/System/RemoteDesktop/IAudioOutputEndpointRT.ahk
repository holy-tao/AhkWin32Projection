#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the output buffer for each processing pass.
 * @remarks
 * 
  * <b>IAudioOutputEndpointRT</b> methods can be called 
  *      from a real-time processing thread. The implementation of the methods of this interface must not block, access 
  *      paged memory, or call any blocking system routines.
  * 
  * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
  *     applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudiooutputendpointrt
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioOutputEndpointRT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioOutputEndpointRT
     * @type {Guid}
     */
    static IID => Guid("{8fa906e4-c31c-4e31-932e-19a66385e9aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputDataPointer", "ReleaseOutputDataPointer", "PulseEndpoint"]

    /**
     * 
     * @param {Integer} u32FrameCount 
     * @param {Pointer<AE_CURRENT_POSITION>} pAeTimeStamp 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiooutputendpointrt-getoutputdatapointer
     */
    GetOutputDataPointer(u32FrameCount, pAeTimeStamp) {
        result := ComCall(3, this, "uint", u32FrameCount, "ptr", pAeTimeStamp, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pConnectionProperty 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiooutputendpointrt-releaseoutputdatapointer
     */
    ReleaseOutputDataPointer(pConnectionProperty) {
        ComCall(4, this, "ptr", pConnectionProperty)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudiooutputendpointrt-pulseendpoint
     */
    PulseEndpoint() {
        ComCall(5, this)
    }
}
