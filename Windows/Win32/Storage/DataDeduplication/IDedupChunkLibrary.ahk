#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct IDedupChunkLibrary extends IUnknown {
    /**
     * The interface identifier for IDedupChunkLibrary
     * @type {Guid}
     */
    static IID := Guid("{bb5144d7-2720-4dcc-8777-78597416ec23}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDedupChunkLibrary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeForPushBuffers : IntPtr
        Uninitialize             : IntPtr
        SetParameter             : IntPtr
        StartChunking            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDedupChunkLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeForPushBuffers() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Uninitialize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamType 
     * @param {VARIANT} vParamValue 
     * @returns {HRESULT} 
     */
    SetParameter(dwParamType, vParamValue) {
        result := ComCall(5, this, "uint", dwParamType, VARIANT, vParamValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} iidIteratorInterfaceID 
     * @returns {IUnknown} 
     */
    StartChunking(iidIteratorInterfaceID) {
        result := ComCall(6, this, Guid, iidIteratorInterfaceID, "ptr*", &ppChunksEnum := 0, "HRESULT")
        return IUnknown(ppChunksEnum)
    }

    Query(iid) {
        if (IDedupChunkLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeForPushBuffers := CallbackCreate(GetMethod(implObj, "InitializeForPushBuffers"), flags, 1)
        this.vtbl.Uninitialize := CallbackCreate(GetMethod(implObj, "Uninitialize"), flags, 1)
        this.vtbl.SetParameter := CallbackCreate(GetMethod(implObj, "SetParameter"), flags, 3)
        this.vtbl.StartChunking := CallbackCreate(GetMethod(implObj, "StartChunking"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeForPushBuffers)
        CallbackFree(this.vtbl.Uninitialize)
        CallbackFree(this.vtbl.SetParameter)
        CallbackFree(this.vtbl.StartChunking)
    }
}
