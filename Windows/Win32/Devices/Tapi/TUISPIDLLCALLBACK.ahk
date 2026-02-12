#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DllCallbackProc function is called by the UI DLL to send a private parameter block to the service provider.
 * @see https://learn.microsoft.com/windows/win32/api//content/tspi/nc-tspi-tuispidllcallback
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TUISPIDLLCALLBACK extends IUnknown {

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
     * @param {Pointer} dwObjectID 
     * @param {Integer} dwObjectType 
     * @param {Pointer<Void>} lpParams 
     * @param {Integer} dwSize 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwObjectID, dwObjectType, lpParams, dwSize) {
        lpParamsMarshal := lpParams is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", dwObjectID, "uint", dwObjectType, lpParamsMarshal, lpParams, "uint", dwSize, "int")
        return result
    }
}
