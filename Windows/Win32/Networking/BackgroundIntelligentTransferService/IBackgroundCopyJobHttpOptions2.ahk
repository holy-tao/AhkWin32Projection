#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJobHttpOptions.ahk

/**
 * Use this interface to retrieve and/or to override the HTTP method used for a BITS transfer.
 * @see https://docs.microsoft.com/windows/win32/api//bits10_2/nn-bits10_2-ibackgroundcopyjobhttpoptions2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJobHttpOptions2 extends IBackgroundCopyJobHttpOptions{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions2
     * @type {Guid}
     */
    static IID => Guid("{b591a192-a405-4fc3-8323-4c5c542578fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHttpMethod", "GetHttpMethod"]

    /**
     * Overrides the default HTTP method used for a BITS transfer.
     * @param {PWSTR} method Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a constant null-terminated string of wide characters containing the HTTP method name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-sethttpmethod
     */
    SetHttpMethod(method) {
        method := method is String ? StrPtr(method) : method

        result := ComCall(11, this, "ptr", method, "HRESULT")
        return result
    }

    /**
     * Retrieves a wide string containing the HTTP method name for the BITS transfer. By default, download jobs will be &quot;GET&quot;, and upload and upload-reply jobs will be &quot;BITS_POST&quot;.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The address of a pointer to a null-terminated string of wide characters. If successful, the method updates the pointer to point to a string containing the HTTP method name. When you're done with this string, free it with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-gethttpmethod
     */
    GetHttpMethod() {
        result := ComCall(12, this, "ptr*", &method := 0, "HRESULT")
        return method
    }
}
