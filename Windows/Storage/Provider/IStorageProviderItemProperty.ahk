#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to storage provider item properties from the sync root.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideritempropertysource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderItemProperty extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderItemProperty
     * @type {Guid}
     */
    static IID => Guid("{476cb558-730b-4188-b7b5-63b716ed476d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Id", "get_Id", "put_Value", "get_Value", "put_IconResource", "get_IconResource"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
        set => this.put_IconResource(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_Value(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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
    put_IconResource(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
