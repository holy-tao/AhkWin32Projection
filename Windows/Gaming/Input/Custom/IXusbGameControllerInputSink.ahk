#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the methods necessary for a custom Xusb controller interface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.ixusbgamecontrollerinputsink
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IXusbGameControllerInputSink extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXusbGameControllerInputSink
     * @type {Guid}
     */
    static IID => Guid("{b2ac1d95-6ecb-42b3-8aab-025401ca4712}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInputReceived"]

    /**
     * Event raised when input is received.
     * @param {Integer} timestamp_ Timestamp of the event.
     * @param {Integer} reportId ID of the report.
     * @param {Integer} inputBuffer_length 
     * @param {Pointer<Integer>} inputBuffer Buffer containing the received input.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.ixusbgamecontrollerinputsink.oninputreceived
     */
    OnInputReceived(timestamp_, reportId, inputBuffer_length, inputBuffer) {
        inputBufferMarshal := inputBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", timestamp_, "char", reportId, "uint", inputBuffer_length, inputBufferMarshal, inputBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
