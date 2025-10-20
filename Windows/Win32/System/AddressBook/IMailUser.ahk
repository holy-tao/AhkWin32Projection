#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * Do not use. This interface provides access to a mail user object.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/nn-wabdefs-imailuser
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMailUser extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
