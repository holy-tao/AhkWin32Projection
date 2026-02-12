#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\DialAppStateDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialApp extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialApp
     * @type {Guid}
     */
    static IID => Guid("{555ffbd3-45b7-49f3-bbd7-302db6084646}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppName", "RequestLaunchAsync", "StopAsync", "GetAppStateAsync"]

    /**
     * @type {HSTRING} 
     */
    AppName {
        get => this.get_AppName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} appArgument 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestLaunchAsync(appArgument) {
        if(appArgument is String) {
            pin := HSTRING.Create(appArgument)
            appArgument := pin.Value
        }
        appArgument := appArgument is Win32Handle ? NumGet(appArgument, "ptr") : appArgument

        result := ComCall(7, this, "ptr", appArgument, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    StopAsync() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<DialAppStateDetails>} 
     */
    GetAppStateAsync() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DialAppStateDetails, value)
    }
}
