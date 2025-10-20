#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _Application extends IDispatch{
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
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Help() {
        ComCall(7, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Quit() {
        ComCall(8, this)
        return result
    }

    /**
     * 
     * @param {Pointer<Document>} Document 
     * @returns {HRESULT} 
     */
    get_Document(Document) {
        result := ComCall(9, this, "ptr", Document, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Filename 
     * @returns {HRESULT} 
     */
    Load(Filename) {
        Filename := Filename is String ? BSTR.Alloc(Filename).Value : Filename

        result := ComCall(10, this, "ptr", Filename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Frame>} Frame 
     * @returns {HRESULT} 
     */
    get_Frame(Frame) {
        result := ComCall(11, this, "ptr", Frame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_Visible(Visible) {
        result := ComCall(12, this, "ptr", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Show() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Hide() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} UserControl 
     * @returns {HRESULT} 
     */
    get_UserControl(UserControl) {
        result := ComCall(15, this, "ptr", UserControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} UserControl 
     * @returns {HRESULT} 
     */
    put_UserControl(UserControl) {
        result := ComCall(16, this, "int", UserControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} VersionMajor 
     * @returns {HRESULT} 
     */
    get_VersionMajor(VersionMajor) {
        result := ComCall(17, this, "int*", VersionMajor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} VersionMinor 
     * @returns {HRESULT} 
     */
    get_VersionMinor(VersionMinor) {
        result := ComCall(18, this, "int*", VersionMinor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
