#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class IMcpServerContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcpServerContext
     * @type {Guid}
     */
    static IID => Guid("{d92a55b5-5c54-5505-960a-8a1a15180e8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppId", "RequestResourceAccess"]

    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Uri} resource 
     * @param {HSTRING} description 
     * @param {HSTRING} reasonForAsking 
     * @returns {Integer} 
     */
    RequestResourceAccess(resource, description, reasonForAsking) {
        if(description is String) {
            pin := HSTRING.Create(description)
            description := pin.Value
        }
        description := description is Win32Handle ? NumGet(description, "ptr") : description
        if(reasonForAsking is String) {
            pin := HSTRING.Create(reasonForAsking)
            reasonForAsking := pin.Value
        }
        reasonForAsking := reasonForAsking is Win32Handle ? NumGet(reasonForAsking, "ptr") : reasonForAsking

        result := ComCall(7, this, "ptr", resource, "ptr", description, "ptr", reasonForAsking, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
