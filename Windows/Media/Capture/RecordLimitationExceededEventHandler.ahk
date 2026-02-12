#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle [RecordLimitationExceeded](mediacapture_recordlimitationexceeded.md) and related events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.recordlimitationexceededeventhandler
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class RecordLimitationExceededEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for RecordLimitationExceededEventHandler
     * @type {Guid}
     */
    static IID => Guid("{3fae8f2e-4fe1-4ffd-aaba-e1f1337d4e53}")

    /**
     * The class identifier for RecordLimitationExceededEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{3fae8f2e-4fe1-4ffd-aaba-e1f1337d4e53}")

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
