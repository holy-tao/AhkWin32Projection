#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ITracingStatusChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITracingStatusChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{410b7711-ff3b-477f-9c9a-d2efda302dc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Enabled", "get_TraceLevel"]

    /**
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * @type {Integer} 
     */
    TraceLevel {
        get => this.get_TraceLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        result := ComCall(6, this, "int*", &enabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return enabled
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TraceLevel() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
