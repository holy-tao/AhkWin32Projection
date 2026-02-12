#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EmailAttachment.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailAttachmentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailAttachmentFactory
     * @type {Guid}
     */
    static IID => Guid("{796eac46-ed56-4979-8708-abb8bc854b7d}")

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
     * @param {HSTRING} fileName 
     * @param {IRandomAccessStreamReference} data 
     * @returns {EmailAttachment} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(fileName, data) {
        if(fileName is String) {
            pin := HSTRING.Create(fileName)
            fileName := pin.Value
        }
        fileName := fileName is Win32Handle ? NumGet(fileName, "ptr") : fileName

        result := ComCall(6, this, "ptr", fileName, "ptr", data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailAttachment(result_)
    }
}
