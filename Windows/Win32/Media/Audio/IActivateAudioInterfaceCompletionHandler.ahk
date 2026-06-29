#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IActivateAudioInterfaceAsyncOperation.ahk" { IActivateAudioInterfaceAsyncOperation }

/**
 * Provides a callback to indicate that activation of a WASAPI interface is complete.
 * @remarks
 * <b>When to implement:</b>  
 * An application implements this interface if it calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a> function.
 * 
 * 
 * The implementation must be agile (aggregating a free-threaded marshaler).
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfacecompletionhandler
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IActivateAudioInterfaceCompletionHandler extends IUnknown {
    /**
     * The interface identifier for IActivateAudioInterfaceCompletionHandler
     * @type {Guid}
     */
    static IID := Guid("{41d949ab-9862-444a-80f6-c261334da5eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActivateAudioInterfaceCompletionHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ActivateCompleted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActivateAudioInterfaceCompletionHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that activation of a WASAPI interface is complete and results are available.
     * @remarks
     * An application implements this method if it calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a> function. When Windows calls this method, the results of the activation are available. The application can then retrieve the results by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfaceasyncoperation-getactivateresult">GetActivateResult</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfaceasyncoperation">IActivateAudioInterfaceAsyncOperation</a> interface, passed through the <i>activateOperation</i> parameter.
     * @param {IActivateAudioInterfaceAsyncOperation} activateOperation An interface representing the asynchronous operation of activating the requested <b>WASAPI</b> interface
     * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The function succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfacecompletionhandler-activatecompleted
     */
    ActivateCompleted(activateOperation) {
        result := ComCall(3, this, "ptr", activateOperation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActivateAudioInterfaceCompletionHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateCompleted := CallbackCreate(GetMethod(implObj, "ActivateCompleted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateCompleted)
    }
}
