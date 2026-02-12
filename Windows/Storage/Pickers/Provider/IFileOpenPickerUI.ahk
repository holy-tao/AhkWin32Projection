#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class IFileOpenPickerUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPickerUI
     * @type {Guid}
     */
    static IID => Guid("{dda45a10-f9d4-40c4-8af5-c5b6b5a61d1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFile", "RemoveFile", "ContainsFile", "CanAddFile", "get_AllowedFileTypes", "get_SelectionMode", "get_SettingsIdentifier", "get_Title", "put_Title", "add_FileRemoved", "remove_FileRemoved", "add_Closing", "remove_Closing"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    AllowedFileTypes {
        get => this.get_AllowedFileTypes()
    }

    /**
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
    }

    /**
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {IStorageFile} file_ 
     * @returns {Integer} 
     */
    AddFile(id, file_) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr", file_, "int*", &addResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return addResult
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {HRESULT} 
     */
    RemoveFile(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {Boolean} 
     */
    ContainsFile(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "int*", &isContained := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isContained
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {Boolean} 
     */
    CanAddFile(file_) {
        result := ComCall(9, this, "ptr", file_, "int*", &canAdd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return canAdd
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AllowedFileTypes() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<FileOpenPickerUI, FileRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileRemoved(handler) {
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
    remove_FileRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<FileOpenPickerUI, PickerClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
