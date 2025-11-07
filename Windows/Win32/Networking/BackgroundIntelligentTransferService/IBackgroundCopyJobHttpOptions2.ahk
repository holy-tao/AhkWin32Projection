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
     * 
     * @param {PWSTR} method 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-sethttpmethod
     */
    SetHttpMethod(method) {
        method := method is String ? StrPtr(method) : method

        result := ComCall(11, this, "ptr", method, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits10_2/nf-bits10_2-ibackgroundcopyjobhttpoptions2-gethttpmethod
     */
    GetHttpMethod() {
        result := ComCall(12, this, "ptr*", &method := 0, "HRESULT")
        return method
    }
}
