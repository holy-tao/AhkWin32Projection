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
     * 
     * @param {Pointer<IDataObject>} pDataObj 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<UInt32>} pdwEffect 
     * @returns {HRESULT} 
     */
    DragEnter(pDataObj, grfKeyState, pt, pdwEffect) {
        result := ComCall(3, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<UInt32>} pdwEffect 
     * @returns {HRESULT} 
     */
    DragOver(grfKeyState, pt, pdwEffect) {
        result := ComCall(4, this, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DragLeave() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pDataObj 
     * @param {Integer} grfKeyState 
     * @param {POINTL} pt 
     * @param {Pointer<UInt32>} pdwEffect 
     * @returns {HRESULT} 
     */
    Drop(pDataObj, grfKeyState, pt, pdwEffect) {
        result := ComCall(6, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, "uint*", pdwEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
