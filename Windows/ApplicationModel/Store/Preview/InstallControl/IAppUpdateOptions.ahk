#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppUpdateOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUpdateOptions
     * @type {Guid}
     */
    static IID => Guid("{26f0b02f-c2f3-4aea-af8c-6308dd9db85f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CatalogId", "put_CatalogId", "get_AllowForcedAppRestart", "put_AllowForcedAppRestart"]

    /**
     * @type {HSTRING} 
     */
    CatalogId {
        get => this.get_CatalogId()
        set => this.put_CatalogId(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_CatalogId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowForcedAppRestart() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowForcedAppRestart(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
