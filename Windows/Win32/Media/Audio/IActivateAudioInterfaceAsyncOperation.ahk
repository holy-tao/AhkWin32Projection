#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an asynchronous operation activating a WASAPI interface and provides a method to retrieve the results of the activation.
 * @remarks
 * 
  * <b>When to implement:</b>  
  * Implemented by Windows and returned from the function <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfaceasyncoperation
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IActivateAudioInterfaceAsyncOperation extends IUnknown{
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
     * 
     * @param {Pointer<HRESULT>} activateResult 
     * @param {Pointer<IUnknown>} activatedInterface 
     * @returns {HRESULT} 
     */
    GetActivateResult(activateResult, activatedInterface) {
        result := ComCall(3, this, "ptr", activateResult, "ptr", activatedInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
