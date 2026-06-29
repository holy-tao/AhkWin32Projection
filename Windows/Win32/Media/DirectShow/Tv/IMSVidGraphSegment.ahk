#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IEnumFilters.ahk" { IEnumFilters }
#Import ".\MSVidSegmentType.ahk" { MSVidSegmentType }
#Import ".\IMSVidGraphSegmentContainer.ahk" { IMSVidGraphSegmentContainer }
#Import "..\..\..\System\Com\IPersist.ahk" { IPersist }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidGraphSegment extends IPersist {
    /**
     * The interface identifier for IMSVidGraphSegment
     * @type {Guid}
     */
    static IID := Guid("{238dec54-adeb-4005-a349-f772b9afebc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidGraphSegment interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        get_Init      : IntPtr
        put_Init      : IntPtr
        EnumFilters   : IntPtr
        get_Container : IntPtr
        put_Container : IntPtr
        get_Type      : IntPtr
        get_Category  : IntPtr
        Build         : IntPtr
        PostBuild     : IntPtr
        PreRun        : IntPtr
        PostRun       : IntPtr
        PreStop       : IntPtr
        PostStop      : IntPtr
        OnEventNotify : IntPtr
        Decompose     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidGraphSegment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    Init {
        get => this.get_Init()
        set => this.put_Init(value)
    }

    /**
     * @type {IMSVidGraphSegmentContainer} 
     */
    Container {
        get => this.get_Container()
        set => this.put_Container(value)
    }

    /**
     * @type {MSVidSegmentType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Guid} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Init() {
        result := ComCall(4, this, "ptr*", &pInit := 0, "HRESULT")
        return IUnknown(pInit)
    }

    /**
     * 
     * @param {IUnknown} pInit 
     * @returns {HRESULT} 
     */
    put_Init(pInit) {
        result := ComCall(5, this, "ptr", pInit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumFilters} 
     */
    EnumFilters() {
        result := ComCall(6, this, "ptr*", &pNewEnum := 0, "HRESULT")
        return IEnumFilters(pNewEnum)
    }

    /**
     * 
     * @returns {IMSVidGraphSegmentContainer} 
     */
    get_Container() {
        result := ComCall(7, this, "ptr*", &ppCtl := 0, "HRESULT")
        return IMSVidGraphSegmentContainer(ppCtl)
    }

    /**
     * 
     * @param {IMSVidGraphSegmentContainer} pCtl 
     * @returns {HRESULT} 
     */
    put_Container(pCtl) {
        result := ComCall(8, this, "ptr", pCtl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {MSVidSegmentType} 
     */
    get_Type() {
        result := ComCall(9, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Category() {
        pGuid := Guid()
        result := ComCall(10, this, Guid.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Build() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostBuild() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreRun() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostRun() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreStop() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostStop() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEventCode 
     * @param {Pointer} lEventParm1 
     * @param {Pointer} lEventParm2 
     * @returns {HRESULT} 
     */
    OnEventNotify(lEventCode, lEventParm1, lEventParm2) {
        result := ComCall(17, this, "int", lEventCode, "ptr", lEventParm1, "ptr", lEventParm2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Decompose() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidGraphSegment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Init := CallbackCreate(GetMethod(implObj, "get_Init"), flags, 2)
        this.vtbl.put_Init := CallbackCreate(GetMethod(implObj, "put_Init"), flags, 2)
        this.vtbl.EnumFilters := CallbackCreate(GetMethod(implObj, "EnumFilters"), flags, 2)
        this.vtbl.get_Container := CallbackCreate(GetMethod(implObj, "get_Container"), flags, 2)
        this.vtbl.put_Container := CallbackCreate(GetMethod(implObj, "put_Container"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Category := CallbackCreate(GetMethod(implObj, "get_Category"), flags, 2)
        this.vtbl.Build := CallbackCreate(GetMethod(implObj, "Build"), flags, 1)
        this.vtbl.PostBuild := CallbackCreate(GetMethod(implObj, "PostBuild"), flags, 1)
        this.vtbl.PreRun := CallbackCreate(GetMethod(implObj, "PreRun"), flags, 1)
        this.vtbl.PostRun := CallbackCreate(GetMethod(implObj, "PostRun"), flags, 1)
        this.vtbl.PreStop := CallbackCreate(GetMethod(implObj, "PreStop"), flags, 1)
        this.vtbl.PostStop := CallbackCreate(GetMethod(implObj, "PostStop"), flags, 1)
        this.vtbl.OnEventNotify := CallbackCreate(GetMethod(implObj, "OnEventNotify"), flags, 4)
        this.vtbl.Decompose := CallbackCreate(GetMethod(implObj, "Decompose"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Init)
        CallbackFree(this.vtbl.put_Init)
        CallbackFree(this.vtbl.EnumFilters)
        CallbackFree(this.vtbl.get_Container)
        CallbackFree(this.vtbl.put_Container)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Category)
        CallbackFree(this.vtbl.Build)
        CallbackFree(this.vtbl.PostBuild)
        CallbackFree(this.vtbl.PreRun)
        CallbackFree(this.vtbl.PostRun)
        CallbackFree(this.vtbl.PreStop)
        CallbackFree(this.vtbl.PostStop)
        CallbackFree(this.vtbl.OnEventNotify)
        CallbackFree(this.vtbl.Decompose)
    }
}
