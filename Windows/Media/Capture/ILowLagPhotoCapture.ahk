#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\CapturedPhoto.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ILowLagPhotoCapture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLagPhotoCapture
     * @type {Guid}
     */
    static IID => Guid("{a37251b7-6b44-473d-8f24-f703d6c0ec44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CaptureAsync", "FinishAsync"]

    /**
     * 
     * @returns {IAsyncOperation<CapturedPhoto>} 
     */
    CaptureAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CapturedPhoto, operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    FinishAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
