#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMPlayListItem extends IUnknown {
    /**
     * The interface identifier for IAMPlayListItem
     * @type {Guid}
     */
    static IID := Guid("{56a868ff-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMPlayListItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFlags                 : IntPtr
        GetSourceCount           : IntPtr
        GetSourceURL             : IntPtr
        GetSourceStart           : IntPtr
        GetSourceDuration        : IntPtr
        GetSourceStartMarker     : IntPtr
        GetSourceEndMarker       : IntPtr
        GetSourceStartMarkerName : IntPtr
        GetSourceEndMarkerName   : IntPtr
        GetLinkURL               : IntPtr
        GetScanDuration          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMPlayListItem.Vtbl()
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
    GetSourceCount() {
        result := ComCall(4, this, "uint*", &pdwSources := 0, "HRESULT")
        return pdwSources
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceURL(dwSourceIndex) {
        pbstrURL := BSTR.Owned()
        result := ComCall(5, this, "uint", dwSourceIndex, BSTR.Ptr, pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceStart(dwSourceIndex) {
        result := ComCall(6, this, "uint", dwSourceIndex, "int64*", &prtStart := 0, "HRESULT")
        return prtStart
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceDuration(dwSourceIndex) {
        result := ComCall(7, this, "uint", dwSourceIndex, "int64*", &prtDuration := 0, "HRESULT")
        return prtDuration
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceStartMarker(dwSourceIndex) {
        result := ComCall(8, this, "uint", dwSourceIndex, "uint*", &pdwMarker := 0, "HRESULT")
        return pdwMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceEndMarker(dwSourceIndex) {
        result := ComCall(9, this, "uint", dwSourceIndex, "uint*", &pdwMarker := 0, "HRESULT")
        return pdwMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceStartMarkerName(dwSourceIndex) {
        pbstrStartMarker := BSTR.Owned()
        result := ComCall(10, this, "uint", dwSourceIndex, BSTR.Ptr, pbstrStartMarker, "HRESULT")
        return pbstrStartMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceEndMarkerName(dwSourceIndex) {
        pbstrEndMarker := BSTR.Owned()
        result := ComCall(11, this, "uint", dwSourceIndex, BSTR.Ptr, pbstrEndMarker, "HRESULT")
        return pbstrEndMarker
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetLinkURL() {
        pbstrURL := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetScanDuration(dwSourceIndex) {
        result := ComCall(13, this, "uint", dwSourceIndex, "int64*", &prtScanDuration := 0, "HRESULT")
        return prtScanDuration
    }

    Query(iid) {
        if (IAMPlayListItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.GetSourceCount := CallbackCreate(GetMethod(implObj, "GetSourceCount"), flags, 2)
        this.vtbl.GetSourceURL := CallbackCreate(GetMethod(implObj, "GetSourceURL"), flags, 3)
        this.vtbl.GetSourceStart := CallbackCreate(GetMethod(implObj, "GetSourceStart"), flags, 3)
        this.vtbl.GetSourceDuration := CallbackCreate(GetMethod(implObj, "GetSourceDuration"), flags, 3)
        this.vtbl.GetSourceStartMarker := CallbackCreate(GetMethod(implObj, "GetSourceStartMarker"), flags, 3)
        this.vtbl.GetSourceEndMarker := CallbackCreate(GetMethod(implObj, "GetSourceEndMarker"), flags, 3)
        this.vtbl.GetSourceStartMarkerName := CallbackCreate(GetMethod(implObj, "GetSourceStartMarkerName"), flags, 3)
        this.vtbl.GetSourceEndMarkerName := CallbackCreate(GetMethod(implObj, "GetSourceEndMarkerName"), flags, 3)
        this.vtbl.GetLinkURL := CallbackCreate(GetMethod(implObj, "GetLinkURL"), flags, 2)
        this.vtbl.GetScanDuration := CallbackCreate(GetMethod(implObj, "GetScanDuration"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetSourceCount)
        CallbackFree(this.vtbl.GetSourceURL)
        CallbackFree(this.vtbl.GetSourceStart)
        CallbackFree(this.vtbl.GetSourceDuration)
        CallbackFree(this.vtbl.GetSourceStartMarker)
        CallbackFree(this.vtbl.GetSourceEndMarker)
        CallbackFree(this.vtbl.GetSourceStartMarkerName)
        CallbackFree(this.vtbl.GetSourceEndMarkerName)
        CallbackFree(this.vtbl.GetLinkURL)
        CallbackFree(this.vtbl.GetScanDuration)
    }
}
