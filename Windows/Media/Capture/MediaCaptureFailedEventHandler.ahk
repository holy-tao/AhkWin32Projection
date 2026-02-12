#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [MediaCapture.Failed](mediacapture_failed.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefailedeventhandler
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureFailedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MediaCaptureFailedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{2014effb-5cd8-4f08-a314-0d360da59f14}")

    /**
     * The class identifier for MediaCaptureFailedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{2014effb-5cd8-4f08-a314-0d360da59f14}")

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
     * @param {MediaCapture} sender 
     * @param {MediaCaptureFailedEventArgs} errorEventArgs 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, errorEventArgs) {
        result := ComCall(3, this, "ptr", sender, "ptr", errorEventArgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
