#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\LocalKind.ahk" { LocalKind }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugHostFunctionLocalStorageEnumerator.ahk" { IDebugHostFunctionLocalStorageEnumerator }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostType.ahk" { IDebugHostType }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionLocalDetails extends IUnknown {
    /**
     * The interface identifier for IDebugHostFunctionLocalDetails
     * @type {Guid}
     */
    static IID := Guid("{89280ea8-b3b9-408c-be16-32ab28f5c0ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionLocalDetails interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName             : IntPtr
        GetType             : IntPtr
        EnumerateStorage    : IntPtr
        GetLocalKind        : IntPtr
        GetArgumentPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionLocalDetails.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        name := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetType() {
        result := ComCall(4, this, "ptr*", &localType := 0, "HRESULT")
        return IDebugHostType(localType)
    }

    /**
     * 
     * @returns {IDebugHostFunctionLocalStorageEnumerator} 
     */
    EnumerateStorage() {
        result := ComCall(5, this, "ptr*", &storageEnum := 0, "HRESULT")
        return IDebugHostFunctionLocalStorageEnumerator(storageEnum)
    }

    /**
     * 
     * @returns {LocalKind} 
     */
    GetLocalKind() {
        result := ComCall(6, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgumentPosition() {
        result := ComCall(7, this, "uint*", &argPosition := 0, "HRESULT")
        return argPosition
    }

    Query(iid) {
        if (IDebugHostFunctionLocalDetails.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.EnumerateStorage := CallbackCreate(GetMethod(implObj, "EnumerateStorage"), flags, 2)
        this.vtbl.GetLocalKind := CallbackCreate(GetMethod(implObj, "GetLocalKind"), flags, 2)
        this.vtbl.GetArgumentPosition := CallbackCreate(GetMethod(implObj, "GetArgumentPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.EnumerateStorage)
        CallbackFree(this.vtbl.GetLocalKind)
        CallbackFree(this.vtbl.GetArgumentPosition)
    }
}
