#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertgetconfig
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertGetConfig extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertGetConfig
     * @type {Guid}
     */
    static IID => Guid("{c7ea09c0-ce17-11d0-8833-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConfig"]

    /**
     * The ICertGetConfig::GetConfig method retrieves the configuration string for a Certificate Services server.
     * @param {Integer} Flags 
     * @returns {BSTR} A pointer to a <b>BSTR</b> that contains the configuration. When you have finished using the configuration, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function to free <i>pbstrOut</i>.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertgetconfig-getconfig
     */
    GetConfig(Flags) {
        pstrOut := BSTR()
        result := ComCall(7, this, "int", Flags, "ptr", pstrOut, "HRESULT")
        return pstrOut
    }
}
