#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CorePhysicalKeyStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICharacterReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICharacterReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c584659f-99b2-4bcc-bd33-04e63f42902e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyCode", "get_KeyStatus"]

    /**
     * @type {Integer} 
     */
    KeyCode {
        get => this.get_KeyCode()
    }

    /**
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyCode() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        value := CorePhysicalKeyStatus()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
