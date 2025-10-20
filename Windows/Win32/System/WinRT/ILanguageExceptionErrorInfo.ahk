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
     * 
     * @param {Pointer<IUnknown>} languageException 
     * @returns {HRESULT} 
     */
    GetLanguageException(languageException) {
        result := ComCall(3, this, "ptr", languageException, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
