#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectMusicBuffer.ahk
#Include .\IDirectMusicPort.ahk
#Include ..\..\IReferenceClock.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDirectMusicSynth interface is used by DirectMusic to communicate with user-mode synthesizers.
 * @see https://learn.microsoft.com/windows/win32/api/dmusics/nn-dmusics-idirectmusicsynth
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusic extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusic
     * @type {Guid}
     */
    static IID => Guid("{6536115a-7b2d-11d2-ba18-0000f875ac12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumPort", "CreateMusicBuffer", "CreatePort", "EnumMasterClock", "GetMasterClock", "SetMasterClock", "Activate", "GetDefaultPort", "SetDirectSound"]

    /**
     * The EnumPorts function enumerates the ports that are available for printing on a specified server.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The **EnumPorts** function can succeed even if the server specified by *pName* does not have a printer defined.
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_PORTCAPS>} pPortCaps 
     * @returns {HRESULT} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
     */
    EnumPort(dwIndex, pPortCaps) {
        result := ComCall(3, this, "uint", dwIndex, "ptr", pPortCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_BUFFERDESC>} pBufferDesc 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectMusicBuffer} 
     */
    CreateMusicBuffer(pBufferDesc, pUnkOuter) {
        result := ComCall(4, this, "ptr", pBufferDesc, "ptr*", &ppBuffer := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectMusicBuffer(ppBuffer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidPort 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @param {IUnknown} pUnkOuter 
     * @returns {IDirectMusicPort} 
     */
    CreatePort(rclsidPort, pPortParams, pUnkOuter) {
        result := ComCall(5, this, "ptr", rclsidPort, "ptr", pPortParams, "ptr*", &ppPort := 0, "ptr", pUnkOuter, "HRESULT")
        return IDirectMusicPort(ppPort)
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_CLOCKINFO8>} lpClockInfo 
     * @returns {HRESULT} 
     */
    EnumMasterClock(dwIndex, lpClockInfo) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", lpClockInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClock 
     * @returns {IReferenceClock} 
     */
    GetMasterClock(pguidClock) {
        result := ComCall(7, this, "ptr", pguidClock, "ptr*", &ppReferenceClock := 0, "HRESULT")
        return IReferenceClock(ppReferenceClock)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(rguidClock) {
        result := ComCall(8, this, "ptr", rguidClock, "HRESULT")
        return result
    }

    /**
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @param {BOOL} fEnable 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-activateactctx
     */
    Activate(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPort 
     * @returns {HRESULT} 
     */
    GetDefaultPort(pguidPort) {
        result := ComCall(10, this, "ptr", pguidPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectSound} pDirectSound 
     * @param {HWND} _hWnd 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, _hWnd) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(11, this, "ptr", pDirectSound, "ptr", _hWnd, "HRESULT")
        return result
    }
}
