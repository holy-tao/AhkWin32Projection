#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppMemoryUsageLimitChangingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppMemoryUsageLimitChangingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{79f86664-feca-4da5-9e40-2bc63efdc979}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldLimit", "get_NewLimit"]

    /**
     * @type {Integer} 
     */
    OldLimit {
        get => this.get_OldLimit()
    }

    /**
     * @type {Integer} 
     */
    NewLimit {
        get => this.get_NewLimit()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldLimit() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewLimit() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
