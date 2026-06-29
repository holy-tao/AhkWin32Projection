#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpTask extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpTask interfaces
    */
    struct Vtbl {
        Execute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {Pointer<Integer>} pfContinueProcessing 
     * @returns {HRESULT} 
     */
    Execute(pvTaskData, pfContinueProcessing) {
        pvTaskDataMarshal := pvTaskData is VarRef ? "ptr" : "ptr"
        pfContinueProcessingMarshal := pfContinueProcessing is VarRef ? "int*" : "ptr"

        result := ComCall(0, this, pvTaskDataMarshal, pvTaskData, pfContinueProcessingMarshal, pfContinueProcessing, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
