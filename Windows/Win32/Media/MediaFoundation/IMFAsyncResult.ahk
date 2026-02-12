#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides information about the result of an asynchronous operation. (IMFAsyncResult)
 * @remarks
 * Use this interface to complete an asynchronous operation. You get a pointer to this interface when your callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. To complete the operation, pass the <b>IMFAsyncResult</b> pointer to the <b>End...</b> method that corresponds to the <b>Begin...</b> method that starts the operation. For example, if the asynchronous method is named <b>BeginRead</b>, call the <b>EndRead</b> method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/calling-asynchronous-methods">Calling Asynchronous Methods</a>.
 * 
 * If you are implementing an asynchronous method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a> to create an instance of this object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/writing-an-asynchronous-method">Writing an Asynchronous Method</a>.
 * 
 * Any custom implementation of this interface must inherit the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-mfasyncresult">MFASYNCRESULT</a> structure.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nn-mfobjects-imfasyncresult
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAsyncResult
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
     * Returns the state object specified by the caller in the asynchronous Begin method. (IMFAsyncResult.GetState)
     * @remarks
     * The caller of the asynchronous method specifies the state object, and can use it for any caller-defined purpose. The state object can be <b>NULL</b>. If the state object is <b>NULL</b>, <b>GetState</b> returns <b>E_POINTER</b>.
     * 
     * If you are implementing an asynchronous method, set the state object on the through the <i>punkState</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a> function.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IUnknown} Receives a pointer to the state object's <b>IUnknown</b> interface. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfasyncresult-getstate
     */
    GetState() {
        result := ComCall(3, this, "ptr*", &ppunkState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunkState)
    }

    /**
     * Returns the status of the asynchronous operation. (IMFAsyncResult.GetStatus)
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfasyncresult-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the status of the asynchronous operation. (IMFAsyncResult.SetStatus)
     * @remarks
     * If you implement an asynchronous method, call <b>SetStatus</b> to set the status code for the operation.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfasyncresult-setstatus
     */
    SetStatus(hrStatus) {
        result := ComCall(5, this, "int", hrStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns an object associated with the asynchronous operation. The type of object, if any, depends on the asynchronous method that was called. (IMFAsyncResult.GetObject)
     * @remarks
     * Typically, this object is used by the component that implements the asynchronous method. It provides a way for the function that invokes the callback to pass information to the asynchronous <b>End...</b> method that completes the operation.
     * 
     * If you are implementing an asynchronous method, you can set the object through the <i>punkObject</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateasyncresult">MFCreateAsyncResult</a> function.
     * 
     * If the asynchronous result object's internal <b>IUnknown</b> pointer is <b>NULL</b>, the method returns <b>E_POINTER</b>.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. If no object is associated with the operation, this parameter receives the value <b>NULL</b>. If the value is not <b>NULL</b>, the caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfasyncresult-getobject
     */
    GetObject() {
        result := ComCall(6, this, "ptr*", &ppObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppObject)
    }

    /**
     * Returns the state object specified by the caller in the asynchronous Begin method, without incrementing the object's reference count. (IMFAsyncResult.GetStateNoAddRef)
     * @remarks
     * This method cannot be called remotely.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IUnknown} Returns a pointer to the state object's <b>IUnknown</b> interface, or <b>NULL</b> if no object was set. This pointer does not have an outstanding reference count. If you store this pointer, you must call <b>AddRef</b> on the pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfasyncresult-getstatenoaddref
     */
    GetStateNoAddRef() {
        result := ComCall(7, this, "ptr")
        return result
    }
}
