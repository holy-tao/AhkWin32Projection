#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to handle the completion of calls to the DeviceIoControlAsyncmethod.
 * @remarks
 * 
 * Callers that want  to use asynchronous operations on an instance that's created by CreateDeviceAccessInstance should implement the <b>IDeviceRequestCompletionCallback</b> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nn-deviceaccess-idevicerequestcompletioncallback
 * @namespace Windows.Win32.Devices.DeviceAccess
 * @version v4.0.30319
 */
class IDeviceRequestCompletionCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceRequestCompletionCallback
     * @type {Guid}
     */
    static IID => Guid("{999bad24-9acd-45bb-8669-2a2fc0288b04}")

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
     * 
     * @param {HRESULT} requestResult 
     * @param {Integer} bytesReturned 
     * @returns {HRESULT} 
     */
    Invoke(requestResult, bytesReturned) {
        result := ComCall(3, this, "int", requestResult, "uint", bytesReturned, "HRESULT")
        return result
    }
}
