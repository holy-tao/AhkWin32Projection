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
     * 
     * @param {Pointer<HRESULT>} activateResult 
     * @param {Pointer<IUnknown>} activatedInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfaceasyncoperation-getactivateresult
     */
    GetActivateResult(activateResult, activatedInterface) {
        activateResultMarshal := activateResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, activateResultMarshal, activateResult, "ptr*", activatedInterface, "HRESULT")
        return result
    }
}
