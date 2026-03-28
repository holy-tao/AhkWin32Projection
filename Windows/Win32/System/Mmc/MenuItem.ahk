#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Determines which menu item, if any, is at the specified location.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-menuitemfrompoint
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MenuItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MenuItem
     * @type {Guid}
     */
    static IID => Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    /**
     * The class identifier for MenuItem
     * @type {Guid}
     */
    static CLSID => Guid("{0178fad1-b361-4b27-96ad-67c57ebf2e1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "get_LanguageIndependentName", "get_Path", "get_LanguageIndependentPath", "Execute", "get_Enabled"]

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {BSTR} 
     */
    LanguageIndependentName {
        get => this.get_LanguageIndependentName()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {BSTR} 
     */
    LanguageIndependentPath {
        get => this.get_LanguageIndependentPath()
    }

    /**
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        DisplayName := BSTR()
        result := ComCall(7, this, "ptr", DisplayName, "HRESULT")
        return DisplayName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LanguageIndependentName() {
        LanguageIndependentName := BSTR()
        result := ComCall(8, this, "ptr", LanguageIndependentName, "HRESULT")
        return LanguageIndependentName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        _Path := BSTR()
        result := ComCall(9, this, "ptr", _Path, "HRESULT")
        return _Path
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LanguageIndependentPath() {
        LanguageIndependentPath := BSTR()
        result := ComCall(10, this, "ptr", LanguageIndependentPath, "HRESULT")
        return LanguageIndependentPath
    }

    /**
     * Calls the DsReplicaConsistencyCheck function, which invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/AD/executekcc-msad-domaincontroller
     */
    Execute() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Enabled() {
        result := ComCall(12, this, "int*", &Enabled := 0, "HRESULT")
        return Enabled
    }
}
