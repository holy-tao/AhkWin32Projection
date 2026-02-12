#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneCallHistoryEntryAddress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallHistoryEntryAddressFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallHistoryEntryAddressFactory
     * @type {Guid}
     */
    static IID => Guid("{fb0fadba-c7f0-4bb6-9f6b-ba5d73209aca}")

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
     * @param {HSTRING} rawAddress 
     * @param {Integer} rawAddressKind 
     * @returns {PhoneCallHistoryEntryAddress} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(rawAddress, rawAddressKind) {
        if(rawAddress is String) {
            pin := HSTRING.Create(rawAddress)
            rawAddress := pin.Value
        }
        rawAddress := rawAddress is Win32Handle ? NumGet(rawAddress, "ptr") : rawAddress

        result := ComCall(6, this, "ptr", rawAddress, "int", rawAddressKind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallHistoryEntryAddress(result_)
    }
}
