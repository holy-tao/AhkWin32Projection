#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\AppWindow.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowStatics
     * @type {Guid}
     */
    static IID => Guid("{ff1f3ea3-b769-50ef-9873-108cd0e89746}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateAsync", "ClearAllPersistedState", "ClearPersistedState"]

    /**
     * 
     * @returns {IAsyncOperation<AppWindow>} 
     */
    TryCreateAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppWindow, operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllPersistedState() {
        result := ComCall(7, this, "int")
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

        result := ComCall(8, this, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
