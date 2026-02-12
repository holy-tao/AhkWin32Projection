#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns results from the asynchronous WinBioLocateSensorWithCallback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio/nc-winbio-pwinbio_locate_sensor_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PWINBIO_LOCATE_SENSOR_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} LocateCallbackContext 
     * @param {HRESULT} OperationStatus 
     * @param {Integer} UnitId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(LocateCallbackContext, OperationStatus, UnitId) {
        LocateCallbackContextMarshal := LocateCallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, LocateCallbackContextMarshal, LocateCallbackContext, "int", OperationStatus, "uint", UnitId)
    }
}
