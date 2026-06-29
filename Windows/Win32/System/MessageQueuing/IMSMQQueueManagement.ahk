#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQManagement.ahk" { IMSMQManagement }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueueManagement extends IMSMQManagement {
    /**
     * The interface identifier for IMSMQQueueManagement
     * @type {Guid}
     */
    static IID := Guid("{7fbe7759-5760-444d-b8a5-5e7ab9a84cce}")

    /**
     * The class identifier for MSMQQueueManagement
     * @type {Guid}
     */
    static CLSID := Guid("{33b6d07e-f27d-42fa-b2d7-bf82e11e9374}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueueManagement interfaces
    */
    struct Vtbl extends IMSMQManagement.Vtbl {
        get_JournalMessageCount : IntPtr
        get_BytesInJournal      : IntPtr
        EodGetReceiveInfo       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueueManagement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    JournalMessageCount {
        get => this.get_JournalMessageCount()
    }

    /**
     * @type {VARIANT} 
     */
    BytesInJournal {
        get => this.get_BytesInJournal()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_JournalMessageCount() {
        result := ComCall(16, this, "int*", &plJournalMessageCount := 0, "HRESULT")
        return plJournalMessageCount
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BytesInJournal() {
        pvBytesInJournal := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pvBytesInJournal, "HRESULT")
        return pvBytesInJournal
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    EodGetReceiveInfo() {
        pvCollection := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, pvCollection, "HRESULT")
        return pvCollection
    }

    Query(iid) {
        if (IMSMQQueueManagement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_JournalMessageCount := CallbackCreate(GetMethod(implObj, "get_JournalMessageCount"), flags, 2)
        this.vtbl.get_BytesInJournal := CallbackCreate(GetMethod(implObj, "get_BytesInJournal"), flags, 2)
        this.vtbl.EodGetReceiveInfo := CallbackCreate(GetMethod(implObj, "EodGetReceiveInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_JournalMessageCount)
        CallbackFree(this.vtbl.get_BytesInJournal)
        CallbackFree(this.vtbl.EodGetReceiveInfo)
    }
}
