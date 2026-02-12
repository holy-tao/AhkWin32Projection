#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DHPDEV.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PFN_DrvEnablePDEV extends IUnknown {

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
     * @param {Pointer<DEVMODEW>} param0 
     * @param {PWSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<HSURF>} param3 
     * @param {Integer} param4 
     * @param {Pointer<GDIINFO>} param5 
     * @param {Integer} param6 
     * @param {Pointer<DEVINFO>} param7 
     * @param {HDEV} param8 
     * @param {PWSTR} param9 
     * @param {HANDLE} param10 
     * @returns {DHPDEV} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
        param1 := param1 is String ? StrPtr(param1) : param1
        param8 := param8 is Win32Handle ? NumGet(param8, "ptr") : param8
        param9 := param9 is String ? StrPtr(param9) : param9
        param10 := param10 is Win32Handle ? NumGet(param10, "ptr") : param10

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "uint", param4, "ptr", param5, "uint", param6, "ptr", param7, "ptr", param8, "ptr", param9, "ptr", param10, "ptr")
        resultHandle := DHPDEV({Value: result}, True)
        return resultHandle
    }
}
