#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class PDEV_QUERY_RESULT_CALLBACK extends IUnknown {

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
     * @param {HDEVQUERY} hDevQuery_ 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<DEV_QUERY_RESULT_ACTION_DATA>} pActionData 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hDevQuery_, pContext, pActionData) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hDevQuery_, pContextMarshal, pContext, "ptr", pActionData)
    }
}
