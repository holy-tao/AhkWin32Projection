#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMBackgroundServiceAgentInfo extends IUnknown {
    /**
     * The interface identifier for IPMBackgroundServiceAgentInfo
     * @type {Guid}
     */
    static IID := Guid("{3a8b46da-928c-4879-998c-09dc96f3d490}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMBackgroundServiceAgentInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID         : IntPtr
        get_TaskID            : IntPtr
        get_BSAID             : IntPtr
        get_BGSpecifier       : IntPtr
        get_BGName            : IntPtr
        get_BGSource          : IntPtr
        get_BGType            : IntPtr
        get_IsPeriodic        : IntPtr
        get_IsScheduled       : IntPtr
        get_IsScheduleAllowed : IntPtr
        get_Description       : IntPtr
        get_IsLaunchOnBoot    : IntPtr
        set_IsScheduled       : IntPtr
        set_IsScheduleAllowed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMBackgroundServiceAgentInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     */
    TaskID {
        get => this.get_TaskID()
    }

    /**
     * @type {Integer} 
     */
    BSAID {
        get => this.get_BSAID()
    }

    /**
     */
    BGSpecifier {
        get => this.get_BGSpecifier()
    }

    /**
     */
    BGName {
        get => this.get_BGName()
    }

    /**
     */
    BGSource {
        get => this.get_BGSource()
    }

    /**
     */
    BGType {
        get => this.get_BGType()
    }

    /**
     * @type {BOOL} 
     */
    IsPeriodic {
        get => this.get_IsPeriodic()
    }

    /**
     * @type {BOOL} 
     */
    IsScheduled {
        get => this.get_IsScheduled()
    }

    /**
     * @type {BOOL} 
     */
    IsScheduleAllowed {
        get => this.get_IsScheduleAllowed()
    }

    /**
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {BOOL} 
     */
    IsLaunchOnBoot {
        get => this.get_IsLaunchOnBoot()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTaskID 
     * @returns {HRESULT} 
     */
    get_TaskID(pTaskID) {
        result := ComCall(4, this, BSTR.Ptr, pTaskID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BSAID() {
        result := ComCall(5, this, "uint*", &pBSAID := 0, "HRESULT")
        return pBSAID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGSpecifier 
     * @returns {HRESULT} 
     */
    get_BGSpecifier(pBGSpecifier) {
        result := ComCall(6, this, BSTR.Ptr, pBGSpecifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGName 
     * @returns {HRESULT} 
     */
    get_BGName(pBGName) {
        result := ComCall(7, this, BSTR.Ptr, pBGName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGSource 
     * @returns {HRESULT} 
     */
    get_BGSource(pBGSource) {
        result := ComCall(8, this, BSTR.Ptr, pBGSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBGType 
     * @returns {HRESULT} 
     */
    get_BGType(pBGType) {
        result := ComCall(9, this, BSTR.Ptr, pBGType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsPeriodic() {
        result := ComCall(10, this, BOOL.Ptr, &pIsPeriodic := 0, "HRESULT")
        return pIsPeriodic
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsScheduled() {
        result := ComCall(11, this, BOOL.Ptr, &pIsScheduled := 0, "HRESULT")
        return pIsScheduled
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsScheduleAllowed() {
        result := ComCall(12, this, BOOL.Ptr, &pIsScheduleAllowed := 0, "HRESULT")
        return pIsScheduleAllowed
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(13, this, BSTR.Ptr, pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsLaunchOnBoot() {
        result := ComCall(14, this, BOOL.Ptr, &pLaunchOnBoot := 0, "HRESULT")
        return pLaunchOnBoot
    }

    /**
     * 
     * @param {BOOL} IsScheduled 
     * @returns {HRESULT} 
     */
    set_IsScheduled(IsScheduled) {
        result := ComCall(15, this, BOOL, IsScheduled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsScheduleAllowed 
     * @returns {HRESULT} 
     */
    set_IsScheduleAllowed(IsScheduleAllowed) {
        result := ComCall(16, this, BOOL, IsScheduleAllowed, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMBackgroundServiceAgentInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_TaskID := CallbackCreate(GetMethod(implObj, "get_TaskID"), flags, 2)
        this.vtbl.get_BSAID := CallbackCreate(GetMethod(implObj, "get_BSAID"), flags, 2)
        this.vtbl.get_BGSpecifier := CallbackCreate(GetMethod(implObj, "get_BGSpecifier"), flags, 2)
        this.vtbl.get_BGName := CallbackCreate(GetMethod(implObj, "get_BGName"), flags, 2)
        this.vtbl.get_BGSource := CallbackCreate(GetMethod(implObj, "get_BGSource"), flags, 2)
        this.vtbl.get_BGType := CallbackCreate(GetMethod(implObj, "get_BGType"), flags, 2)
        this.vtbl.get_IsPeriodic := CallbackCreate(GetMethod(implObj, "get_IsPeriodic"), flags, 2)
        this.vtbl.get_IsScheduled := CallbackCreate(GetMethod(implObj, "get_IsScheduled"), flags, 2)
        this.vtbl.get_IsScheduleAllowed := CallbackCreate(GetMethod(implObj, "get_IsScheduleAllowed"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_IsLaunchOnBoot := CallbackCreate(GetMethod(implObj, "get_IsLaunchOnBoot"), flags, 2)
        this.vtbl.set_IsScheduled := CallbackCreate(GetMethod(implObj, "set_IsScheduled"), flags, 2)
        this.vtbl.set_IsScheduleAllowed := CallbackCreate(GetMethod(implObj, "set_IsScheduleAllowed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_TaskID)
        CallbackFree(this.vtbl.get_BSAID)
        CallbackFree(this.vtbl.get_BGSpecifier)
        CallbackFree(this.vtbl.get_BGName)
        CallbackFree(this.vtbl.get_BGSource)
        CallbackFree(this.vtbl.get_BGType)
        CallbackFree(this.vtbl.get_IsPeriodic)
        CallbackFree(this.vtbl.get_IsScheduled)
        CallbackFree(this.vtbl.get_IsScheduleAllowed)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_IsLaunchOnBoot)
        CallbackFree(this.vtbl.set_IsScheduled)
        CallbackFree(this.vtbl.set_IsScheduleAllowed)
    }
}
