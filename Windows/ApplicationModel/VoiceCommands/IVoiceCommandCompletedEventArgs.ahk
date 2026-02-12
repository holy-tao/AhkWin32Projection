#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c85e675d-fe42-432c-9907-09df9fcf64e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reason"]

    /**
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
