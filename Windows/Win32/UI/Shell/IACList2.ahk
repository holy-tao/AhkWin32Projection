#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IACList.ahk

/**
 * Extends the IACList interface to enable clients of an autocomplete object to retrieve and set option flags.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-iaclist">IACList</a> interface from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-iautocomplete">Autocompletion</a> clients implement this interface to enable the autocomplete object to retrieve and set options. The options are basically a request that the client generate a list with the names of all the files and subfolders contained by one or more specified folders. The autocomplete object then calls the client's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> interface to request the strings.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Typically, this interface is not used directly by applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iaclist2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IACList2 extends IACList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IACList2
     * @type {Guid}
     */
    static IID => Guid("{470141a0-5186-11d2-bbb6-0060977b464c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOptions", "GetOptions"]

    /**
     * Sets the current autocomplete options.
     * @param {Integer} dwFlag Type: <b>DWORD</b>
     * 
     * New option flags. Use these flags to ask the client to include the names of the files and subfolders of the specified folders the next time the client's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> interface is called. This parameter can contain one or more of the following flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-iaclist2-setoptions
     */
    SetOptions(dwFlag) {
        result := ComCall(4, this, "uint", dwFlag, "HRESULT")
        return result
    }

    /**
     * Gets the current autocomplete options.
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-iaclist2-getoptions
     */
    GetOptions() {
        result := ComCall(5, this, "uint*", &pdwFlag := 0, "HRESULT")
        return pdwFlag
    }
}
