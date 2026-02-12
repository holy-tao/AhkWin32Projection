#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SocketActivityContext.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ISocketActivityContextFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocketActivityContextFactory
     * @type {Guid}
     */
    static IID => Guid("{b99fc3c3-088c-4388-83ae-2525138e049a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {IBuffer} data 
     * @returns {SocketActivityContext} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(data) {
        result := ComCall(6, this, "ptr", data, "ptr*", &context_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocketActivityContext(context_)
    }
}
