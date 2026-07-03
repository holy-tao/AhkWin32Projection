#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the type information for an object's coclass entry in its type library.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iprovideclassinfo
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProvideClassInfo extends IUnknown {
    /**
     * The interface identifier for IProvideClassInfo
     * @type {Guid}
     */
    static IID := Guid("{b196b283-bab4-101a-b69c-00aa00341d07}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideClassInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClassInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideClassInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a pointer to the ITypeInfo interface for the object's type information. The type information for an object corresponds to the object's coclass entry in a type library.
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> before returning. If the object loads the type information from a type library, the type library itself will call <b>AddRef</b> in creating the pointer.
     * 
     * Because the caller cannot specify a locale identifier (LCID) when calling this method, this method must assume the neutral language, that is, LANGID_NEUTRAL, and use this value to determine what locale-specific type information to return.
     * 
     * This method must be implemented; E_NOTIMPL is not an acceptable return value.
     * @returns {ITypeInfo} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> pointer variable that receives the interface pointer to the object's type information. The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer if this method returns successfully.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iprovideclassinfo-getclassinfo
     */
    GetClassInfo() {
        result := ComCall(3, this, "ptr*", &ppTI := 0, "HRESULT")
        return ITypeInfo(ppTI)
    }

    Query(iid) {
        if (IProvideClassInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassInfo := CallbackCreate(GetMethod(implObj, "GetClassInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassInfo)
    }
}
