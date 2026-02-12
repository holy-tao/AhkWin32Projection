#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Controls the stream state of an endpoint.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nn-audioengineendpoint-iaudioendpointcontrol
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IAudioEndpointControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointControl
     * @type {Guid}
     */
    static IID => Guid("{c684b72a-6df4-4774-bdf9-76b77509b653}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Reset", "Stop"]

    /**
     * Starts the endpoint stream.
     * @remarks
     * The implementation of this method can differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-start
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the endpoint stream.
     * @remarks
     * <b>Reset</b> discards all data that has not been processed yet.
     *     The implementation of this method may differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-reset
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops the endpoint stream.
     * @remarks
     * The implementation of this method can differ depending on the type of device that the endpoint represents.
     * 
     * This method must not be called from a real-time processing thread.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineendpoint/nf-audioengineendpoint-iaudioendpointcontrol-stop
     */
    Stop() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
