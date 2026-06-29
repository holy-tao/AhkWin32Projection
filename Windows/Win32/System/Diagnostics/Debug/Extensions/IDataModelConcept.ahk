#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugHostTypeSignature.ahk" { IDebugHostTypeSignature }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelConcept extends IUnknown {
    /**
     * The interface identifier for IDataModelConcept
     * @type {Guid}
     */
    static IID := Guid("{fcb98d1d-1114-4fbf-b24c-effcb5def0d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeObject : IntPtr
        GetName          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} modelObject 
     * @param {IDebugHostTypeSignature} matchingTypeSignature 
     * @param {IDebugHostSymbolEnumerator} wildcardMatches 
     * @returns {HRESULT} 
     */
    InitializeObject(modelObject, matchingTypeSignature, wildcardMatches) {
        result := ComCall(3, this, "ptr", modelObject, "ptr", matchingTypeSignature, "ptr", wildcardMatches, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        modelName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, modelName, "HRESULT")
        return modelName
    }

    Query(iid) {
        if (IDataModelConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeObject := CallbackCreate(GetMethod(implObj, "InitializeObject"), flags, 4)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeObject)
        CallbackFree(this.vtbl.GetName)
    }
}
