#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CorePhysicalKeyStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IKeyEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5ff5e930-2544-4a17-bd78-1f2fdebb106b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VirtualKey", "get_KeyStatus"]

    /**
     * @type {Integer} 
     */
    VirtualKey {
        get => this.get_VirtualKey()
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
    get_VirtualKey() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
