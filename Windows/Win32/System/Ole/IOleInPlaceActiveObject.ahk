#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Provides a direct channel of communication between an in-place object and the associated application's outer-most frame window and the document window within the application that contains the embedded object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceactiveobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceActiveObject extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceActiveObject
     * @type {Guid}
     */
    static IID => Guid("{00000117-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateAccelerator", "OnFrameWindowActivate", "OnDocWindowActivate", "ResizeBorder", "EnableModeless"]

    /**
     * 
     * @param {Pointer<MSG>} lpmsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceactiveobject-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(5, this, "ptr", lpmsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceactiveobject-onframewindowactivate
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(6, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActivate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceactiveobject-ondocwindowactivate
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(7, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcBorder 
     * @param {IOleInPlaceUIWindow} pUIWindow 
     * @param {BOOL} fFrameWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceactiveobject-resizeborder
     */
    ResizeBorder(prcBorder, pUIWindow, fFrameWindow) {
        result := ComCall(8, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fFrameWindow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceactiveobject-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }
}
