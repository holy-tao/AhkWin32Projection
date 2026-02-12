#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * CALLERRELEASE defines a callback function that can release a table data object when a table view is being released.
 * @remarks
 * A client application or service provider that has populated a table data object can call [ITableData::HrGetView](itabledata-hrgetview.md) to create a read-only, sorted view of the table. The call to **HrGetView** passes a pointer to a **CALLERRELEASE** based callback function and also a context to be saved with the table view. When the reference count of the table view returns to zero and the view is being released, the **IMAPITable** implementation calls the callback function, passing the context in the _ulCallerData_ parameter. 
 *   
 * A common use of a **CALLERRELEASE** based callback function is to release the underlying table data object and not have to keep track of it during subsequent processing.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/callerrelease
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class CALLERRELEASE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} ulCallerData 
     * @param {ITableData} lpTblData 
     * @param {IMAPITable} lpVue 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ulCallerData, lpTblData, lpVue) {
        ComCall(3, this, "uint", ulCallerData, "ptr", lpTblData, "ptr", lpVue)
    }
}
