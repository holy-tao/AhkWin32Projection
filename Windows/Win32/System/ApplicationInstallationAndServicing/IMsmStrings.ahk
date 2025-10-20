#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmStrings extends IDispatch{
    /**
     * The interface identifier for IMsmStrings
     * @type {Guid}
     */
    static IID => Guid("{0adda827-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Item 
     * @param {Pointer<BSTR>} Return 
     * @returns {HRESULT} 
     */
    get_Item(Item, Return) {
        result := ComCall(7, this, "int", Item, "ptr", Return, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(8, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(NewEnum) {
        result := ComCall(9, this, "ptr", NewEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
