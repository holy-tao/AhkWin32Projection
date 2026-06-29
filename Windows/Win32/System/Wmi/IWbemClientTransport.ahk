#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemServices.ahk" { IWbemServices }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemClientTransport extends IUnknown {
    /**
     * The interface identifier for IWbemClientTransport
     * @type {Guid}
     */
    static IID := Guid("{f7ce2e11-8c90-11d1-9e7b-00c04fc324a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemClientTransport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectServer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemClientTransport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strNetworkResource 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lSecurityFlags 
     * @param {BSTR} strAuthority 
     * @param {IWbemContext} pCtx 
     * @returns {IWbemServices} 
     */
    ConnectServer(strAddressType, dwBinaryAddressLength, abBinaryAddress, strNetworkResource, strUser, strPassword, strLocale, lSecurityFlags, strAuthority, pCtx) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strNetworkResource := strNetworkResource is String ? BSTR.Alloc(strNetworkResource).Value : strNetworkResource
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale
        strAuthority := strAuthority is String ? BSTR.Alloc(strAuthority).Value : strAuthority

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, BSTR, strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, BSTR, strNetworkResource, BSTR, strUser, BSTR, strPassword, BSTR, strLocale, "int", lSecurityFlags, BSTR, strAuthority, "ptr", pCtx, "ptr*", &ppNamespace := 0, "HRESULT")
        return IWbemServices(ppNamespace)
    }

    Query(iid) {
        if (IWbemClientTransport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectServer := CallbackCreate(GetMethod(implObj, "ConnectServer"), flags, 12)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectServer)
    }
}
