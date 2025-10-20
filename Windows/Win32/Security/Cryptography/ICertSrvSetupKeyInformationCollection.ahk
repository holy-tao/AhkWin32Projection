#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to populate and enumerate a collection of ICertSrvSetupKeyInformation objects.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetupkeyinformationcollection
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetupKeyInformationCollection extends IDispatch{
    /**
     * The interface identifier for ICertSrvSetupKeyInformationCollection
     * @type {Guid}
     */
    static IID => Guid("{e65c8b00-e58f-41f9-a9ec-a28d7427c844}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppVal) {
        result := ComCall(7, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(Index, pVal) {
        result := ComCall(8, this, "int", Index, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICertSrvSetupKeyInformation>} pIKeyInformation 
     * @returns {HRESULT} 
     */
    Add(pIKeyInformation) {
        result := ComCall(10, this, "ptr", pIKeyInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
