#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionResourcePool.ahk" { ITransactionResourcePool }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to get the transaction resource pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactionproperty
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITransactionProperty extends IUnknown {
    /**
     * The interface identifier for ITransactionProperty
     * @type {Guid}
     */
    static IID := Guid("{788ea814-87b1-11d1-bba6-00c04fc2fa5f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reserved1                  : IntPtr
        Reserved2                  : IntPtr
        Reserved3                  : IntPtr
        Reserved4                  : IntPtr
        Reserved5                  : IntPtr
        Reserved6                  : IntPtr
        Reserved7                  : IntPtr
        Reserved8                  : IntPtr
        Reserved9                  : IntPtr
        GetTransactionResourcePool : IntPtr
        Reserved10                 : IntPtr
        Reserved11                 : IntPtr
        Reserved12                 : IntPtr
        Reserved13                 : IntPtr
        Reserved14                 : IntPtr
        Reserved15                 : IntPtr
        Reserved16                 : IntPtr
        Reserved17                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(3, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved2() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved3() {
        ComCall(5, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved4() {
        ComCall(6, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved5() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved6() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved7() {
        ComCall(9, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved8() {
        ComCall(10, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved9() {
        ComCall(11, this)
    }

    /**
     * Retrieves the resource pool that is associated with this context's transaction.
     * @returns {ITransactionResourcePool} A reference to the transaction resource pool.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionproperty-gettransactionresourcepool
     */
    GetTransactionResourcePool() {
        result := ComCall(12, this, "ptr*", &ppTxPool := 0, "HRESULT")
        return ITransactionResourcePool(ppTxPool)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved10() {
        ComCall(13, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved11() {
        ComCall(14, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved12() {
        ComCall(15, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved13() {
        ComCall(16, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved14() {
        ComCall(17, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved15() {
        ComCall(18, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved16() {
        ComCall(19, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved17() {
        ComCall(20, this)
    }

    Query(iid) {
        if (ITransactionProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reserved1 := CallbackCreate(GetMethod(implObj, "Reserved1"), flags, 1)
        this.vtbl.Reserved2 := CallbackCreate(GetMethod(implObj, "Reserved2"), flags, 1)
        this.vtbl.Reserved3 := CallbackCreate(GetMethod(implObj, "Reserved3"), flags, 1)
        this.vtbl.Reserved4 := CallbackCreate(GetMethod(implObj, "Reserved4"), flags, 1)
        this.vtbl.Reserved5 := CallbackCreate(GetMethod(implObj, "Reserved5"), flags, 1)
        this.vtbl.Reserved6 := CallbackCreate(GetMethod(implObj, "Reserved6"), flags, 1)
        this.vtbl.Reserved7 := CallbackCreate(GetMethod(implObj, "Reserved7"), flags, 1)
        this.vtbl.Reserved8 := CallbackCreate(GetMethod(implObj, "Reserved8"), flags, 1)
        this.vtbl.Reserved9 := CallbackCreate(GetMethod(implObj, "Reserved9"), flags, 1)
        this.vtbl.GetTransactionResourcePool := CallbackCreate(GetMethod(implObj, "GetTransactionResourcePool"), flags, 2)
        this.vtbl.Reserved10 := CallbackCreate(GetMethod(implObj, "Reserved10"), flags, 1)
        this.vtbl.Reserved11 := CallbackCreate(GetMethod(implObj, "Reserved11"), flags, 1)
        this.vtbl.Reserved12 := CallbackCreate(GetMethod(implObj, "Reserved12"), flags, 1)
        this.vtbl.Reserved13 := CallbackCreate(GetMethod(implObj, "Reserved13"), flags, 1)
        this.vtbl.Reserved14 := CallbackCreate(GetMethod(implObj, "Reserved14"), flags, 1)
        this.vtbl.Reserved15 := CallbackCreate(GetMethod(implObj, "Reserved15"), flags, 1)
        this.vtbl.Reserved16 := CallbackCreate(GetMethod(implObj, "Reserved16"), flags, 1)
        this.vtbl.Reserved17 := CallbackCreate(GetMethod(implObj, "Reserved17"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reserved1)
        CallbackFree(this.vtbl.Reserved2)
        CallbackFree(this.vtbl.Reserved3)
        CallbackFree(this.vtbl.Reserved4)
        CallbackFree(this.vtbl.Reserved5)
        CallbackFree(this.vtbl.Reserved6)
        CallbackFree(this.vtbl.Reserved7)
        CallbackFree(this.vtbl.Reserved8)
        CallbackFree(this.vtbl.Reserved9)
        CallbackFree(this.vtbl.GetTransactionResourcePool)
        CallbackFree(this.vtbl.Reserved10)
        CallbackFree(this.vtbl.Reserved11)
        CallbackFree(this.vtbl.Reserved12)
        CallbackFree(this.vtbl.Reserved13)
        CallbackFree(this.vtbl.Reserved14)
        CallbackFree(this.vtbl.Reserved15)
        CallbackFree(this.vtbl.Reserved16)
        CallbackFree(this.vtbl.Reserved17)
    }
}
