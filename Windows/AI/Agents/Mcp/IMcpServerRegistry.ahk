#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\McpStdioConnectionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpServerRegistry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpServerRegistry
     * @type {Guid}
     */
    static IID => Guid("{fece06c6-0aa5-4bd1-8e64-fbc5f328f5dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMcpServerInfos", "GetMcpConnectionInfo"]

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetMcpServerInfos(result_) {
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} mcpServerId 
     * @param {WindowId} ownerWindowId 
     * @returns {McpStdioConnectionInfo} 
     */
    GetMcpConnectionInfo(mcpServerId, ownerWindowId) {
        ownerWindowId := ownerWindowId is Win32Handle ? NumGet(ownerWindowId, "ptr") : ownerWindowId

        result := ComCall(7, this, "ptr", mcpServerId, "ptr", ownerWindowId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return McpStdioConnectionInfo(result_)
    }
}
