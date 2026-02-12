#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LoggingActivity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingActivityFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingActivityFactory
     * @type {Guid}
     */
    static IID => Guid("{6b33b483-e10a-4c58-97d5-10fb451074fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLoggingActivity", "CreateLoggingActivityWithLevel"]

    /**
     * 
     * @param {HSTRING} activityName 
     * @param {ILoggingChannel} loggingChannel_ 
     * @returns {LoggingActivity} 
     */
    CreateLoggingActivity(activityName, loggingChannel_) {
        if(activityName is String) {
            pin := HSTRING.Create(activityName)
            activityName := pin.Value
        }
        activityName := activityName is Win32Handle ? NumGet(activityName, "ptr") : activityName

        result := ComCall(6, this, "ptr", activityName, "ptr", loggingChannel_, "ptr*", &loggingActivity_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(loggingActivity_)
    }

    /**
     * 
     * @param {HSTRING} activityName 
     * @param {ILoggingChannel} loggingChannel_ 
     * @param {Integer} level 
     * @returns {LoggingActivity} 
     */
    CreateLoggingActivityWithLevel(activityName, loggingChannel_, level) {
        if(activityName is String) {
            pin := HSTRING.Create(activityName)
            activityName := pin.Value
        }
        activityName := activityName is Win32Handle ? NumGet(activityName, "ptr") : activityName

        result := ComCall(7, this, "ptr", activityName, "ptr", loggingChannel_, "int", level, "ptr*", &loggingActivity_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingActivity(loggingActivity_)
    }
}
