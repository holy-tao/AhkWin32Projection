#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropTarget interface is one of the interfaces you implement to provide drag-and-drop operations in your application.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-idroptarget
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDropTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTarget
     * @type {Guid}
     */
    static IID => Guid("{00000122-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DragEnter", "DragOver", "DragLeave", "Drop"]

    /**
     * 
     * @param {IDataObject} pDataObj 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idroptarget-dragenter
     */
    DragEnter(pDataObj, grfKeyState, pt, pdwEffect) {
        result := ComCall(3, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idroptarget-dragover
     */
    DragOver(grfKeyState, pt, pdwEffect) {
        result := ComCall(4, this, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idroptarget-dragleave
     */
    DragLeave() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObj 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-idroptarget-drop
     */
    Drop(pDataObj, grfKeyState, pt, pdwEffect) {
        result := ComCall(6, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "HRESULT")
        return result
    }
}
