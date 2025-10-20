#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables interoperability with a WinRT CoreDragDropManager object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dragdropinterop/nn-dragdropinterop-idragdropmanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IDragDropManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragDropManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{5ad8cba7-4c01-4dac-9074-827894292d63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dragdropinterop/nf-dragdropinterop-idragdropmanagerinterop-getforwindow
     */
    GetForWindow(hwnd, riid, ppv) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
