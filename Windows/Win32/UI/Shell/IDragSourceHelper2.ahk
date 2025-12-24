#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDragSourceHelper.ahk

/**
 * Exposes a method that adds functionality to IDragSourceHelper. This method sets the characteristics of a drag-and-drop operation over an IDragSourceHelper object.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper">IDragSourceHelper</a> interface, from which it inherits.
 * 
 * If you want to adjust the behavior of the drag image by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-idragsourcehelper2-setflags">IDragSourceHelper2::SetFlags</a>, that call should be made before you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefromwindow">InitializeFromWindow</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefrombitmap">InitializeFromBitmap</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-idragsourcehelper2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDragSourceHelper2 extends IDragSourceHelper{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragSourceHelper2
     * @type {Guid}
     */
    static IID => Guid("{83e07d0d-0c5f-4163-bf1a-60b274051e40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFlags"]

    /**
     * Sets the characteristics of a drag-and-drop operation over an IDragSourceHelper object.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The flags that determine the characteristics of a drag-and-drop operation over an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper">IDragSourceHelper</a> object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-idragsourcehelper2-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
