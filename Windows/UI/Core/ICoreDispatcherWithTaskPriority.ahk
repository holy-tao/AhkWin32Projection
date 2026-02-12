#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDispatcherWithTaskPriority extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDispatcherWithTaskPriority
     * @type {Guid}
     */
    static IID => Guid("{bafaecad-484d-41be-ba80-1d58c65263ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentPriority", "put_CurrentPriority", "ShouldYield", "ShouldYieldToPriority", "StopProcessEvents"]

    /**
     * @type {Integer} 
     */
    CurrentPriority {
        get => this.get_CurrentPriority()
        set => this.put_CurrentPriority(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPriority() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CurrentPriority(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    ShouldYield() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} priority_ 
     * @returns {Boolean} 
     */
    ShouldYieldToPriority(priority_) {
        result := ComCall(9, this, "int", priority_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopProcessEvents() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
