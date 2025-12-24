#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/folderitemverb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FolderItemVerb extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for FolderItemVerb
     * @type {Guid}
     */
    static IID => Guid("{08ec3e00-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The class identifier for FolderItemVerb
     * @type {Guid}
     */
    static CLSID => Guid("{08ec3e00-50b0-11cf-960c-0080c7f4ee85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Application", "get_Parent", "get_Name", "DoIt"]

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(7, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "HRESULT")
        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbs := BSTR()
        result := ComCall(9, this, "ptr", pbs, "HRESULT")
        return pbs
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitemverb-doit
     */
    DoIt() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
