#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardAutomaticResponseApdu.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardAutomaticResponseApduFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardAutomaticResponseApduFactory
     * @type {Guid}
     */
    static IID => Guid("{e97ea2fa-d02c-4c55-b02a-8cff7fa9f05b}")

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
     * @param {IBuffer} commandApdu 
     * @param {IBuffer} responseApdu 
     * @returns {SmartCardAutomaticResponseApdu} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(commandApdu, responseApdu) {
        result := ComCall(6, this, "ptr", commandApdu, "ptr", responseApdu, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardAutomaticResponseApdu(result_)
    }
}
