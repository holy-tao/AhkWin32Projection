#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XPS_OBJECT_TYPE.ahk" { XPS_OBJECT_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The base interface for sharable interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMShareable extends IUnknown {
    /**
     * The interface identifier for IXpsOMShareable
     * @type {Guid}
     */
    static IID := Guid("{7137398f-2fc1-454d-8c6a-2c3115a16ece}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMShareable interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOwner : IntPtr
        GetType  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMShareable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IUnknown interface of the parent.
     * @returns {IUnknown} A pointer to the <b>IUnknown</b> interface of the parent.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomshareable-getowner
     */
    GetOwner() {
        result := ComCall(3, this, "ptr*", &owner := 0, "HRESULT")
        return IUnknown(owner)
    }

    /**
     * Gets the object type of the interface.
     * @returns {XPS_OBJECT_TYPE} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_object_type">XPS_OBJECT_TYPE</a> value that describes the interface that is derived from <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable">IXpsOMShareable</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomshareable-gettype
     */
    GetType() {
        result := ComCall(4, this, "int*", &type := 0, "HRESULT")
        return type
    }

    Query(iid) {
        if (IXpsOMShareable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOwner := CallbackCreate(GetMethod(implObj, "GetOwner"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOwner)
        CallbackFree(this.vtbl.GetType)
    }
}
