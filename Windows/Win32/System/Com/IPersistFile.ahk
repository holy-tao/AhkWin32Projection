#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * Enables an object to be loaded from or saved to a disk file, rather than a storage object or stream.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipersistfile
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistFile extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistFile
     * @type {Guid}
     */
    static IID => Guid("{0000010b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "SaveCompleted", "GetCurFile"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-load
     */
    Load(pszFileName, dwMode) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(5, this, "ptr", pszFileName, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {BOOL} fRemember 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-save
     */
    Save(pszFileName, fRemember) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "int", fRemember, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-savecompleted
     */
    SaveCompleted(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(7, this, "ptr", pszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersistfile-getcurfile
     */
    GetCurFile(ppszFileName) {
        result := ComCall(8, this, "ptr", ppszFileName, "HRESULT")
        return result
    }
}
