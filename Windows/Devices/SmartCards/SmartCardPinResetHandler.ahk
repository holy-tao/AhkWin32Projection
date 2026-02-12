#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles a smart card personal identification number (PIN) reset.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresethandler
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardPinResetHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SmartCardPinResetHandler
     * @type {Guid}
     */
    static IID => Guid("{138d5e40-f3bc-4a5c-b41d-4b4ef684e237}")

    /**
     * The class identifier for SmartCardPinResetHandler
     * @type {Guid}
     */
    static CLSID => Guid("{138d5e40-f3bc-4a5c-b41d-4b4ef684e237}")

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
     * @param {SmartCardProvisioning} sender 
     * @param {SmartCardPinResetRequest} request 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, request) {
        result := ComCall(3, this, "ptr", sender, "ptr", request, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
