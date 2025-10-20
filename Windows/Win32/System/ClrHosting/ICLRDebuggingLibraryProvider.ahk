#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRDebuggingLibraryProvider extends IUnknown{
    /**
     * The interface identifier for ICLRDebuggingLibraryProvider
     * @type {Guid}
     */
    static IID => Guid("{3151c08d-4d09-4f9b-8838-2880bf18fe51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszFileName 
     * @param {Integer} dwTimestamp 
     * @param {Integer} dwSizeOfImage 
     * @param {Pointer<HMODULE>} phModule 
     * @returns {HRESULT} 
     */
    ProvideLibrary(pwszFileName, dwTimestamp, dwSizeOfImage, phModule) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "uint", dwTimestamp, "uint", dwSizeOfImage, "ptr", phModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
