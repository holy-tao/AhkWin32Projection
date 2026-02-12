#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertView.ahk

/**
 * Allow properly authorized clients to create a customized or complete view of the Certificate Services database.
 * @see https://learn.microsoft.com/windows/win32/api//content/certview/nn-certview-icertview2
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
     * @remarks
     * Before calling the <b>SetTable</b> method, it is necessary to establish a connection with a Certificate Services server by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certview/nf-certview-icertview-openconnection">OpenConnection</a> method first. After the <b>OpenConnection</b> and <b>SetTable</b> calls are made, subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/certview/nn-certview-icertview2">ICertView2</a> interface methods will use the Certificate Services database table specified by the <b>SetTable</b> method.
     * 
     * If the <b>SetTable</b> method is not called, then the default table  CVRC_TABLE_REQCERT is used.
     * @param {Integer} Table 
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certview/nf-certview-icertview2-settable
     */
    SetTable(Table) {
        result := ComCall(15, this, "int", Table, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
