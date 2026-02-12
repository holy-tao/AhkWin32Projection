#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IDeviceServicingTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceServicingTrigger
     * @type {Guid}
     */
    static IID => Guid("{1ab217ad-6e34-49d3-9e6f-17f1b6dfa881}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAsyncSimple", "RequestAsyncWithArguments"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {TimeSpan} expectedDuration 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAsyncSimple(deviceId, expectedDuration) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr", expectedDuration, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {TimeSpan} expectedDuration 
     * @param {HSTRING} arguments 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAsyncWithArguments(deviceId, expectedDuration, arguments) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId
        if(arguments is String) {
            pin := HSTRING.Create(arguments)
            arguments := pin.Value
        }
        arguments := arguments is Win32Handle ? NumGet(arguments, "ptr") : arguments

        result := ComCall(7, this, "ptr", deviceId, "ptr", expectedDuration, "ptr", arguments, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
