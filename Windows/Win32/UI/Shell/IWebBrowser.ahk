#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IWebBrowser extends IDispatch {
    /**
     * The interface identifier for IWebBrowser
     * @type {Guid}
     */
    static IID := Guid("{eab22ac1-30c1-11cf-a7eb-0000c05bae0b}")

    /**
     * The class identifier for WebBrowser
     * @type {Guid}
     */
    static CLSID := Guid("{8856f961-340a-11d0-a96b-00c04fd705a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebBrowser interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GoBack                : IntPtr
        GoForward             : IntPtr
        GoHome                : IntPtr
        GoSearch              : IntPtr
        Navigate              : IntPtr
        Refresh               : IntPtr
        Refresh2              : IntPtr
        Stop                  : IntPtr
        get_Application       : IntPtr
        get_Parent            : IntPtr
        get_Container         : IntPtr
        get_Document          : IntPtr
        get_TopLevelContainer : IntPtr
        get_Type              : IntPtr
        get_Left              : IntPtr
        put_Left              : IntPtr
        get_Top               : IntPtr
        put_Top               : IntPtr
        get_Width             : IntPtr
        put_Width             : IntPtr
        get_Height            : IntPtr
        put_Height            : IntPtr
        get_LocationName      : IntPtr
        get_LocationURL       : IntPtr
        get_Busy              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebBrowser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {IDispatch} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * @type {IDispatch} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TopLevelContainer {
        get => this.get_TopLevelContainer()
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {BSTR} 
     */
    LocationName {
        get => this.get_LocationName()
    }

    /**
     * @type {BSTR} 
     */
    LocationURL {
        get => this.get_LocationURL()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Busy {
        get => this.get_Busy()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoBack() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoForward() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoHome() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {BSTR} URL 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} TargetFrameName 
     * @param {Pointer<VARIANT>} PostData 
     * @param {Pointer<VARIANT>} Headers 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(URL, Flags, TargetFrameName, PostData, Headers) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(11, this, BSTR, URL, VARIANT.Ptr, Flags, VARIANT.Ptr, TargetFrameName, VARIANT.Ptr, PostData, VARIANT.Ptr, Headers, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Level 
     * @returns {HRESULT} 
     */
    Refresh2(Level) {
        result := ComCall(13, this, VARIANT.Ptr, Level, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Application() {
        result := ComCall(15, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(16, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Container() {
        result := ComCall(17, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Document() {
        result := ComCall(18, this, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_TopLevelContainer() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        Type := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, Type, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Left() {
        result := ComCall(21, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Left 
     * @returns {HRESULT} 
     */
    put_Left(Left) {
        result := ComCall(22, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Top() {
        result := ComCall(23, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     */
    put_Top(Top) {
        result := ComCall(24, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(25, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(26, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(27, this, "int*", &pl := 0, "HRESULT")
        return pl
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    put_Height(Height) {
        result := ComCall(28, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationName() {
        LocationName := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, LocationName, "HRESULT")
        return LocationName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocationURL() {
        LocationURL := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, LocationURL, "HRESULT")
        return LocationURL
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Busy() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    Query(iid) {
        if (IWebBrowser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GoBack := CallbackCreate(GetMethod(implObj, "GoBack"), flags, 1)
        this.vtbl.GoForward := CallbackCreate(GetMethod(implObj, "GoForward"), flags, 1)
        this.vtbl.GoHome := CallbackCreate(GetMethod(implObj, "GoHome"), flags, 1)
        this.vtbl.GoSearch := CallbackCreate(GetMethod(implObj, "GoSearch"), flags, 1)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 6)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Refresh2 := CallbackCreate(GetMethod(implObj, "Refresh2"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.get_Container := CallbackCreate(GetMethod(implObj, "get_Container"), flags, 2)
        this.vtbl.get_Document := CallbackCreate(GetMethod(implObj, "get_Document"), flags, 2)
        this.vtbl.get_TopLevelContainer := CallbackCreate(GetMethod(implObj, "get_TopLevelContainer"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Left := CallbackCreate(GetMethod(implObj, "get_Left"), flags, 2)
        this.vtbl.put_Left := CallbackCreate(GetMethod(implObj, "put_Left"), flags, 2)
        this.vtbl.get_Top := CallbackCreate(GetMethod(implObj, "get_Top"), flags, 2)
        this.vtbl.put_Top := CallbackCreate(GetMethod(implObj, "put_Top"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.put_Width := CallbackCreate(GetMethod(implObj, "put_Width"), flags, 2)
        this.vtbl.get_Height := CallbackCreate(GetMethod(implObj, "get_Height"), flags, 2)
        this.vtbl.put_Height := CallbackCreate(GetMethod(implObj, "put_Height"), flags, 2)
        this.vtbl.get_LocationName := CallbackCreate(GetMethod(implObj, "get_LocationName"), flags, 2)
        this.vtbl.get_LocationURL := CallbackCreate(GetMethod(implObj, "get_LocationURL"), flags, 2)
        this.vtbl.get_Busy := CallbackCreate(GetMethod(implObj, "get_Busy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GoBack)
        CallbackFree(this.vtbl.GoForward)
        CallbackFree(this.vtbl.GoHome)
        CallbackFree(this.vtbl.GoSearch)
        CallbackFree(this.vtbl.Navigate)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Refresh2)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.get_Container)
        CallbackFree(this.vtbl.get_Document)
        CallbackFree(this.vtbl.get_TopLevelContainer)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Left)
        CallbackFree(this.vtbl.put_Left)
        CallbackFree(this.vtbl.get_Top)
        CallbackFree(this.vtbl.put_Top)
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.put_Width)
        CallbackFree(this.vtbl.get_Height)
        CallbackFree(this.vtbl.put_Height)
        CallbackFree(this.vtbl.get_LocationName)
        CallbackFree(this.vtbl.get_LocationURL)
        CallbackFree(this.vtbl.get_Busy)
    }
}
