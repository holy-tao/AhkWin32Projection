#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class PFND3DKMT_SHAREOBJECTS extends IUnknown {

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
     * @param {Integer} cObjects 
     * @param {Pointer<Integer>} hObjects 
     * @param {Pointer<OBJECT_ATTRIBUTES>} pObjectAttributes 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<HANDLE>} phSharedNtHandle 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(cObjects, hObjects, pObjectAttributes, dwDesiredAccess, phSharedNtHandle) {
        hObjectsMarshal := hObjects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cObjects, hObjectsMarshal, hObjects, "ptr", pObjectAttributes, "uint", dwDesiredAccess, "ptr", phSharedNtHandle, "int")
        return result
    }
}
