#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IAzClientContext2.ahk
#Include .\IAzApplication.ahk

/**
 * Inherits from the IAzApplication interface and implements additional methods to initialize IAzClientContext2 objects.
 * @see https://docs.microsoft.com/windows/win32/api//azroles/nn-azroles-iazapplication2
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class IAzApplication2 extends IAzApplication{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAzApplication2
     * @type {Guid}
     */
    static IID => Guid("{086a68af-a249-437c-b18d-d4d86d6a9660}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeClientContextFromToken2", "InitializeClientContext2"]

    /**
     * Retrieves an IAzClientContext2 object pointer from the specified client token.
     * @param {Integer} ulTokenHandleLowPart Low byte of a handle to a token that specifies the client. If the values of both this parameter and the <i>ulTokenHandleHighPart</i> parameter are zero, the impersonation token of the caller's thread is used. If the thread does not have an impersonation token, the process token is used. The token must have been opened for TOKEN_QUERY, TOKEN_IMPERSONATE, or TOKEN_DUPLICATE access.
     * @param {Integer} ulTokenHandleHighPart High byte of a handle to a token that specifies the client. If the values of both this parameter and the <i>ulTokenHandleHighPart</i> parameter are zero, the impersonation token of the caller's thread is used. If the thread does not have an impersonation token, the process token is used. The token must have been opened for TOKEN_QUERY, TOKEN_IMPERSONATE, or TOKEN_DUPLICATE access.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzClientContext2} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext2">IAzClientContext2</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplication2-initializeclientcontextfromtoken2
     */
    InitializeClientContextFromToken2(ulTokenHandleLowPart, ulTokenHandleHighPart, varReserved) {
        result := ComCall(68, this, "uint", ulTokenHandleLowPart, "uint", ulTokenHandleHighPart, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext2(ppClientContext)
    }

    /**
     * Retrieves an IAzClientContext2 object pointer.
     * @param {BSTR} IdentifyingString A string that identifies the client context in the audit trail for client connection and object access audit entries.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzClientContext2} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext2">IAzClientContext2</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//azroles/nf-azroles-iazapplication2-initializeclientcontext2
     */
    InitializeClientContext2(IdentifyingString, varReserved) {
        IdentifyingString := IdentifyingString is String ? BSTR.Alloc(IdentifyingString).Value : IdentifyingString

        result := ComCall(69, this, "ptr", IdentifyingString, "ptr", varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext2(ppClientContext)
    }
}
