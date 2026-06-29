#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ICloneViewHelper extends IUnknown {
    /**
     * The interface identifier for ICloneViewHelper
     * @type {Guid}
     */
    static IID := Guid("{f6a3d4c4-5632-4d83-b0a1-fb88712b1eb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICloneViewHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConnectedIDs   : IntPtr
        GetActiveTopology : IntPtr
        SetActiveTopology : IntPtr
        Commit            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICloneViewHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Integer>} pulID 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    GetConnectedIDs(wszAdaptorName, pulCount, pulID, ulFlags) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulIDMarshal := pulID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wszAdaptorName, pulCountMarshal, pulCount, pulIDMarshal, pulID, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Pointer<Integer>} pulCount 
     * @param {Pointer<Integer>} pulTargetID 
     * @returns {HRESULT} 
     */
    GetActiveTopology(wszAdaptorName, ulSourceID, pulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", wszAdaptorName, "uint", ulSourceID, pulCountMarshal, pulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszAdaptorName 
     * @param {Integer} ulSourceID 
     * @param {Integer} ulCount 
     * @param {Pointer<Integer>} pulTargetID 
     * @returns {HRESULT} 
     */
    SetActiveTopology(wszAdaptorName, ulSourceID, ulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint", ulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFinalCall 
     * @returns {HRESULT} 
     */
    Commit(fFinalCall) {
        result := ComCall(6, this, BOOL, fFinalCall, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICloneViewHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConnectedIDs := CallbackCreate(GetMethod(implObj, "GetConnectedIDs"), flags, 5)
        this.vtbl.GetActiveTopology := CallbackCreate(GetMethod(implObj, "GetActiveTopology"), flags, 5)
        this.vtbl.SetActiveTopology := CallbackCreate(GetMethod(implObj, "SetActiveTopology"), flags, 5)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConnectedIDs)
        CallbackFree(this.vtbl.GetActiveTopology)
        CallbackFree(this.vtbl.SetActiveTopology)
        CallbackFree(this.vtbl.Commit)
    }
}
