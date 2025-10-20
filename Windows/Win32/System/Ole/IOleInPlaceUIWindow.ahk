#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Implemented by container applications and used by object applications to negotiate border space on the document or frame window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceuiwindow
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceUIWindow extends IOleWindow{
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
     * 
     * @param {Pointer<RECT>} lprectBorder 
     * @returns {HRESULT} 
     */
    GetBorder(lprectBorder) {
        result := ComCall(5, this, "ptr", lprectBorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pborderwidths 
     * @returns {HRESULT} 
     */
    RequestBorderSpace(pborderwidths) {
        result := ComCall(6, this, "ptr", pborderwidths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pborderwidths 
     * @returns {HRESULT} 
     */
    SetBorderSpace(pborderwidths) {
        result := ComCall(7, this, "ptr", pborderwidths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleInPlaceActiveObject>} pActiveObject 
     * @param {PWSTR} pszObjName 
     * @returns {HRESULT} 
     */
    SetActiveObject(pActiveObject, pszObjName) {
        pszObjName := pszObjName is String ? StrPtr(pszObjName) : pszObjName

        result := ComCall(8, this, "ptr", pActiveObject, "ptr", pszObjName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
