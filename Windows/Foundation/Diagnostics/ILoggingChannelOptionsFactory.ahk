#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LoggingChannelOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingChannelOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingChannelOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{a93151da-7faf-4191-8755-5e86dc65d896}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Guid} group 
     * @returns {LoggingChannelOptions} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(group) {
        result := ComCall(6, this, "ptr", group, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingChannelOptions(result_)
    }
}
