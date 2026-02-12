#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\IStorageItem.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryChange extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryChange
     * @type {Guid}
     */
    static IID => Guid("{00980b23-2be2-4909-aa48-159f5203a51e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeType", "get_Path", "get_PreviousPath", "IsOfType", "GetStorageItemAsync"]

    /**
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {HSTRING} 
     */
    PreviousPath {
        get => this.get_PreviousPath()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
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
    get_PreviousPath() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {Boolean} 
     */
    IsOfType(type) {
        result := ComCall(9, this, "uint", type, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<IStorageItem>} 
     */
    GetStorageItemAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IStorageItem, operation)
    }
}
