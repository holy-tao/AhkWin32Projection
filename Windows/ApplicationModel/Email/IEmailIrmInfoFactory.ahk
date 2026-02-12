#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EmailIrmInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailIrmInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailIrmInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{314bb18c-e3e6-4d7b-be8d-91a96311b01b}")

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
     * @param {DateTime} expiration 
     * @param {EmailIrmTemplate} irmTemplate 
     * @returns {EmailIrmInfo} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(expiration, irmTemplate) {
        result := ComCall(6, this, "ptr", expiration, "ptr", irmTemplate, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailIrmInfo(result_)
    }
}
