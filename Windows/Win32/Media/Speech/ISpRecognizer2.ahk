#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpPhrase.ahk" { ISpPhrase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpRecognizer2 extends IUnknown {
    /**
     * The interface identifier for ISpRecognizer2
     * @type {Guid}
     */
    static IID := Guid("{8fc6d974-c81e-4098-93c5-0147f61ed4d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpRecognizer2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EmulateRecognitionEx         : IntPtr
        SetTrainingState             : IntPtr
        ResetAcousticModelAdaptation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpRecognizer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISpPhrase} pPhrase 
     * @param {Integer} dwCompareFlags 
     * @returns {HRESULT} 
     */
    EmulateRecognitionEx(pPhrase, dwCompareFlags) {
        result := ComCall(3, this, "ptr", pPhrase, "uint", dwCompareFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDoingTraining 
     * @param {BOOL} fAdaptFromTrainingData 
     * @returns {HRESULT} 
     */
    SetTrainingState(fDoingTraining, fAdaptFromTrainingData) {
        result := ComCall(4, this, BOOL, fDoingTraining, BOOL, fAdaptFromTrainingData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAcousticModelAdaptation() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpRecognizer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EmulateRecognitionEx := CallbackCreate(GetMethod(implObj, "EmulateRecognitionEx"), flags, 3)
        this.vtbl.SetTrainingState := CallbackCreate(GetMethod(implObj, "SetTrainingState"), flags, 3)
        this.vtbl.ResetAcousticModelAdaptation := CallbackCreate(GetMethod(implObj, "ResetAcousticModelAdaptation"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EmulateRecognitionEx)
        CallbackFree(this.vtbl.SetTrainingState)
        CallbackFree(this.vtbl.ResetAcousticModelAdaptation)
    }
}
