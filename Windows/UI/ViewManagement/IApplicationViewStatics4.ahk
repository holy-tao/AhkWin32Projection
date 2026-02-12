#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewStatics4
     * @type {Guid}
     */
    static IID => Guid("{08fd8d33-2611-5336-a315-d98e6366c9db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ClearAllPersistedState", "ClearPersistedState"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllPersistedState() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} key 
     * @returns {HRESULT} 
     */
    ClearPersistedState(key) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(7, this, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
