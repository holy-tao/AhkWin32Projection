#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Document.ahk
#Include .\Frame.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _Application extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _Application
     * @type {Guid}
     */
    static IID => Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    /**
     * The class identifier for _Application
     * @type {Guid}
     */
    static CLSID => Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Help", "Quit", "get_Document", "Load", "get_Frame", "get_Visible", "Show", "Hide", "get_UserControl", "put_UserControl", "get_VersionMajor", "get_VersionMinor"]

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Help() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Quit() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {Document} 
     */
    get_Document() {
        result := ComCall(9, this, "ptr*", &Document := 0, "HRESULT")
        return Document(Document)
    }

    /**
     * 
     * @param {BSTR} Filename 
     * @returns {HRESULT} 
     */
    Load(Filename) {
        Filename := Filename is String ? BSTR.Alloc(Filename).Value : Filename

        result := ComCall(10, this, "ptr", Filename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        result := ComCall(11, this, "ptr*", &Frame := 0, "HRESULT")
        return Frame(Frame)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Visible() {
        result := ComCall(12, this, "int*", &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Show() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Hide() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_UserControl() {
        result := ComCall(15, this, "int*", &UserControl := 0, "HRESULT")
        return UserControl
    }

    /**
     * 
     * @param {BOOL} UserControl 
     * @returns {HRESULT} 
     */
    put_UserControl(UserControl) {
        result := ComCall(16, this, "int", UserControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VersionMajor() {
        result := ComCall(17, this, "int*", &VersionMajor := 0, "HRESULT")
        return VersionMajor
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VersionMinor() {
        result := ComCall(18, this, "int*", &VersionMinor := 0, "HRESULT")
        return VersionMinor
    }
}
