#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAudioSessionControl.ahk

/**
 * The IAudioSessionControl2 interface can be used by a client to get information about the audio session.
 * @remarks
 * 
  * This interface supports  custom implementations for <i>stream attenuation</i> or <i>ducking</i>, a new feature in Windows 7. An application playing a media stream can make it behave differently when a new communication stream is opened on the default communication device. For example, the original media stream can be paused while the new communication stream is open. For more information about this feature, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/stream-attenuation">Default Ducking Experience</a>. 
  * 
  * An application can use this interface to perform the following tasks:
  * 
  * <ul>
  * <li>Specify that it wants to opt out of the default stream attenuation experience provided by the system.</li>
  * <li>Get the audio session identifier that is associated with the stream. The identifier is required during the notification registration. The application can register itself to receive ducking notifications from the system.</li>
  * <li>Check whether the stream associated with the audio session  is a system sound.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessioncontrol2
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionControl2 extends IAudioSessionControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionControl2
     * @type {Guid}
     */
    static IID => Guid("{bfb7ff88-7239-4fc9-8fa2-07c950be9c6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSessionIdentifier", "GetSessionInstanceIdentifier", "GetProcessId", "IsSystemSoundsSession", "SetDuckingPreference"]

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessionidentifier
     */
    GetSessionIdentifier(pRetVal) {
        result := ComCall(12, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-getsessioninstanceidentifier
     */
    GetSessionInstanceIdentifier(pRetVal) {
        result := ComCall(13, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * Retrieves the process identifier of the specified process.
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} If the function succeeds, the return value is the process identifier.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessid
     */
    GetProcessId(pRetVal) {
        result := ComCall(14, this, "uint*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-issystemsoundssession
     */
    IsSystemSoundsSession() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} optOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol2-setduckingpreference
     */
    SetDuckingPreference(optOut) {
        result := ComCall(16, this, "int", optOut, "HRESULT")
        return result
    }
}
