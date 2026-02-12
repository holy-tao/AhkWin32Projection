#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The lineCallback function is a placeholder for the application-supplied function name.
 * @remarks
 * For information about parameter values passed to this function, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-device-messages">Line Device Messages</a>.
 * 
 * All callbacks occur in the application's context. The callback function must reside in a DLL or application module.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi/nc-tapi-linecallback
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLBACK extends IUnknown {

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
     * @param {Integer} hDevice 
     * @param {Integer} dwMessage 
     * @param {Pointer} dwInstance 
     * @param {Pointer} dwParam1 
     * @param {Pointer} dwParam2 
     * @param {Pointer} dwParam3 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hDevice, dwMessage, dwInstance, dwParam1, dwParam2, dwParam3) {
        ComCall(3, this, "uint", hDevice, "uint", dwMessage, "ptr", dwInstance, "ptr", dwParam1, "ptr", dwParam2, "ptr", dwParam3)
    }
}
