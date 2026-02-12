#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class PFLT_MESSAGE_NOTIFY extends IUnknown {

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
     * @param {Pointer<Void>} PortCookie 
     * @param {Pointer} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Pointer<Integer>} ReturnOutputBufferLength 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(PortCookie, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, ReturnOutputBufferLength) {
        PortCookieMarshal := PortCookie is VarRef ? "ptr" : "ptr"
        ReturnOutputBufferLengthMarshal := ReturnOutputBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, PortCookieMarshal, PortCookie, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, ReturnOutputBufferLengthMarshal, ReturnOutputBufferLength, "int")
        return result
    }
}
