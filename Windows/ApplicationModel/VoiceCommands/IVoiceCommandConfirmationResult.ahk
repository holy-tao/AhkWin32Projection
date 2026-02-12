#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandConfirmationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandConfirmationResult
     * @type {Guid}
     */
    static IID => Guid("{a022593e-8221-4526-b083-840972262247}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Confirmed"]

    /**
     * @type {Boolean} 
     */
    Confirmed {
        get => this.get_Confirmed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Confirmed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
