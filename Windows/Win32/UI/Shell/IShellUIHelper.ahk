#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper
     * @type {Guid}
     */
    static IID => Guid("{729fe2f8-1ea8-11d1-8f85-00c04fc2fbe1}")

    /**
     * The class identifier for ShellUIHelper
     * @type {Guid}
     */
    static CLSID => Guid("{64ab4bb7-111e-11d1-8f79-00c04fc2fbe1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResetFirstBootMode", "ResetSafeMode", "RefreshOfflineDesktop", "AddFavorite", "AddChannel", "AddDesktopComponent", "IsSubscribed", "NavigateAndFind", "ImportExportFavorites", "AutoCompleteSaveForm", "AutoScan", "AutoCompleteAttach", "ShowBrowserUI"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFirstBootMode() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSafeMode() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshOfflineDesktop() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {Pointer<VARIANT>} Title 
     * @returns {HRESULT} 
     */
    AddFavorite(URL, Title) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }

        result := ComCall(10, this, "ptr", URL, "ptr", Title, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddChannel(URL) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }

        result := ComCall(11, this, "ptr", URL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} Type 
     * @param {Pointer<VARIANT>} Left 
     * @param {Pointer<VARIANT>} Top 
     * @param {Pointer<VARIANT>} Width 
     * @param {Pointer<VARIANT>} Height 
     * @returns {HRESULT} 
     */
    AddDesktopComponent(URL, Type, Left, Top, Width, Height) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }
        if(Type is String) {
            pin := BSTR.Alloc(Type)
            Type := pin.Value
        }

        result := ComCall(12, this, "ptr", URL, "ptr", Type, "ptr", Left, "ptr", Top, "ptr", Width, "ptr", Height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {VARIANT_BOOL} 
     */
    IsSubscribed(URL) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }

        result := ComCall(13, this, "ptr", URL, "short*", &pBool := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBool
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} strQuery 
     * @param {Pointer<VARIANT>} varTargetFrame 
     * @returns {HRESULT} 
     */
    NavigateAndFind(URL, strQuery, varTargetFrame) {
        if(URL is String) {
            pin := BSTR.Alloc(URL)
            URL := pin.Value
        }
        if(strQuery is String) {
            pin := BSTR.Alloc(strQuery)
            strQuery := pin.Value
        }

        result := ComCall(14, this, "ptr", URL, "ptr", strQuery, "ptr", varTargetFrame, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fImport 
     * @param {BSTR} strImpExpPath 
     * @returns {HRESULT} 
     */
    ImportExportFavorites(fImport, strImpExpPath) {
        if(strImpExpPath is String) {
            pin := BSTR.Alloc(strImpExpPath)
            strImpExpPath := pin.Value
        }

        result := ComCall(15, this, "short", fImport, "ptr", strImpExpPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Form 
     * @returns {HRESULT} 
     */
    AutoCompleteSaveForm(Form) {
        result := ComCall(16, this, "ptr", Form, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strSearch 
     * @param {BSTR} strFailureUrl 
     * @param {Pointer<VARIANT>} pvarTargetFrame 
     * @returns {HRESULT} 
     */
    AutoScan(strSearch, strFailureUrl, pvarTargetFrame) {
        if(strSearch is String) {
            pin := BSTR.Alloc(strSearch)
            strSearch := pin.Value
        }
        if(strFailureUrl is String) {
            pin := BSTR.Alloc(strFailureUrl)
            strFailureUrl := pin.Value
        }

        result := ComCall(17, this, "ptr", strSearch, "ptr", strFailureUrl, "ptr", pvarTargetFrame, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Reserved 
     * @returns {HRESULT} 
     */
    AutoCompleteAttach(Reserved) {
        result := ComCall(18, this, "ptr", Reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<VARIANT>} pvarIn 
     * @returns {VARIANT} 
     */
    ShowBrowserUI(bstrName, pvarIn) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        pvarOut := VARIANT()
        result := ComCall(19, this, "ptr", bstrName, "ptr", pvarIn, "ptr", pvarOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarOut
    }
}
