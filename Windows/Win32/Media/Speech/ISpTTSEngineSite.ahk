#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPVSKIPTYPE.ahk" { SPVSKIPTYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpEventSink.ahk" { ISpEventSink }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpTTSEngineSite extends ISpEventSink {
    /**
     * The interface identifier for ISpTTSEngineSite
     * @type {Guid}
     */
    static IID := Guid("{9880499b-cce9-11d2-b503-00c04f797396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpTTSEngineSite interfaces
    */
    struct Vtbl extends ISpEventSink.Vtbl {
        GetActions   : IntPtr
        Write        : IntPtr
        GetRate      : IntPtr
        GetVolume    : IntPtr
        GetSkipInfo  : IntPtr
        CompleteSkip : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpTTSEngineSite.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActions() {
        result := ComCall(5, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} cb 
     * @returns {Integer} 
     */
    Write(pBuff, cb) {
        pBuffMarshal := pBuff is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pBuffMarshal, pBuff, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRate() {
        result := ComCall(7, this, "int*", &pRateAdjust := 0, "HRESULT")
        return pRateAdjust
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVolume() {
        result := ComCall(8, this, "ushort*", &pusVolume := 0, "HRESULT")
        return pusVolume
    }

    /**
     * 
     * @param {Pointer<SPVSKIPTYPE>} peType 
     * @param {Pointer<Integer>} plNumItems 
     * @returns {HRESULT} 
     */
    GetSkipInfo(peType, plNumItems) {
        peTypeMarshal := peType is VarRef ? "int*" : "ptr"
        plNumItemsMarshal := plNumItems is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, peTypeMarshal, peType, plNumItemsMarshal, plNumItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulNumSkipped 
     * @returns {HRESULT} 
     */
    CompleteSkip(ulNumSkipped) {
        result := ComCall(10, this, "int", ulNumSkipped, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpTTSEngineSite.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActions := CallbackCreate(GetMethod(implObj, "GetActions"), flags, 1)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.GetRate := CallbackCreate(GetMethod(implObj, "GetRate"), flags, 2)
        this.vtbl.GetVolume := CallbackCreate(GetMethod(implObj, "GetVolume"), flags, 2)
        this.vtbl.GetSkipInfo := CallbackCreate(GetMethod(implObj, "GetSkipInfo"), flags, 3)
        this.vtbl.CompleteSkip := CallbackCreate(GetMethod(implObj, "CompleteSkip"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActions)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.GetRate)
        CallbackFree(this.vtbl.GetVolume)
        CallbackFree(this.vtbl.GetSkipInfo)
        CallbackFree(this.vtbl.CompleteSkip)
    }
}
