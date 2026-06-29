#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct IXAudio2Extension extends IUnknown {
    /**
     * The interface identifier for IXAudio2Extension
     * @type {Guid}
     */
    static IID := Guid("{84ac29bb-d619-44d2-b197-e4acf7df3ed6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXAudio2Extension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProcessingQuantum : IntPtr
        GetProcessor         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXAudio2Extension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} quantumNumerator 
     * @param {Pointer<Integer>} quantumDenominator 
     * @returns {String} Nothing - always returns an empty string
     */
    GetProcessingQuantum(quantumNumerator, quantumDenominator) {
        quantumNumeratorMarshal := quantumNumerator is VarRef ? "uint*" : "ptr"
        quantumDenominatorMarshal := quantumDenominator is VarRef ? "uint*" : "ptr"

        ComCall(3, this, quantumNumeratorMarshal, quantumNumerator, quantumDenominatorMarshal, quantumDenominator)
    }

    /**
     * 
     * @param {Pointer<Integer>} processor 
     * @returns {String} Nothing - always returns an empty string
     */
    GetProcessor(processor) {
        processorMarshal := processor is VarRef ? "uint*" : "ptr"

        ComCall(4, this, processorMarshal, processor)
    }

    Query(iid) {
        if (IXAudio2Extension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProcessingQuantum := CallbackCreate(GetMethod(implObj, "GetProcessingQuantum"), flags, 3)
        this.vtbl.GetProcessor := CallbackCreate(GetMethod(implObj, "GetProcessor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProcessingQuantum)
        CallbackFree(this.vtbl.GetProcessor)
    }
}
