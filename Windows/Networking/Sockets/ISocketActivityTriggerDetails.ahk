#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SocketActivityInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ISocketActivityTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocketActivityTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{45f406a7-fc9f-4f81-acad-355fef51e67b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reason", "get_SocketInformation"]

    /**
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * @type {SocketActivityInformation} 
     */
    SocketInformation {
        get => this.get_SocketInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SocketActivityInformation} 
     */
    get_SocketInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocketActivityInformation(value)
    }
}
