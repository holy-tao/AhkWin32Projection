#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IWebBrowser extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebBrowser
     * @type {Guid}
     */
    static IID => Guid("{eab22ac1-30c1-11cf-a7eb-0000c05bae0b}")

    /**
     * The class identifier for WebBrowser
     * @type {Guid}
     */
    static CLSID => Guid("{8856f961-340a-11d0-a96b-00c04fd705a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GoBack", "GoForward", "GoHome", "GoSearch", "Navigate", "Refresh", "Refresh2", "Stop", "get_Application", "get_Parent", "get_Container", "get_Document", "get_TopLevelContainer", "get_Type", "get_Left", "put_Left", "get_Top", "put_Top", "get_Width", "put_Width", "get_Height", "put_Height", "get_LocationName", "get_LocationURL", "get_Busy"]

    /**
     * 
     * @returns {HRESULT} 
     */
    GoBack() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoForward() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoHome() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} TargetFrameName 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<VARIANT>} Headers 
     * @returns {HRESULT} 
     */
    Navigate(URL, Flags, TargetFrameName, PostData, Headers) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(11, this, "ptr", URL, "ptr", Flags, "ptr", TargetFrameName, "ptr", PostData, "ptr", Headers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Level 
     * @returns {HRESULT} 
     */
    Refresh2(Level) {
        result := ComCall(13, this, "ptr", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(15, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(16, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Container() {
        result := ComCall(17, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Document() {
        result := ComCall(18, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_TopLevelContainer() {
        result := ComCall(19, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        Type := BSTR()
        result := ComCall(20, this, "ptr", Type, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Left() {
        result := ComCall(21, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Left 
     * @returns {HRESULT} 
     */
    put_Left(Left) {
        result := ComCall(22, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Top() {
        result := ComCall(23, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     */
    put_Top(Top) {
        result := ComCall(24, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(25, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(26, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(27, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    put_Height(Height) {
        result := ComCall(28, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationName() {
        LocationName := BSTR()
        result := ComCall(29, this, "ptr", LocationName, "HRESULT")
        return LocationName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationURL() {
        LocationURL := BSTR()
        result := ComCall(30, this, "ptr", LocationURL, "HRESULT")
        return LocationURL
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Busy() {
        result := ComCall(31, this, "short*", &pBool := 0, "HRESULT")
        return pBool
    }
}
