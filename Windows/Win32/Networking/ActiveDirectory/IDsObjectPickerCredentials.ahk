#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDsObjectPicker.ahk

/**
 * The IDsObjectPickerCredentials interface allows you to override credentials for the IDsObjectPicker object implementing this interface.
 * @see https://docs.microsoft.com/windows/win32/api//objsel/nn-objsel-idsobjectpickercredentials
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsObjectPickerCredentials extends IDsObjectPicker{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsObjectPickerCredentials
     * @type {Guid}
     */
    static IID => Guid("{e2d3ec9b-d041-445a-8f16-4748de8fb1cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCredentials"]

    /**
     * Use this method to override the user credentials, passing new credentials for the account profile to be used.
     * @param {PWSTR} szUserName User account.
     * @param {PWSTR} szPassword Password.
     * @returns {HRESULT} S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//objsel/nf-objsel-idsobjectpickercredentials-setcredentials
     */
    SetCredentials(szUserName, szPassword) {
        szUserName := szUserName is String ? StrPtr(szUserName) : szUserName
        szPassword := szPassword is String ? StrPtr(szPassword) : szPassword

        result := ComCall(5, this, "ptr", szUserName, "ptr", szPassword, "HRESULT")
        return result
    }
}
