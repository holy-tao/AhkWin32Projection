#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemSessionParticipant.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionValueSetReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionValueSetReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{06f31785-2da5-4e58-a78f-9e8d0784ee25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Sender", "get_Message"]

    /**
     * @type {RemoteSystemSessionParticipant} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * 
     * @returns {RemoteSystemSessionParticipant} 
     */
    get_Sender() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemSessionParticipant(value)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Message() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }
}
