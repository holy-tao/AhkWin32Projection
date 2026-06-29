#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IAzApplication.ahk" { IAzApplication }
#Import ".\IAzClientContext2.ahk" { IAzClientContext2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Inherits from the IAzApplication interface and implements additional methods to initialize IAzClientContext2 objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazapplication2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzApplication2 extends IAzApplication {
    /**
     * The interface identifier for IAzApplication2
     * @type {Guid}
     */
    static IID := Guid("{086a68af-a249-437c-b18d-d4d86d6a9660}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzApplication2 interfaces
    */
    struct Vtbl extends IAzApplication.Vtbl {
        InitializeClientContextFromToken2 : IntPtr
        InitializeClientContext2          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzApplication2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IAzClientContext2 object pointer from the specified client token.
     * @param {Integer} ulTokenHandleLowPart Low byte of a handle to a token that specifies the client. If the values of both this parameter and the <i>ulTokenHandleHighPart</i> parameter are zero, the impersonation token of the caller's thread is used. If the thread does not have an impersonation token, the process token is used. The token must have been opened for TOKEN_QUERY, TOKEN_IMPERSONATE, or TOKEN_DUPLICATE access.
     * @param {Integer} ulTokenHandleHighPart High byte of a handle to a token that specifies the client. If the values of both this parameter and the <i>ulTokenHandleHighPart</i> parameter are zero, the impersonation token of the caller's thread is used. If the thread does not have an impersonation token, the process token is used. The token must have been opened for TOKEN_QUERY, TOKEN_IMPERSONATE, or TOKEN_DUPLICATE access.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzClientContext2} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext2">IAzClientContext2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication2-initializeclientcontextfromtoken2
     */
    InitializeClientContextFromToken2(ulTokenHandleLowPart, ulTokenHandleHighPart, varReserved) {
        result := ComCall(68, this, "uint", ulTokenHandleLowPart, "uint", ulTokenHandleHighPart, VARIANT, varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext2(ppClientContext)
    }

    /**
     * Retrieves an IAzClientContext2 object pointer.
     * @param {BSTR} IdentifyingString A string that identifies the client context in the audit trail for client connection and object access audit entries.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzClientContext2} A pointer to a pointer to the returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazclientcontext2">IAzClientContext2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazapplication2-initializeclientcontext2
     */
    InitializeClientContext2(IdentifyingString, varReserved) {
        IdentifyingString := IdentifyingString is String ? BSTR.Alloc(IdentifyingString).Value : IdentifyingString

        result := ComCall(69, this, BSTR, IdentifyingString, VARIANT, varReserved, "ptr*", &ppClientContext := 0, "HRESULT")
        return IAzClientContext2(ppClientContext)
    }

    Query(iid) {
        if (IAzApplication2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeClientContextFromToken2 := CallbackCreate(GetMethod(implObj, "InitializeClientContextFromToken2"), flags, 5)
        this.vtbl.InitializeClientContext2 := CallbackCreate(GetMethod(implObj, "InitializeClientContext2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeClientContextFromToken2)
        CallbackFree(this.vtbl.InitializeClientContext2)
    }
}
