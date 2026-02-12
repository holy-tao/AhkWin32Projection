#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class IGameChatMessageReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameChatMessageReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a28201f1-3fb9-4e42-a403-7afce2023b1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppId", "get_AppDisplayName", "get_SenderName", "get_Message", "get_Origin"]

    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * @type {HSTRING} 
     */
    AppDisplayName {
        get => this.get_AppDisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    SenderName {
        get => this.get_SenderName()
    }

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {Integer} 
     */
    Origin {
        get => this.get_Origin()
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
     * @returns {HSTRING} 
     */
    get_AppDisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SenderName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Origin() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
