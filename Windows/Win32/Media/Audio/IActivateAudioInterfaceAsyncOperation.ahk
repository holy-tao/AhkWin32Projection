#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an asynchronous operation activating a WASAPI interface and provides a method to retrieve the results of the activation.
 * @remarks
 * <b>When to implement:</b>  
 * Implemented by Windows and returned from the function <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfaceasyncoperation
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IActivateAudioInterfaceAsyncOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivateAudioInterfaceAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{72a22d78-cde4-431d-b8cc-843a71199b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivateResult"]

    /**
     * Gets the results of an asynchronous activation of a WASAPI interface initiated by an application calling the ActivateAudioInterfaceAsync function.
     * @remarks
     * An application calls this method after Windows calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfacecompletionhandler-activatecompleted">ActivateCompleted</a> method of the application’s <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfacecompletionhandler">IActivateAudioInterfaceCompletionHandler</a> interface.
     * 
     * The result code returned through <i>activateResult</i> may depend on the requested interface. For additional information, see <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate">IMMDevice::Activate</a>. A result code of <b>E_ACCESSDENIED</b> might indicate that the user has not given consent to access the device in a manner required by the requested <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/wasapi">WASAPI</a> interface. 
     * 
     * The returned <i>activatedInterface</i> may be <b>NULL</b> if <i>activateResult</i> is not a success code.
     * @param {Pointer<HRESULT>} activateResult 
     * @param {Pointer<IUnknown>} activatedInterface 
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
     * <dt><b>E_ILLEGAL_METHOD_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was called before the asynchronous operation was complete. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfaceasyncoperation-getactivateresult
     */
    GetActivateResult(activateResult, activatedInterface) {
        activateResultMarshal := activateResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, activateResultMarshal, activateResult, "ptr*", activatedInterface, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
