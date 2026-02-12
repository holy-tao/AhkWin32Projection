#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the methods necessary for a custom HID (Human Interface Device) controller interface.
 * @remarks
 * This interface must be implemented by a HID custom controller class to receive input reports from the underlying HID device. No parsing or modifications are done on these reports; they are retrieved in their original format.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.ihidgamecontrollerinputsink
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IHidGameControllerInputSink extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHidGameControllerInputSink
     * @type {Guid}
     */
    static IID => Guid("{f754c322-182d-40e4-a126-fcee4ffa1e31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInputReportReceived"]

    /**
     * Event raised when input is received.
     * @param {Integer} timestamp_ Timestamp of the event.
     * @param {Integer} reportId The ID of the report.
     * @param {Integer} reportBuffer_length 
     * @param {Pointer<Integer>} reportBuffer Buffer containing the received input.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.ihidgamecontrollerinputsink.oninputreportreceived
     */
    OnInputReportReceived(timestamp_, reportId, reportBuffer_length, reportBuffer) {
        reportBufferMarshal := reportBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", timestamp_, "char", reportId, "uint", reportBuffer_length, reportBufferMarshal, reportBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
