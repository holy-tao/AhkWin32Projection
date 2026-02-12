#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NotificationData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class INotificationDataFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotificationDataFactory
     * @type {Guid}
     */
    static IID => Guid("{23c1e33a-1c10-46fb-8040-dec384621cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNotificationDataWithValuesAndSequenceNumber", "CreateNotificationDataWithValues"]

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} initialValues 
     * @param {Integer} sequenceNumber 
     * @returns {NotificationData} 
     */
    CreateNotificationDataWithValuesAndSequenceNumber(initialValues, sequenceNumber) {
        result := ComCall(6, this, "ptr", initialValues, "uint", sequenceNumber, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotificationData(value)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} initialValues 
     * @returns {NotificationData} 
     */
    CreateNotificationDataWithValues(initialValues) {
        result := ComCall(7, this, "ptr", initialValues, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotificationData(value)
    }
}
