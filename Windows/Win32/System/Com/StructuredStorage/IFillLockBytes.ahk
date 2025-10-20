#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IFillLockBytes interface enables downloading code to write data asynchronously to a structured storage byte array.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ifilllockbytes
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IFillLockBytes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFillLockBytes
     * @type {Guid}
     */
    static IID => Guid("{99caf010-415e-11cf-8814-00aa00b569f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FillAppend", "FillAt", "SetFillSize", "Terminate"]

    /**
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ifilllockbytes-fillappend
     */
    FillAppend(pv, cb, pcbWritten) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", pcbWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulOffset 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ifilllockbytes-fillat
     */
    FillAt(ulOffset, pv, cb, pcbWritten) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", pcbWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ifilllockbytes-setfillsize
     */
    SetFillSize(ulSize) {
        result := ComCall(5, this, "uint", ulSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bCanceled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ifilllockbytes-terminate
     */
    Terminate(bCanceled) {
        result := ComCall(6, this, "int", bCanceled, "HRESULT")
        return result
    }
}
