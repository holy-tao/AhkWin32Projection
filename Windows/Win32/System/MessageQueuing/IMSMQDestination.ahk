#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQDestination extends IDispatch {
    /**
     * The interface identifier for IMSMQDestination
     * @type {Guid}
     */
    static IID := Guid("{eba96b16-2168-11d3-898c-00e02c074f6b}")

    /**
     * The class identifier for MSMQDestination
     * @type {Guid}
     */
    static CLSID := Guid("{eba96b18-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQDestination interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Open                : IntPtr
        Close               : IntPtr
        get_IsOpen          : IntPtr
        get_IADs            : IntPtr
        putref_IADs         : IntPtr
        get_ADsPath         : IntPtr
        put_ADsPath         : IntPtr
        get_PathName        : IntPtr
        put_PathName        : IntPtr
        get_FormatName      : IntPtr
        put_FormatName      : IntPtr
        get_Destinations    : IntPtr
        putref_Destinations : IntPtr
        get_Properties      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQDestination.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * @type {IDispatch} 
     */
    IADs {
        get => this.get_IADs()
    }

    /**
     * @type {BSTR} 
     */
    ADsPath {
        get => this.get_ADsPath()
        set => this.put_ADsPath(value)
    }

    /**
     * @type {BSTR} 
     */
    PathName {
        get => this.get_PathName()
        set => this.put_PathName(value)
    }

    /**
     * @type {BSTR} 
     */
    FormatName {
        get => this.get_FormatName()
        set => this.put_FormatName(value)
    }

    /**
     * @type {IDispatch} 
     */
    Destinations {
        get => this.get_Destinations()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsOpen() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pfIsOpen := 0, "HRESULT")
        return pfIsOpen
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_IADs() {
        result := ComCall(10, this, "ptr*", &ppIADs := 0, "HRESULT")
        return IDispatch(ppIADs)
    }

    /**
     * 
     * @param {IDispatch} pIADs 
     * @returns {HRESULT} 
     */
    putref_IADs(pIADs) {
        result := ComCall(11, this, "ptr", pIADs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ADsPath() {
        pbstrADsPath := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrADsPath, "HRESULT")
        return pbstrADsPath
    }

    /**
     * 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    put_ADsPath(bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(13, this, BSTR, bstrADsPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PathName() {
        pbstrPathName := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrPathName, "HRESULT")
        return pbstrPathName
    }

    /**
     * 
     * @param {BSTR} bstrPathName 
     * @returns {HRESULT} 
     */
    put_PathName(bstrPathName) {
        bstrPathName := bstrPathName is String ? BSTR.Alloc(bstrPathName).Value : bstrPathName

        result := ComCall(15, this, BSTR, bstrPathName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FormatName() {
        pbstrFormatName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrFormatName, "HRESULT")
        return pbstrFormatName
    }

    /**
     * 
     * @param {BSTR} bstrFormatName 
     * @returns {HRESULT} 
     */
    put_FormatName(bstrFormatName) {
        bstrFormatName := bstrFormatName is String ? BSTR.Alloc(bstrFormatName).Value : bstrFormatName

        result := ComCall(17, this, BSTR, bstrFormatName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Destinations() {
        result := ComCall(18, this, "ptr*", &ppDestinations := 0, "HRESULT")
        return IDispatch(ppDestinations)
    }

    /**
     * 
     * @param {IDispatch} pDestinations 
     * @returns {HRESULT} 
     */
    putref_Destinations(pDestinations) {
        result := ComCall(19, this, "ptr", pDestinations, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(20, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    Query(iid) {
        if (IMSMQDestination.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 1)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.get_IsOpen := CallbackCreate(GetMethod(implObj, "get_IsOpen"), flags, 2)
        this.vtbl.get_IADs := CallbackCreate(GetMethod(implObj, "get_IADs"), flags, 2)
        this.vtbl.putref_IADs := CallbackCreate(GetMethod(implObj, "putref_IADs"), flags, 2)
        this.vtbl.get_ADsPath := CallbackCreate(GetMethod(implObj, "get_ADsPath"), flags, 2)
        this.vtbl.put_ADsPath := CallbackCreate(GetMethod(implObj, "put_ADsPath"), flags, 2)
        this.vtbl.get_PathName := CallbackCreate(GetMethod(implObj, "get_PathName"), flags, 2)
        this.vtbl.put_PathName := CallbackCreate(GetMethod(implObj, "put_PathName"), flags, 2)
        this.vtbl.get_FormatName := CallbackCreate(GetMethod(implObj, "get_FormatName"), flags, 2)
        this.vtbl.put_FormatName := CallbackCreate(GetMethod(implObj, "put_FormatName"), flags, 2)
        this.vtbl.get_Destinations := CallbackCreate(GetMethod(implObj, "get_Destinations"), flags, 2)
        this.vtbl.putref_Destinations := CallbackCreate(GetMethod(implObj, "putref_Destinations"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.get_IsOpen)
        CallbackFree(this.vtbl.get_IADs)
        CallbackFree(this.vtbl.putref_IADs)
        CallbackFree(this.vtbl.get_ADsPath)
        CallbackFree(this.vtbl.put_ADsPath)
        CallbackFree(this.vtbl.get_PathName)
        CallbackFree(this.vtbl.put_PathName)
        CallbackFree(this.vtbl.get_FormatName)
        CallbackFree(this.vtbl.put_FormatName)
        CallbackFree(this.vtbl.get_Destinations)
        CallbackFree(this.vtbl.putref_Destinations)
        CallbackFree(this.vtbl.get_Properties)
    }
}
