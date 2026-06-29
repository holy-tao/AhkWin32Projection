#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IFilterInfo extends IDispatch {
    /**
     * The interface identifier for IFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{56a868ba-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        FindPin          : IntPtr
        get_Name         : IntPtr
        get_VendorInfo   : IntPtr
        get_Filter       : IntPtr
        get_Pins         : IntPtr
        get_IsFileSource : IntPtr
        get_Filename     : IntPtr
        put_Filename     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    VendorInfo {
        get => this.get_VendorInfo()
    }

    /**
     * @type {IUnknown} 
     */
    Filter {
        get => this.get_Filter()
    }

    /**
     * @type {IDispatch} 
     */
    Pins {
        get => this.get_Pins()
    }

    /**
     * @type {Integer} 
     */
    IsFileSource {
        get => this.get_IsFileSource()
    }

    /**
     * @type {BSTR} 
     */
    Filename {
        get => this.get_Filename()
        set => this.put_Filename(value)
    }

    /**
     * 
     * @param {BSTR} strPinID 
     * @returns {IDispatch} 
     */
    FindPin(strPinID) {
        strPinID := strPinID is String ? BSTR.Alloc(strPinID).Value : strPinID

        result := ComCall(7, this, BSTR, strPinID, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VendorInfo() {
        strVendorInfo := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strVendorInfo, "HRESULT")
        return strVendorInfo
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_Filter() {
        result := ComCall(10, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Pins() {
        result := ComCall(11, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsFileSource() {
        result := ComCall(12, this, "int*", &pbIsSource := 0, "HRESULT")
        return pbIsSource
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Filename() {
        pstrFilename := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pstrFilename, "HRESULT")
        return pstrFilename
    }

    /**
     * 
     * @param {BSTR} strFilename 
     * @returns {HRESULT} 
     */
    put_Filename(strFilename) {
        strFilename := strFilename is String ? BSTR.Alloc(strFilename).Value : strFilename

        result := ComCall(14, this, BSTR, strFilename, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindPin := CallbackCreate(GetMethod(implObj, "FindPin"), flags, 3)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_VendorInfo := CallbackCreate(GetMethod(implObj, "get_VendorInfo"), flags, 2)
        this.vtbl.get_Filter := CallbackCreate(GetMethod(implObj, "get_Filter"), flags, 2)
        this.vtbl.get_Pins := CallbackCreate(GetMethod(implObj, "get_Pins"), flags, 2)
        this.vtbl.get_IsFileSource := CallbackCreate(GetMethod(implObj, "get_IsFileSource"), flags, 2)
        this.vtbl.get_Filename := CallbackCreate(GetMethod(implObj, "get_Filename"), flags, 2)
        this.vtbl.put_Filename := CallbackCreate(GetMethod(implObj, "put_Filename"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindPin)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_VendorInfo)
        CallbackFree(this.vtbl.get_Filter)
        CallbackFree(this.vtbl.get_Pins)
        CallbackFree(this.vtbl.get_IsFileSource)
        CallbackFree(this.vtbl.get_Filename)
        CallbackFree(this.vtbl.put_Filename)
    }
}
