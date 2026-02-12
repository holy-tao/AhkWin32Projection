#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class IUserCertificateEnrollmentManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserCertificateEnrollmentManager2
     * @type {Guid}
     */
    static IID => Guid("{0dad9cb1-65de-492a-b86d-fc5c482c3747}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ImportPfxDataToKspWithParametersAsync"]

    /**
     * 
     * @param {HSTRING} pfxData 
     * @param {HSTRING} password 
     * @param {PfxImportParameters} pfxImportParameters_ 
     * @returns {IAsyncAction} 
     */
    ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters_) {
        if(pfxData is String) {
            pin := HSTRING.Create(pfxData)
            pfxData := pin.Value
        }
        pfxData := pfxData is Win32Handle ? NumGet(pfxData, "ptr") : pfxData
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(6, this, "ptr", pfxData, "ptr", password, "ptr", pfxImportParameters_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
