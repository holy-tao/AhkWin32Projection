#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class LPD3DENUMDEVICESCALLBACK7 extends IUnknown {

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
     * @param {PSTR} lpDeviceDescription 
     * @param {PSTR} lpDeviceName 
     * @param {Pointer<D3DDEVICEDESC7>} param2 
     * @param {Pointer<Void>} param3 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpDeviceDescription, lpDeviceName, param2, param3) {
        lpDeviceDescription := lpDeviceDescription is String ? StrPtr(lpDeviceDescription) : lpDeviceDescription
        lpDeviceName := lpDeviceName is String ? StrPtr(lpDeviceName) : lpDeviceName

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", lpDeviceDescription, "ptr", lpDeviceName, "ptr", param2, param3Marshal, param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
