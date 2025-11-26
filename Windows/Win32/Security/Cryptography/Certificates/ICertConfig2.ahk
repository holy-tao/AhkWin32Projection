#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertConfig.ahk

/**
 * Provide functionality for retrieving the public configuration data (specified during client setup) for a Certificate Services server.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertconfig2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertConfig2 extends ICertConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertConfig2
     * @type {Guid}
     */
    static IID => Guid("{7a18edde-7e78-4163-8ded-78e2c9cee924}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSharedFolder"]

    /**
     * Specifies the path to be used as the certification authority's (CA) shared folder.
     * @param {BSTR} strSharedFolder String value that specifies the path of the new shared folder directory.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertconfig2-setsharedfolder
     */
    SetSharedFolder(strSharedFolder) {
        strSharedFolder := strSharedFolder is String ? BSTR.Alloc(strSharedFolder).Value : strSharedFolder

        result := ComCall(11, this, "ptr", strSharedFolder, "HRESULT")
        return result
    }
}
