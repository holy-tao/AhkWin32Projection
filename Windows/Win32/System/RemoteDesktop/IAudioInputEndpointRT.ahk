#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the input buffer for each processing pass.
 * @remarks
 * 
  * <b>IAudioInputEndpointRT</b> methods can be called 
  *      from a real-time processing thread. The implementation of the methods of this interface must not block, access 
  *      paged memory, or call any blocking system routines.
  * 
  * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
  *     applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioengineendpoint/nn-audioengineendpoint-iaudioinputendpointrt
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioInputEndpointRT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioInputEndpointRT
     * @type {Guid}
     */
    static IID => Guid("{8026ab61-92b2-43c1-a1df-5c37ebd08d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInputDataPointer", "ReleaseInputDataPointer", "PulseEndpoint"]

    /**
     * 
     * @param {Pointer<APO_CONNECTION_PROPERTY>} pConnectionProperty 
     * @param {Pointer<AE_CURRENT_POSITION>} pAeTimeStamp 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-getinputdatapointer
     */
    GetInputDataPointer(pConnectionProperty, pAeTimeStamp) {
        ComCall(3, this, "ptr", pConnectionProperty, "ptr", pAeTimeStamp)
    }

    /**
     * 
     * @param {Integer} u32FrameCount 
     * @param {Pointer} pDataPointer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-releaseinputdatapointer
     */
    ReleaseInputDataPointer(u32FrameCount, pDataPointer) {
        ComCall(4, this, "uint", u32FrameCount, "ptr", pDataPointer)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioinputendpointrt-pulseendpoint
     */
    PulseEndpoint() {
        ComCall(5, this)
    }
}
