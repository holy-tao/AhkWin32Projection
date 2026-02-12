#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\StorageFile.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileOpenPicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPicker
     * @type {Guid}
     */
    static IID => Guid("{2ca8278a-12c5-4c5f-8977-94547793c241}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewMode", "put_ViewMode", "get_SettingsIdentifier", "put_SettingsIdentifier", "get_SuggestedStartLocation", "put_SuggestedStartLocation", "get_CommitButtonText", "put_CommitButtonText", "get_FileTypeFilter", "PickSingleFileAsync", "PickMultipleFilesAsync"]

    /**
     * @type {Integer} 
     */
    ViewMode {
        get => this.get_ViewMode()
        set => this.put_ViewMode(value)
    }

    /**
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
        set => this.put_SettingsIdentifier(value)
    }

    /**
     * @type {Integer} 
     */
    SuggestedStartLocation {
        get => this.get_SuggestedStartLocation()
        set => this.put_SuggestedStartLocation(value)
    }

    /**
     * @type {HSTRING} 
     */
    CommitButtonText {
        get => this.get_CommitButtonText()
        set => this.put_CommitButtonText(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    FileTypeFilter {
        get => this.get_FileTypeFilter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_SettingsIdentifier(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedStartLocation() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SuggestedStartLocation(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommitButtonText() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_CommitButtonText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypeFilter() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    PickSingleFileAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     */
    PickMultipleFilesAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }
}
