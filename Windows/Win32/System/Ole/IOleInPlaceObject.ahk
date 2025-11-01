#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Manages the activation and deactivation of in-place objects, and determines how much of the in-place object should be visible.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceObject extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceObject
     * @type {Guid}
     */
    static IID => Guid("{00000113-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InPlaceDeactivate", "UIDeactivate", "SetObjectRects", "ReactivateAndUndo"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceobject-inplacedeactivate
     */
    InPlaceDeactivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceobject-uideactivate
     */
    UIDeactivate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} lprcPosRect 
     * @param {Pointer<RECT>} lprcClipRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceobject-setobjectrects
     */
    SetObjectRects(lprcPosRect, lprcClipRect) {
        result := ComCall(7, this, "ptr", lprcPosRect, "ptr", lprcClipRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceobject-reactivateandundo
     */
    ReactivateAndUndo() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
