#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateCredential.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IUpdateCredentialFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateCredentialFactory
     * @type {Guid}
     */
    static IID => Guid("{e251a298-44b1-5455-8b44-5971bd516f09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} status_ 
     * @param {HSTRING} userName 
     * @param {HSTRING} password 
     * @returns {UpdateCredential} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(status_, userName, password) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(6, this, "int", status_, "ptr", userName, "ptr", password, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateCredential(value)
    }
}
