#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertView.ahk

/**
 * Allow properly authorized clients to create a customized or complete view of the Certificate Services database.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-icertview2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertView2 extends ICertView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertView2
     * @type {Guid}
     */
    static IID => Guid("{d594b282-8851-4b61-9c66-3edadf848863}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTable"]

    /**
     * Specifies which Certificate Services database table is used for subsequent calls to the methods of the ICertView2 interface.
     * @param {Integer} Table 
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certview/nf-certview-icertview2-settable
     */
    SetTable(Table) {
        result := ComCall(15, this, "int", Table, "HRESULT")
        return result
    }
}
