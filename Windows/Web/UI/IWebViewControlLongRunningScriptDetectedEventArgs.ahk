#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControlLongRunningScriptDetectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlLongRunningScriptDetectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2a6e5bba-98b4-45bc-bbeb-0f69ce49c599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExecutionTime", "get_StopPageScriptExecution", "put_StopPageScriptExecution"]

    /**
     * @type {TimeSpan} 
     */
    ExecutionTime {
        get => this.get_ExecutionTime()
    }

    /**
     * @type {Boolean} 
     */
    StopPageScriptExecution {
        get => this.get_StopPageScriptExecution()
        set => this.put_StopPageScriptExecution(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ExecutionTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StopPageScriptExecution() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StopPageScriptExecution(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
