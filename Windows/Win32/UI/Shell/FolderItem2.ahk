#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FolderItem.ahk" { FolderItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItem2 extends FolderItem {
    /**
     * The interface identifier for FolderItem2
     * @type {Guid}
     */
    static IID := Guid("{edc817aa-92b8-11d1-b075-00c04fc33aa5}")

    /**
     * The class identifier for FolderItem2
     * @type {Guid}
     */
    static CLSID := Guid("{edc817aa-92b8-11d1-b075-00c04fc33aa5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItem2 interfaces
    */
    struct Vtbl extends FolderItem.Vtbl {
        InvokeVerbEx     : IntPtr
        ExtendedProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {VARIANT} vVerb 
     * @param {VARIANT} vArgs 
     * @returns {HRESULT} 
     */
    InvokeVerbEx(vVerb, vArgs) {
        result := ComCall(24, this, VARIANT, vVerb, VARIANT, vArgs, "HRESULT")
        return result
    }

    /**
     * Represents a Microsoft-extended property.
     * @remarks
     * The **ExtendedProperty** object has these types of members:
     * 
     * -   [Properties](#properties)
     * 
     * 
     * The **ExtendedProperty** object is used by the [**ExtendedProperties**](extendedproperties.md) collection.
     * 
     * The **ExtendedProperty** object can be created, and it is not safe for scripting. The ProgID for the **ExtendedProperty** object is CAPICOM.ExtendedProperty.1.
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/SecCrypto/extendedproperty
     */
    ExtendedProperty(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pvRet := VARIANT()
        result := ComCall(25, this, BSTR, bstrPropName, VARIANT.Ptr, pvRet, "HRESULT")
        return pvRet
    }

    Query(iid) {
        if (FolderItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvokeVerbEx := CallbackCreate(GetMethod(implObj, "InvokeVerbEx"), flags, 3)
        this.vtbl.ExtendedProperty := CallbackCreate(GetMethod(implObj, "ExtendedProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvokeVerbEx)
        CallbackFree(this.vtbl.ExtendedProperty)
    }
}
