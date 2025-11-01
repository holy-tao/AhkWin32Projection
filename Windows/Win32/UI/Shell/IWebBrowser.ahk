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
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    get_Application(ppDisp) {
        result := ComCall(15, this, "ptr*", ppDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    get_Parent(ppDisp) {
        result := ComCall(16, this, "ptr*", ppDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    get_Container(ppDisp) {
        result := ComCall(17, this, "ptr*", ppDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppDisp 
     * @returns {HRESULT} 
     */
    get_Document(ppDisp) {
        result := ComCall(18, this, "ptr*", ppDisp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_TopLevelContainer(pBool) {
        result := ComCall(19, this, "ptr", pBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Type 
     * @returns {HRESULT} 
     */
    get_Type(Type) {
        result := ComCall(20, this, "ptr", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pl 
     * @returns {HRESULT} 
     */
    get_Left(pl) {
        plMarshal := pl is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, plMarshal, pl, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pl 
     * @returns {HRESULT} 
     */
    get_Top(pl) {
        plMarshal := pl is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, plMarshal, pl, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pl 
     * @returns {HRESULT} 
     */
    get_Width(pl) {
        plMarshal := pl is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, plMarshal, pl, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pl 
     * @returns {HRESULT} 
     */
    get_Height(pl) {
        plMarshal := pl is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, plMarshal, pl, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} LocationName 
     * @returns {HRESULT} 
     */
    get_LocationName(LocationName) {
        result := ComCall(29, this, "ptr", LocationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} LocationURL 
     * @returns {HRESULT} 
     */
    get_LocationURL(LocationURL) {
        result := ComCall(30, this, "ptr", LocationURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    get_Busy(pBool) {
        result := ComCall(31, this, "ptr", pBool, "HRESULT")
        return result
    }
}
