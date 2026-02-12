#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketListener3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketListener3
     * @type {Guid}
     */
    static IID => Guid("{4798201c-bdf8-4919-8542-28d450e74507}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CancelIOAsync", "EnableTransferOwnership", "EnableTransferOwnershipWithConnectedStandbyAction", "TransferOwnership", "TransferOwnershipWithContext"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CancelIOAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {Guid} taskId 
     * @returns {HRESULT} 
     */
    EnableTransferOwnership(taskId) {
        result := ComCall(7, this, "ptr", taskId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} taskId 
     * @param {Integer} connectedStandbyAction 
     * @returns {HRESULT} 
     */
    EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction) {
        result := ComCall(8, this, "ptr", taskId, "int", connectedStandbyAction, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} socketId 
     * @returns {HRESULT} 
     */
    TransferOwnership(socketId) {
        if(socketId is String) {
            pin := HSTRING.Create(socketId)
            socketId := pin.Value
        }
        socketId := socketId is Win32Handle ? NumGet(socketId, "ptr") : socketId

        result := ComCall(9, this, "ptr", socketId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} socketId 
     * @param {SocketActivityContext} data 
     * @returns {HRESULT} 
     */
    TransferOwnershipWithContext(socketId, data) {
        if(socketId is String) {
            pin := HSTRING.Create(socketId)
            socketId := pin.Value
        }
        socketId := socketId is Win32Handle ? NumGet(socketId, "ptr") : socketId

        result := ComCall(10, this, "ptr", socketId, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
