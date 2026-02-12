#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * Represents a single verb available to an item. This object contains properties and methods that allow you to retrieve information about the verb.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/folderitemverb
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
        result := ComCall(7, this, "ptr*", &ppid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(8, this, "ptr*", &ppid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppid)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbs := BSTR()
        result := ComCall(9, this, "ptr", pbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbs
    }

    /**
     * Executes a verb on the FolderItem associated with the verb.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/folderitemverb-doit
     */
    DoIt() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
