#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 * @charset ANSI
 */
class IEnumRegisterWordA extends IUnknown{
    /**
     * The interface identifier for IEnumRegisterWordA
     * @type {Guid}
     */
    static IID => Guid("{08c03412-f96b-11d0-a475-00aa006bcc59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumRegisterWordA>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<REGISTERWORDA>} rgRegisterWord 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(ulCount, rgRegisterWord, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr", rgRegisterWord, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
