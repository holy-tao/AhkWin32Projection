#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the activity of a process associated with a sensor.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorprocessactivity
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorProcessActivity extends IUnknown{
    /**
     * The interface identifier for IMFSensorProcessActivity
     * @type {Guid}
     */
    static IID => Guid("{39dc7f4a-b141-4719-813c-a7f46162a2b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Retrieves the process identifier of the specified process.
     * @param {Pointer<UInt32>} pPID 
     * @returns {HRESULT} If the function succeeds, the return value is the process identifier.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessid
     */
    GetProcessId(pPID) {
        result := ComCall(3, this, "uint*", pPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfStreaming 
     * @returns {HRESULT} 
     */
    GetStreamingState(pfStreaming) {
        result := ComCall(4, this, "ptr", pfStreaming, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMode 
     * @returns {HRESULT} 
     */
    GetStreamingMode(pMode) {
        result := ComCall(5, this, "int*", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pft 
     * @returns {HRESULT} 
     */
    GetReportTime(pft) {
        result := ComCall(6, this, "ptr", pft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
