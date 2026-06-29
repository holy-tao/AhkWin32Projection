#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemAddressResolution extends IUnknown {
    /**
     * The interface identifier for IWbemAddressResolution
     * @type {Guid}
     */
    static IID := Guid("{f7ce2e12-8c90-11d1-9e7b-00c04fc324a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemAddressResolution interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Resolve : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemAddressResolution.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszNamespacePath 
     * @param {PWSTR} wszAddressType 
     * @param {Pointer<Integer>} pdwAddressLength 
     * @param {Pointer<Pointer<Integer>>} pabBinaryAddress 
     * @returns {HRESULT} 
     */
    Resolve(wszNamespacePath, wszAddressType, pdwAddressLength, pabBinaryAddress) {
        wszNamespacePath := wszNamespacePath is String ? StrPtr(wszNamespacePath) : wszNamespacePath
        wszAddressType := wszAddressType is String ? StrPtr(wszAddressType) : wszAddressType

        pdwAddressLengthMarshal := pdwAddressLength is VarRef ? "uint*" : "ptr"
        pabBinaryAddressMarshal := pabBinaryAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", wszNamespacePath, "ptr", wszAddressType, pdwAddressLengthMarshal, pdwAddressLength, pabBinaryAddressMarshal, pabBinaryAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemAddressResolution.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Resolve)
    }
}
