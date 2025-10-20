#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that are implemented by the WWAHost.
 * @see https://docs.microsoft.com/windows/win32/api//webapplication/nn-webapplication-iwebapplicationhost
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 * @version v4.0.30319
 */
class IWebApplicationHost extends IUnknown{
    /**
     * The interface identifier for IWebApplicationHost
     * @type {Guid}
     */
    static IID => Guid("{cecbd2c3-a3a5-4749-9681-20e9161c6794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     */
    get_HWND(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLDocument2>} htmlDocument 
     * @returns {HRESULT} 
     */
    get_Document(htmlDocument) {
        result := ComCall(4, this, "ptr", htmlDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} interfaceId 
     * @param {Pointer<IUnknown>} callback 
     * @param {Pointer<UInt32>} cookie 
     * @returns {HRESULT} 
     */
    Advise(interfaceId, callback, cookie) {
        result := ComCall(6, this, "ptr", interfaceId, "ptr", callback, "uint*", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     */
    Unadvise(cookie) {
        result := ComCall(7, this, "uint", cookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
