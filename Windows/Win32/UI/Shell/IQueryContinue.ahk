#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that provides a simple, standard mechanism for objects to query a client for permission to continue an operation.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iquerycontinue
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryContinue extends IUnknown{
    /**
     * The interface identifier for IQueryContinue
     * @type {Guid}
     */
    static IID => Guid("{7307055c-b24a-486b-9f25-163e597a28a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    QueryContinue() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
