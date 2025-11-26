#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable a client to retrieve or set an object's current working directory.
 * @remarks
 * 
 * Implement this interface if your object allows clients to retrieve or set the current working directory.
 * 
 * Use this interface to retrieve or set the working directory of the object that exports it.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-icurrentworkingdirectory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICurrentWorkingDirectory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentWorkingDirectory
     * @type {Guid}
     */
    static IID => Guid("{91956d21-9276-11d1-921a-006097df5bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectory", "SetDirectory"]

    /**
     * Gets the current working directory.
     * @param {PWSTR} pwzPath Type: <b>PWSTR</b>
     * 
     * Pointer to a buffer that, when this method returns successfully, receives the current working directory's fully qualified path as a null-terminated Unicode string.
     * @param {Integer} cchSize Type: <b>DWORD</b>
     * 
     * The size of the buffer in Unicode characters, including the terminating <b>NULL</b> character.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-icurrentworkingdirectory-getdirectory
     */
    GetDirectory(pwzPath, cchSize) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(3, this, "ptr", pwzPath, "uint", cchSize, "HRESULT")
        return result
    }

    /**
     * Sets the current working directory.
     * @param {PWSTR} pwzPath Type: <b>PCWSTR</b>
     * 
     * A pointer to the fully qualified path of the new working directory, as a null-terminated Unicode string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-icurrentworkingdirectory-setdirectory
     */
    SetDirectory(pwzPath) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(4, this, "ptr", pwzPath, "HRESULT")
        return result
    }
}
