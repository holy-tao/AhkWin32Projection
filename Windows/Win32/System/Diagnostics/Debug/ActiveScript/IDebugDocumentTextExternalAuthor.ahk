#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugDocumentTextExternalAuthor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDocumentTextExternalAuthor
     * @type {Guid}
     */
    static IID => Guid("{51973c25-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPathName", "GetFileName", "NotifyChanged"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLongName 
     * @param {Pointer<BOOL>} pfIsOriginalFile 
     * @returns {HRESULT} 
     */
    GetPathName(pbstrLongName, pfIsOriginalFile) {
        pfIsOriginalFileMarshal := pfIsOriginalFile is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pbstrLongName, pfIsOriginalFileMarshal, pfIsOriginalFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetFileNameFromBrowse function creates an Open dialog box so that the user can specify the drive, directory, and name of a file to open.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj/nf-shlobj-getfilenamefrombrowse
     */
    GetFileName() {
        pbstrShortName := BSTR()
        result := ComCall(4, this, "ptr", pbstrShortName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrShortName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
