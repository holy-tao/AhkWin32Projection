#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Compares two durations.
 * @remarks
 * If the function cannot compare the specified durations, it should return <b>WS_E_INVALID_FORMAT</b>. 
 *             (See <a href="https://docs.microsoft.com/windows/desktop/wsw/windows-web-services-return-values">Windows Web Services Return Values</a>.)
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_duration_comparison_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DURATION_COMPARISON_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WS_DURATION>} duration1 
     * @param {Pointer<WS_DURATION>} duration2 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(duration1, duration2, error) {
        result := ComCall(3, this, "ptr", duration1, "ptr", duration2, "int*", &result_ := 0, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
