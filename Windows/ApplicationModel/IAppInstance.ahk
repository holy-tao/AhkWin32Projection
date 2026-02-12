#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IAppInstance extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstance
     * @type {Guid}
     */
    static IID => Guid("{675f2b47-f25f-4532-9fd6-3633e0634d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Key", "get_IsCurrentInstance", "RedirectActivationTo"]

    /**
     * @type {HSTRING} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * @type {Boolean} 
     */
    IsCurrentInstance {
        get => this.get_IsCurrentInstance()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Key() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentInstance() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RedirectActivationTo() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
