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
class IEmailAttachmentFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailAttachmentFactory2
     * @type {Guid}
     */
    static IID => Guid("{23259435-51f9-427d-adcd-241023c8cfb7}")

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
     * @param {HSTRING} mimeType 
     * @returns {EmailAttachment} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(fileName, data, mimeType) {
        if(fileName is String) {
            pin := HSTRING.Create(fileName)
            fileName := pin.Value
        }
        fileName := fileName is Win32Handle ? NumGet(fileName, "ptr") : fileName
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(6, this, "ptr", fileName, "ptr", data, "ptr", mimeType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailAttachment(result_)
    }
}
