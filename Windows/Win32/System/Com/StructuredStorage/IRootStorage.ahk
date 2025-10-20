#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IRootStorage interface contains a single method that switches a storage object to a different underlying file and saves the storage object to that file.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irootstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IRootStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRootStorage
     * @type {Guid}
     */
    static IID => Guid("{00000012-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchToFile"]

    /**
     * 
     * @param {PWSTR} pszFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-irootstorage-switchtofile
     */
    SwitchToFile(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "HRESULT")
        return result
    }
}
