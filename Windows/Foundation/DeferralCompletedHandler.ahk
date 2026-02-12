#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the completed event of a deferred action.
 * @remarks
 * JavaScript apps should not allow navigation before completing a deferral. Doing so could cause an app to crash and should be considered a programming error.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.deferralcompletedhandler
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class DeferralCompletedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DeferralCompletedHandler
     * @type {Guid}
     */
    static IID => Guid("{ed32a372-f3c8-4faa-9cfb-470148da3888}")

    /**
     * The class identifier for DeferralCompletedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{ed32a372-f3c8-4faa-9cfb-470148da3888}")

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
