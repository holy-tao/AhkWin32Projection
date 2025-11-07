#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a callback to indicate that activation of a WASAPI interface is complete.
 * @remarks
 * 
 * <b>When to implement:</b>  
 * An application implements this interface if it calls the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-activateaudiointerfaceasync">ActivateAudioInterfaceAsync</a> function.
 * 
 * 
 * The implementation must be agile (aggregating a free-threaded marshaler).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-iactivateaudiointerfacecompletionhandler
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IActivateAudioInterfaceCompletionHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivateAudioInterfaceCompletionHandler
     * @type {Guid}
     */
    static IID => Guid("{41d949ab-9862-444a-80f6-c261334da5eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateCompleted"]

    /**
     * 
     * @param {IActivateAudioInterfaceAsyncOperation} activateOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-iactivateaudiointerfacecompletionhandler-activatecompleted
     */
    ActivateCompleted(activateOperation) {
        result := ComCall(3, this, "ptr", activateOperation, "HRESULT")
        return result
    }
}
