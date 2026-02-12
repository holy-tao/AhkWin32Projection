#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardEmulator.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardTriggerDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardTriggerDetails2
     * @type {Guid}
     */
    static IID => Guid("{2945c569-8975-4a51-9e1a-5f8a76ee51af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Emulator", "TryLaunchCurrentAppAsync", "TryLaunchCurrentAppWithBehaviorAsync"]

    /**
     * @type {SmartCardEmulator} 
     */
    Emulator {
        get => this.get_Emulator()
    }

    /**
     * 
     * @returns {SmartCardEmulator} 
     */
    get_Emulator() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardEmulator(value)
    }

    /**
     * 
     * @param {HSTRING} arguments 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryLaunchCurrentAppAsync(arguments) {
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(7, this, "ptr", arguments, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @param {HSTRING} arguments 
     * @param {Integer} behavior 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryLaunchCurrentAppWithBehaviorAsync(arguments, behavior) {
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(8, this, "ptr", arguments, "int", behavior, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
