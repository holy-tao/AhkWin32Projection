#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpNamedPipeConnectionServer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpNamedPipeConnectionServer
     * @type {Guid}
     */
    static IID => Guid("{52bbbdea-3858-5e4c-91d2-86deebf8ecd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect"]

    /**
     * Represents a connection between two shapes in a drawing, such as a line and a box in an organization chart.
     * @param {McpServerContext} hostContext 
     * @param {HSTRING} pipeName 
     * @param {McpNamedPipeConnectionResult} connectionResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/connect-element-connects_type-complextypevisio-xml
     */
    Connect(hostContext, pipeName, connectionResult) {
        if(pipeName is String) {
            pin := HSTRING.Create(pipeName)
            pipeName := pin.Value
        }
        pipeName := pipeName is Win32Handle ? NumGet(pipeName, "ptr") : pipeName

        result := ComCall(6, this, "ptr", hostContext, "ptr", pipeName, "ptr", connectionResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
