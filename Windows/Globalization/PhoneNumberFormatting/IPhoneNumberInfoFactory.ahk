#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneNumberInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.PhoneNumberFormatting
 * @version WindowsRuntime 1.4
 */
class IPhoneNumberInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneNumberInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{8202b964-adaa-4cff-8fcf-17e7516a28ff}")

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
     * @param {HSTRING} number_ 
     * @returns {PhoneNumberInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result := ComCall(6, this, "ptr", number_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneNumberInfo(result_)
    }
}
