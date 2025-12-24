#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides information about the result of an asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nn-rtworkq-irtwqasyncresult
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class IRtwqAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRtwqAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{ac6b7889-0740-4d51-8619-905994a55cc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetStatus", "SetStatus", "GetObject", "GetStateNoAddRef"]

    /**
     * Returns the state object specified by the caller in the asynchronous Begin method.
     * @returns {IUnknown} Receives a pointer to the state object's <b>IUnknown</b> interface. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasyncresult-getstate
     */
    GetState() {
        result := ComCall(3, this, "ptr*", &ppunkState := 0, "HRESULT")
        return IUnknown(ppunkState)
    }

    /**
     * Returns the status of the asynchronous operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasyncresult-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Sets the status of the asynchronous operation.
     * @param {HRESULT} hrStatus The status of the asynchronous operation.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasyncresult-setstatus
     */
    SetStatus(hrStatus) {
        result := ComCall(5, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * Returns an object associated with the asynchronous operation. The type of object, if any, depends on the asynchronous method that was called.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. If no object is associated with the operation, this parameter receives the value <b>NULL</b>. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasyncresult-getobject
     */
    GetObject() {
        result := ComCall(6, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * Returns the state object specified by the caller in the asynchronous Begin method, without incrementing the object's reference count.
     * @returns {IUnknown} Returns a pointer to the state object's <b>IUnknown</b> interface, or <b>NULL</b> if no object was set. This pointer does not have an outstanding reference count. If you store this pointer, you must call <b>AddRef</b> on the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//rtworkq/nf-rtworkq-irtwqasyncresult-getstatenoaddref
     */
    GetStateNoAddRef() {
        result := ComCall(7, this, "ptr")
        return result
    }
}
