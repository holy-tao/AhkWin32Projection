#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MediaCapturePauseResult.ahk
#Include .\MediaCaptureStopResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ILowLagMediaRecording3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLagMediaRecording3
     * @type {Guid}
     */
    static IID => Guid("{5c33ab12-48f7-47da-b41e-90880a5fe0ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PauseWithResultAsync", "StopWithResultAsync"]

    /**
     * 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<MediaCapturePauseResult>} 
     */
    PauseWithResultAsync(behavior) {
        result := ComCall(6, this, "int", behavior, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaCapturePauseResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<MediaCaptureStopResult>} 
     */
    StopWithResultAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaCaptureStopResult, operation)
    }
}
