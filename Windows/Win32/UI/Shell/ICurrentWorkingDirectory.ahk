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
     * 
     * @param {PWSTR} pwzPath 
     * @param {Integer} cchSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-icurrentworkingdirectory-getdirectory
     */
    GetDirectory(pwzPath, cchSize) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(3, this, "ptr", pwzPath, "uint", cchSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-icurrentworkingdirectory-setdirectory
     */
    SetDirectory(pwzPath) {
        pwzPath := pwzPath is String ? StrPtr(pwzPath) : pwzPath

        result := ComCall(4, this, "ptr", pwzPath, "HRESULT")
        return result
    }
}
