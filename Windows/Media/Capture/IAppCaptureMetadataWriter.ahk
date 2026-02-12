#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureMetadataWriter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureMetadataWriter
     * @type {Guid}
     */
    static IID => Guid("{e0ce4877-9aaf-46b4-ad31-6a60b441c780}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddStringEvent", "AddInt32Event", "AddDoubleEvent", "StartStringState", "StartInt32State", "StartDoubleState", "StopState", "StopAllStates", "get_RemainingStorageBytesAvailable", "add_MetadataPurged", "remove_MetadataPurged"]

    /**
     * @type {Integer} 
     */
    RemainingStorageBytesAvailable {
        get => this.get_RemainingStorageBytesAvailable()
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    AddStringEvent(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", name, "ptr", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    AddInt32Event(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "int", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    AddDoubleEvent(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "double", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    StartStringState(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", name, "ptr", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    StartInt32State(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "int", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} priority_ 
     * @returns {HRESULT} 
     */
    StartDoubleState(name, value, priority_) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "double", value, "int", priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    StopState(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(12, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopAllStates() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemainingStorageBytesAvailable() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureMetadataWriter, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MetadataPurged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MetadataPurged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
