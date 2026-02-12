#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VoiceCommandServiceConnection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandServiceConnectionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandServiceConnectionStatics
     * @type {Guid}
     */
    static IID => Guid("{370ebffb-2d34-42df-8770-074d0f334697}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromAppServiceTriggerDetails"]

    /**
     * 
     * @param {AppServiceTriggerDetails} triggerDetails 
     * @returns {VoiceCommandServiceConnection} 
     */
    FromAppServiceTriggerDetails(triggerDetails) {
        result := ComCall(6, this, "ptr", triggerDetails, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VoiceCommandServiceConnection(value)
    }
}
