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
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    Load(pszFileName, dwMode) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(5, this, "ptr", pszFileName, "uint", dwMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {BOOL} fRemember 
     * @returns {HRESULT} 
     */
    Save(pszFileName, fRemember) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(6, this, "ptr", pszFileName, "int", fRemember, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @returns {HRESULT} 
     */
    SaveCompleted(pszFileName) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(7, this, "ptr", pszFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFileName 
     * @returns {HRESULT} 
     */
    GetCurFile(ppszFileName) {
        result := ComCall(8, this, "ptr", ppszFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
