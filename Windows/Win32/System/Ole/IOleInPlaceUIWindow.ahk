#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IOleWindow.ahk

/**
 * Implemented by container applications and used by object applications to negotiate border space on the document or frame window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceuiwindow
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceUIWindow extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceUIWindow
     * @type {Guid}
     */
    static IID => Guid("{00000115-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBorder", "RequestBorderSpace", "SetBorderSpace", "SetActiveObject"]

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceuiwindow-getborder
     */
    GetBorder() {
        lprectBorder := RECT()
        result := ComCall(5, this, "ptr", lprectBorder, "HRESULT")
        return lprectBorder
    }

    /**
     * 
     * @param {Pointer<RECT>} pborderwidths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceuiwindow-requestborderspace
     */
    RequestBorderSpace(pborderwidths) {
        result := ComCall(6, this, "ptr", pborderwidths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pborderwidths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace
     */
    SetBorderSpace(pborderwidths) {
        result := ComCall(7, this, "ptr", pborderwidths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleInPlaceActiveObject} pActiveObject 
     * @param {PWSTR} pszObjName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setactiveobject
     */
    SetActiveObject(pActiveObject, pszObjName) {
        pszObjName := pszObjName is String ? StrPtr(pszObjName) : pszObjName

        result := ComCall(8, this, "ptr", pActiveObject, "ptr", pszObjName, "HRESULT")
        return result
    }
}
