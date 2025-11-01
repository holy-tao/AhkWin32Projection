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
     * 
     * @param {Integer} Table 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview2-settable
     */
    SetTable(Table) {
        result := ComCall(15, this, "int", Table, "HRESULT")
        return result
    }
}
