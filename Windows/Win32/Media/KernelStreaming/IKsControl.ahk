#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsControl extends IUnknown {
    /**
     * The interface identifier for IKsControl
     * @type {Guid}
     */
    static IID := Guid("{28f54685-06fd-11d2-b27a-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsProperty : IntPtr
        KsMethod   : IntPtr
        KsEvent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} _Property 
     * @param {Integer} PropertyLength 
     * @param {Pointer<Void>} PropertyData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsProperty(_Property, PropertyLength, PropertyData, DataLength) {
        PropertyDataMarshal := PropertyData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, KSIDENTIFIER.Ptr, _Property, "uint", PropertyLength, PropertyDataMarshal, PropertyData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Method 
     * @param {Integer} MethodLength 
     * @param {Pointer<Void>} _MethodData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsMethod(Method, MethodLength, _MethodData, DataLength) {
        _MethodDataMarshal := _MethodData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, KSIDENTIFIER.Ptr, Method, "uint", MethodLength, _MethodDataMarshal, _MethodData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} Event 
     * @param {Integer} EventLength 
     * @param {Pointer<Void>} EventData 
     * @param {Integer} DataLength 
     * @returns {Integer} 
     */
    KsEvent(Event, EventLength, EventData, DataLength) {
        EventDataMarshal := EventData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, KSIDENTIFIER.Ptr, Event, "uint", EventLength, EventDataMarshal, EventData, "uint", DataLength, "uint*", &BytesReturned := 0, "HRESULT")
        return BytesReturned
    }

    Query(iid) {
        if (IKsControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsProperty := CallbackCreate(GetMethod(implObj, "KsProperty"), flags, 6)
        this.vtbl.KsMethod := CallbackCreate(GetMethod(implObj, "KsMethod"), flags, 6)
        this.vtbl.KsEvent := CallbackCreate(GetMethod(implObj, "KsEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsProperty)
        CallbackFree(this.vtbl.KsMethod)
        CallbackFree(this.vtbl.KsEvent)
    }
}
