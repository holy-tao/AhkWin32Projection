#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplication3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplication3
     * @type {Guid}
     */
    static IID => Guid("{feec0d39-598b-4507-8a67-772632580a57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestRestartAsync", "RequestRestartForUserAsync"]

    /**
     * 
     * @param {HSTRING} launchArguments 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestRestartAsync(launchArguments) {
        if(launchArguments is String) {
            pin := HSTRING.Create(launchArguments)
            launchArguments := pin.Value
        }
        launchArguments := launchArguments is Win32Handle ? NumGet(launchArguments, "ptr") : launchArguments

        result := ComCall(6, this, "ptr", launchArguments, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} launchArguments 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestRestartForUserAsync(user_, launchArguments) {
        if(launchArguments is String) {
            pin := HSTRING.Create(launchArguments)
            launchArguments := pin.Value
        }
        launchArguments := launchArguments is Win32Handle ? NumGet(launchArguments, "ptr") : launchArguments

        result := ComCall(7, this, "ptr", user_, "ptr", launchArguments, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
