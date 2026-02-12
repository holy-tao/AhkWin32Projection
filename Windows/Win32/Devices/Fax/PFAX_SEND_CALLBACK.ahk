#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxSendCallback function is an application-defined or library-defined callback function that a fax service provider (FSP) calls to notify the fax service that an outgoing fax call is in progress.
 * @remarks
 * The <i>FaxSendCallback</i> callback function provides the fax service with the <i>CallHandle</i> that TAPI assigns. This handle is necessary for TAPI message routing. If the FSP does not call <i>FaxSendCallback</i>, it will miss all further call events.
 * 
 * A virtual FSP does not need the <i>FaxSendCallback</i> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/faxdev/nc-faxdev-pfax_send_callback
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAX_SEND_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {HANDLE} FaxHandle 
     * @param {Integer} CallHandle 
     * @param {Integer} Reserved1 
     * @param {Integer} Reserved2 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, CallHandle, Reserved1, Reserved2) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := ComCall(3, this, "ptr", FaxHandle, "uint", CallHandle, "uint", Reserved1, "uint", Reserved2, "int")
        return result
    }
}
