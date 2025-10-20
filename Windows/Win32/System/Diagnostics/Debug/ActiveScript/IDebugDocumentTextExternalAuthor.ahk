#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
        result := ComCall(3, this, "ptr", pbstrLongName, "ptr", pfIsOriginalFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrShortName 
     * @returns {HRESULT} 
     */
    GetFileName(pbstrShortName) {
        result := ComCall(4, this, "ptr", pbstrShortName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyChanged() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
