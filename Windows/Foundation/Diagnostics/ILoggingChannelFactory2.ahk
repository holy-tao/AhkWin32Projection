#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LoggingChannel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingChannelFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingChannelFactory2
     * @type {Guid}
     */
    static IID => Guid("{4c6ef5dd-3b27-4dc9-99f0-299c6e4603a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithOptions", "CreateWithOptionsAndId"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {LoggingChannelOptions} options 
     * @returns {LoggingChannel} 
     */
    CreateWithOptions(name, options) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingChannel(result_)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {LoggingChannelOptions} options 
     * @param {Guid} id 
     * @returns {LoggingChannel} 
     */
    CreateWithOptionsAndId(name, options, id) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", options, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingChannel(result_)
    }
}
