#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ChatMessageTransportConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageTransport2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageTransport2
     * @type {Guid}
     */
    static IID => Guid("{90a75622-d84a-4c22-a94d-544444edc8a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "get_TransportKind"]

    /**
     * @type {ChatMessageTransportConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {Integer} 
     */
    TransportKind {
        get => this.get_TransportKind()
    }

    /**
     * 
     * @returns {ChatMessageTransportConfiguration} 
     */
    get_Configuration() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageTransportConfiguration(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportKind() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
