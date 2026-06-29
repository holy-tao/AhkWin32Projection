#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFDeviceTransform.ahk" { IMFDeviceTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDeviceTransform2 extends IMFDeviceTransform {
    /**
     * The interface identifier for IMFDeviceTransform2
     * @type {Guid}
     */
    static IID := Guid("{f5980fed-b521-488f-909f-1a5fcecedb14}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDeviceTransform2 interfaces
    */
    struct Vtbl extends IMFDeviceTransform.Vtbl {
        GetTransformAttributes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDeviceTransform2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMFAttributes} 
     */
    GetTransformAttributes() {
        result := ComCall(23, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    Query(iid) {
        if (IMFDeviceTransform2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTransformAttributes := CallbackCreate(GetMethod(implObj, "GetTransformAttributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTransformAttributes)
    }
}
