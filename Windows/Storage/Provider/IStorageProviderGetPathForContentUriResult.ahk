#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderGetPathForContentUriResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderGetPathForContentUriResult
     * @type {Guid}
     */
    static IID => Guid("{63711a9d-4118-45a6-acb6-22c49d019f40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "put_Status", "get_Path", "put_Path"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
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
    put_Status(value) {
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
    get_Path() {
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
    put_Path(value) {
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
}
