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
     * Creates an ICommand.
     * @param {IUnknown} pOuterUnk Optional outer unknown pointer.
     * @returns {IUnknown} Returns the IUnknown for the command.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-isimplecommandcreator-createicommand
     */
    CreateICommand(pOuterUnk) {
        result := ComCall(3, this, "ptr*", &ppIUnknown := 0, "ptr", pOuterUnk, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Validates the catalog location.
     * @param {PWSTR} pwszMachine Machine on which the catalog exists.
     * @param {PWSTR} pwszCatalogName The catalog name.
     * @returns {HRESULT} If the catalog is accessible, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-isimplecommandcreator-verifycatalog
     */
    VerifyCatalog(pwszMachine, pwszCatalogName) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        result := ComCall(4, this, "ptr", pwszMachine, "ptr", pwszCatalogName, "HRESULT")
        return result
    }

    /**
     * Determines the default catalog for the system.
     * @param {PWSTR} pwszCatalogName The catalog name.
     * @param {Integer} cwcIn The size in characters of <i>pwszCatalogName</i>.
     * @param {Pointer<Integer>} pcwcOut Size of the catalog name.
     * @returns {HRESULT} If this method succeeds, it returns the contents of the IsapiDefaultCatalogDirectory registry value. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-isimplecommandcreator-getdefaultcatalog
     */
    GetDefaultCatalog(pwszCatalogName, cwcIn, pcwcOut) {
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        pcwcOutMarshal := pcwcOut is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwszCatalogName, "uint", cwcIn, pcwcOutMarshal, pcwcOut, "HRESULT")
        return result
    }
}
