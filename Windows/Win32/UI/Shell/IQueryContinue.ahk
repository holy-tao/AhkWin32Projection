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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryContinue"]

    /**
     * Returns S_OK if the operation associated with the current instance of this interface should continue.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if the calling application should continue, <b>S_FALSE</b> if not.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iquerycontinue-querycontinue
     */
    QueryContinue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
