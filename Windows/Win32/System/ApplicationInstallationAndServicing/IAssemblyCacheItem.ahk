#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IAssemblyCacheItem interface can be used to install side-by-side assemblies into the side-by-side store using a stream-based installation.
 * @see https://docs.microsoft.com/windows/win32/api//winsxs/nn-winsxs-iassemblycacheitem
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IAssemblyCacheItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssemblyCacheItem
     * @type {Guid}
     */
    static IID => Guid("{9e3aaeb4-d1cd-11d2-bab9-00c04f8eceae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStream", "Commit", "AbortItem"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszStreamName 
     * @param {Integer} dwFormat 
     * @param {Integer} dwFormatFlags 
     * @param {Pointer<IStream>} ppIStream 
     * @param {Pointer<Integer>} puliMaxSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycacheitem-createstream
     */
    CreateStream(dwFlags, pszStreamName, dwFormat, dwFormatFlags, ppIStream, puliMaxSize) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszStreamName, "uint", dwFormat, "uint", dwFormatFlags, "ptr*", ppIStream, "uint*", puliMaxSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pulDisposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsxs/nf-winsxs-iassemblycacheitem-commit
     */
    Commit(dwFlags, pulDisposition) {
        result := ComCall(4, this, "uint", dwFlags, "uint*", pulDisposition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortItem() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
