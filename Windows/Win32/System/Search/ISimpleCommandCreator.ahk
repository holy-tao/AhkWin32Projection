#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Contains methods for interacting with the file catalog.
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-isimplecommandcreator
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISimpleCommandCreator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleCommandCreator
     * @type {Guid}
     */
    static IID => Guid("{5e341ab7-02d0-11d1-900c-00a0c9063796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateICommand", "VerifyCatalog", "GetDefaultCatalog"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppIUnknown 
     * @param {IUnknown} pOuterUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-createicommand
     */
    CreateICommand(ppIUnknown, pOuterUnk) {
        result := ComCall(3, this, "ptr*", ppIUnknown, "ptr", pOuterUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszMachine 
     * @param {PWSTR} pwszCatalogName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-verifycatalog
     */
    VerifyCatalog(pwszMachine, pwszCatalogName) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        result := ComCall(4, this, "ptr", pwszMachine, "ptr", pwszCatalogName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszCatalogName 
     * @param {Integer} cwcIn 
     * @param {Pointer<Integer>} pcwcOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-isimplecommandcreator-getdefaultcatalog
     */
    GetDefaultCatalog(pwszCatalogName, cwcIn, pcwcOut) {
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        pcwcOutMarshal := pcwcOut is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwszCatalogName, "uint", cwcIn, pcwcOutMarshal, pcwcOut, "HRESULT")
        return result
    }
}
