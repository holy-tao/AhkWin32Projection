#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowResizeManagerLayoutCapability extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowResizeManagerLayoutCapability
     * @type {Guid}
     */
    static IID => Guid("{bb74f27b-a544-4301-80e6-0ae033ef4536}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ShouldWaitForLayoutCompletion", "get_ShouldWaitForLayoutCompletion"]

    /**
     * @type {Boolean} 
     */
    ShouldWaitForLayoutCompletion {
        get => this.get_ShouldWaitForLayoutCompletion()
        set => this.put_ShouldWaitForLayoutCompletion(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldWaitForLayoutCompletion(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldWaitForLayoutCompletion() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
