#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpSerializeState extends IUnknown {
    /**
     * The interface identifier for ISpSerializeState
     * @type {Guid}
     */
    static IID := Guid("{21b501a0-0ec7-46c9-92c3-a2bc784c54b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpSerializeState interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSerializedState : IntPtr
        SetSerializedState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpSerializeState.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @param {Pointer<Integer>} pulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    GetSerializedState(ppbData, pulSize, dwReserved) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"
        pulSizeMarshal := pulSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppbDataMarshal, ppbData, pulSizeMarshal, pulSize, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbData 
     * @param {Integer} ulSize 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    SetSerializedState(pbData, ulSize, dwReserved) {
        pbDataMarshal := pbData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbDataMarshal, pbData, "uint", ulSize, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpSerializeState.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSerializedState := CallbackCreate(GetMethod(implObj, "GetSerializedState"), flags, 4)
        this.vtbl.SetSerializedState := CallbackCreate(GetMethod(implObj, "SetSerializedState"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSerializedState)
        CallbackFree(this.vtbl.SetSerializedState)
    }
}
