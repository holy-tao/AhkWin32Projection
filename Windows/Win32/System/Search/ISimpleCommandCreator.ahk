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
     * 
     * @param {Pointer<IUnknown>} ppIUnknown 
     * @param {Pointer<IUnknown>} pOuterUnk 
     * @returns {HRESULT} 
     */
    CreateICommand(ppIUnknown, pOuterUnk) {
        result := ComCall(3, this, "ptr", ppIUnknown, "ptr", pOuterUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszMachine 
     * @param {PWSTR} pwszCatalogName 
     * @returns {HRESULT} 
     */
    VerifyCatalog(pwszMachine, pwszCatalogName) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        result := ComCall(4, this, "ptr", pwszMachine, "ptr", pwszCatalogName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszCatalogName 
     * @param {Integer} cwcIn 
     * @param {Pointer<UInt32>} pcwcOut 
     * @returns {HRESULT} 
     */
    GetDefaultCatalog(pwszCatalogName, cwcIn, pcwcOut) {
        pwszCatalogName := pwszCatalogName is String ? StrPtr(pwszCatalogName) : pwszCatalogName

        result := ComCall(5, this, "ptr", pwszCatalogName, "uint", cwcIn, "uint*", pcwcOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
