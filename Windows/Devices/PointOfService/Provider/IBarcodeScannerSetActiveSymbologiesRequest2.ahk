#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerSetActiveSymbologiesRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerSetActiveSymbologiesRequest2
     * @type {Guid}
     */
    static IID => Guid("{f5ff6edf-fa9a-4749-b11b-e8fccb75bc6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportFailedWithFailedReasonAsync", "ReportFailedWithFailedReasonAndDescriptionAsync"]

    /**
     * 
     * @param {Integer} reason 
     * @returns {IAsyncAction} 
     */
    ReportFailedWithFailedReasonAsync(reason) {
        result := ComCall(6, this, "int", reason, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Integer} reason 
     * @param {HSTRING} failedReasonDescription 
     * @returns {IAsyncAction} 
     */
    ReportFailedWithFailedReasonAndDescriptionAsync(reason, failedReasonDescription) {
        if(failedReasonDescription is String) {
            pin := HSTRING.Create(failedReasonDescription)
            failedReasonDescription := pin.Value
        }
        failedReasonDescription := failedReasonDescription is Win32Handle ? NumGet(failedReasonDescription, "ptr") : failedReasonDescription

        result := ComCall(7, this, "int", reason, "ptr", failedReasonDescription, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
