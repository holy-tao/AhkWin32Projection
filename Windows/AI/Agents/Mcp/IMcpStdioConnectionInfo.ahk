#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\McpServerInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpStdioConnectionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpStdioConnectionInfo
     * @type {Guid}
     */
    static IID => Guid("{fbc54aac-590b-526c-a545-b7c731b18c39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Command", "GetCommandArguments", "get_Info"]

    /**
     * @type {HSTRING} 
     */
    Command {
        get => this.get_Command()
    }

    /**
     * @type {McpServerInfo} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Command() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetCommandArguments(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {McpServerInfo} 
     */
    get_Info() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return McpServerInfo(value)
    }
}
