#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables retrieving the IUnknown pointer stored in the error info with the call to RoOriginateLanguageException.
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptionerrorinfo
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ILanguageExceptionErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageExceptionErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{04a2dbf3-df83-116c-0946-0812abf6e07d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguageException"]

    /**
     * 
     * @param {Pointer<IUnknown>} languageException 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/restrictederrorinfo/nf-restrictederrorinfo-ilanguageexceptionerrorinfo-getlanguageexception
     */
    GetLanguageException(languageException) {
        result := ComCall(3, this, "ptr*", languageException, "HRESULT")
        return result
    }
}
