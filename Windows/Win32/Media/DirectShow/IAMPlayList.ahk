#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAMPlayListItem.ahk" { IAMPlayListItem }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMPlayList extends IUnknown {
    /**
     * The interface identifier for IAMPlayList
     * @type {Guid}
     */
    static IID := Guid("{56a868fe-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMPlayList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFlags      : IntPtr
        GetItemCount  : IntPtr
        GetItem       : IntPtr
        GetNamedEvent : IntPtr
        GetRepeatInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMPlayList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(3, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetItemCount() {
        result := ComCall(4, this, "uint*", &pdwItems := 0, "HRESULT")
        return pdwItems
    }

    /**
     * 
     * @param {Integer} dwItemIndex 
     * @returns {IAMPlayListItem} 
     */
    GetItem(dwItemIndex) {
        result := ComCall(5, this, "uint", dwItemIndex, "ptr*", &ppItem := 0, "HRESULT")
        return IAMPlayListItem(ppItem)
    }

    /**
     * 
     * @param {PWSTR} pwszEventName 
     * @param {Integer} dwItemIndex 
     * @param {Pointer<IAMPlayListItem>} ppItem 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetNamedEvent(pwszEventName, dwItemIndex, ppItem, pdwFlags) {
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszEventName, "uint", dwItemIndex, IAMPlayListItem.Ptr, ppItem, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRepeatCount 
     * @param {Pointer<Integer>} pdwRepeatStart 
     * @param {Pointer<Integer>} pdwRepeatEnd 
     * @returns {HRESULT} 
     */
    GetRepeatInfo(pdwRepeatCount, pdwRepeatStart, pdwRepeatEnd) {
        pdwRepeatCountMarshal := pdwRepeatCount is VarRef ? "uint*" : "ptr"
        pdwRepeatStartMarshal := pdwRepeatStart is VarRef ? "uint*" : "ptr"
        pdwRepeatEndMarshal := pdwRepeatEnd is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwRepeatCountMarshal, pdwRepeatCount, pdwRepeatStartMarshal, pdwRepeatStart, pdwRepeatEndMarshal, pdwRepeatEnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMPlayList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.GetItemCount := CallbackCreate(GetMethod(implObj, "GetItemCount"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
        this.vtbl.GetNamedEvent := CallbackCreate(GetMethod(implObj, "GetNamedEvent"), flags, 5)
        this.vtbl.GetRepeatInfo := CallbackCreate(GetMethod(implObj, "GetRepeatInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetItemCount)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.GetNamedEvent)
        CallbackFree(this.vtbl.GetRepeatInfo)
    }
}
