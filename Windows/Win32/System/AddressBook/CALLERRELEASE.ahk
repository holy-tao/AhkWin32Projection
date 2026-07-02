#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ITableData.ahk" { ITableData }
#Import ".\IMAPITable.ahk" { IMAPITable }

/**
 * CALLERRELEASE defines a callback function that can release a table data object when a table view is being released.
 * @remarks
 * A client application or service provider that has populated a table data object can call [ITableData::HrGetView](itabledata-hrgetview.md) to create a read-only, sorted view of the table. The call to **HrGetView** passes a pointer to a **CALLERRELEASE** based callback function and also a context to be saved with the table view. When the reference count of the table view returns to zero and the view is being released, the **IMAPITable** implementation calls the callback function, passing the context in the _ulCallerData_ parameter. 
 *   
 * A common use of a **CALLERRELEASE** based callback function is to release the underlying table data object and not have to keep track of it during subsequent processing.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/callerrelease
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct CALLERRELEASE {
    value : IntPtr

    __value {
        set {
            if (value is CALLERRELEASE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} ulCallerData > [in] Caller data saved by MAPI with the table view and passed to the **CALLERRELEASE** based callback function. The data provides context about the table view being released.
     * @param {ITableData} lpTblData > [in] Pointer to the [ITableData : IUnknown](itabledataiunknown.md) interface for the table data object underlying the table view being released.
     * @param {IMAPITable} lpVue > [in] Pointer to the [IMAPITable : IUnknown](imapitableiunknown.md) interface for the table view being released. This is an interface for the table object returned in the _lppMAPITable_ parameter of the [ITableData::HrGetView](itabledata-hrgetview.md) method that created the object to release.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ulCallerData, lpTblData, lpVue) {
        DllCall(this.value, UInt32, ulCallerData, "ptr", lpTblData, "ptr", lpVue)
    }

    /**
     * A CALLERRELEASE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CALLERRELEASE {
        /**
         * Creates a CALLERRELEASE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
