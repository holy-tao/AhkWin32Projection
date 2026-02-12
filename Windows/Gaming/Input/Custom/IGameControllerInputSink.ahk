#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Base interface that defines the interfaces necessary to write a custom game controller class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerinputsink
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGameControllerInputSink extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerInputSink
     * @type {Guid}
     */
    static IID => Guid("{1ff6f922-c640-4c78-a820-9a715c558bcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInputResumed", "OnInputSuspended"]

    /**
     * Event raised when input for the controller is resumed.
     * @param {Integer} timestamp_ Timestamp for the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerinputsink.oninputresumed
     */
    OnInputResumed(timestamp_) {
        result := ComCall(6, this, "uint", timestamp_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Event raised when input for the controller is suspended.
     * @param {Integer} timestamp_ Timestamp of the event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.igamecontrollerinputsink.oninputsuspended
     */
    OnInputSuspended(timestamp_) {
        result := ComCall(7, this, "uint", timestamp_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
