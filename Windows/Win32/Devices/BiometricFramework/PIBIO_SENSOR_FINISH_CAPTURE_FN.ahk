#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PIBIO_SENSOR_FINISH_CAPTURE_FN callback (winbio_adapter.h) retrieves a value that indicates whether the sensor indicator is on or off.
 * @remarks
 * The Windows Biometric Framework calls this function after it successfully calls <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_start_capture_fn">SensorAdapterStartCapture</a> or it calls <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_cancel_fn">SensorAdapterCancel</a>. It does not call this function if the call to <i>SensorAdapterStartCapture</i> fails.
 * 
 * When your implementation of this function  returns, the data in the pipeline should be ready for subsequent calls to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_push_data_to_engine_fn">SensorAdapterPushDataToEngine</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_sensor_export_sensor_data_fn">SensorAdapterExportSensorData</a>.
 * 
 * This is a blocking function that should return only after the sensor I/O operation has succeeded, failed, or been canceled. Typically, you will make this function block by passing the <b>OVERLAPPED</b> structure in the sensor adapter context to the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. The <b>hEvent</b> handle in the <b>OVERLAPPED</b> structure must be signaled when <i>SensorAdapterFinishCapture</i> returns. The <i>GetOverlappedResult</i> function sets this handle automatically when it detects the end of a sensor I/O operation. If your adapter uses some other mechanism to detect I/O completion, you must signal the event yourself.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_sensor_finish_capture_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_SENSOR_FINISH_CAPTURE_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline) {
        result := ComCall(3, this, "ptr", Pipeline, "uint*", &RejectDetail := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RejectDetail
    }
}
