#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve the view state of the Control Panel, the path of individual Control Panel items, and that open either the Control Panel itself or an individual Control Panel item.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iopencontrolpanel
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IOpenControlPanel extends IUnknown{
    /**
     * The interface identifier for IOpenControlPanel
     * @type {Guid}
     */
    static IID => Guid("{d11ad862-66de-4df4-bf6c-1f5621996af1}")

    /**
     * The class identifier for OpenControlPanel
     * @type {Guid}
     */
    static CLSID => Guid("{06622d85-6856-4460-8de1-a81921b41c4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszPage 
     * @param {Pointer<IUnknown>} punkSite 
     * @returns {HRESULT} 
     */
    Open(pszName, pszPage, punkSite) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszPage := pszPage is String ? StrPtr(pszPage) : pszPage

        result := ComCall(3, this, "ptr", pszName, "ptr", pszPage, "ptr", punkSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {PWSTR} pszName 
     * @param {PWSTR} pszPath 
     * @param {Integer} cchPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pszName, pszPath, cchPath) {
        pszName := pszName is String ? StrPtr(pszName) : pszName
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszName, "ptr", pszPath, "uint", cchPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pView 
     * @returns {HRESULT} 
     */
    GetCurrentView(pView) {
        result := ComCall(5, this, "int*", pView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
