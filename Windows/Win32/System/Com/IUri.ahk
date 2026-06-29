#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\Uri_PROPERTY.ahk" { Uri_PROPERTY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IUri extends IUnknown {
    /**
     * The interface identifier for IUri
     * @type {Guid}
     */
    static IID := Guid("{a39ee748-6a27-4817-a6f2-13914bef5890}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUri interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyBSTR   : IntPtr
        GetPropertyLength : IntPtr
        GetPropertyDWORD  : IntPtr
        HasProperty       : IntPtr
        GetAbsoluteUri    : IntPtr
        GetAuthority      : IntPtr
        GetDisplayUri     : IntPtr
        GetDomain         : IntPtr
        GetExtension      : IntPtr
        GetFragment       : IntPtr
        GetHost           : IntPtr
        GetPassword       : IntPtr
        GetPath           : IntPtr
        GetPathAndQuery   : IntPtr
        GetQuery          : IntPtr
        GetRawUri         : IntPtr
        GetSchemeName     : IntPtr
        GetUserInfo       : IntPtr
        GetUserName       : IntPtr
        GetHostType       : IntPtr
        GetPort           : IntPtr
        GetScheme         : IntPtr
        GetZone           : IntPtr
        GetProperties     : IntPtr
        IsEqual           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUri.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {BSTR} 
     */
    GetPropertyBSTR(uriProp, dwFlags) {
        pbstrProperty := BSTR.Owned()
        result := ComCall(3, this, Uri_PROPERTY, uriProp, BSTR.Ptr, pbstrProperty, "uint", dwFlags, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyLength(uriProp, dwFlags) {
        result := ComCall(4, this, Uri_PROPERTY, uriProp, "uint*", &pcchProperty := 0, "uint", dwFlags, "HRESULT")
        return pcchProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetPropertyDWORD(uriProp, dwFlags) {
        result := ComCall(5, this, Uri_PROPERTY, uriProp, "uint*", &pdwProperty := 0, "uint", dwFlags, "HRESULT")
        return pdwProperty
    }

    /**
     * 
     * @param {Uri_PROPERTY} uriProp 
     * @returns {BOOL} 
     */
    HasProperty(uriProp) {
        result := ComCall(6, this, Uri_PROPERTY, uriProp, BOOL.Ptr, &pfHasProperty := 0, "HRESULT")
        return pfHasProperty
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAbsoluteUri() {
        pbstrAbsoluteUri := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrAbsoluteUri, "HRESULT")
        return pbstrAbsoluteUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetAuthority() {
        pbstrAuthority := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrAuthority, "HRESULT")
        return pbstrAuthority
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayUri() {
        pbstrDisplayString := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrDisplayString, "HRESULT")
        return pbstrDisplayString
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDomain() {
        pbstrDomain := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrDomain, "HRESULT")
        return pbstrDomain
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetExtension() {
        pbstrExtension := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrExtension, "HRESULT")
        return pbstrExtension
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetFragment() {
        pbstrFragment := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrFragment, "HRESULT")
        return pbstrFragment
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHost() {
        pbstrHost := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrHost, "HRESULT")
        return pbstrHost
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPassword() {
        pbstrPassword := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pbstrPassword, "HRESULT")
        return pbstrPassword
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @remarks
     * The device context identified by the <i>hdc</i> parameter must contain a closed path.
     * 
     * The points of the path are returned in logical coordinates. Points are stored in the path in device coordinates, so <b>GetPath</b> changes the points from device coordinates to logical coordinates by using the inverse of the current transformation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-flattenpath">FlattenPath</a> function may be called before <b>GetPath</b> to convert all curves in the path into line segments.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpath
     */
    GetPath() {
        pbstrPath := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetPathAndQuery() {
        pbstrPathAndQuery := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrPathAndQuery, "HRESULT")
        return pbstrPathAndQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetQuery() {
        pbstrQuery := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrQuery, "HRESULT")
        return pbstrQuery
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetRawUri() {
        pbstrRawUri := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pbstrRawUri, "HRESULT")
        return pbstrRawUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSchemeName() {
        pbstrSchemeName := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrSchemeName, "HRESULT")
        return pbstrSchemeName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUserInfo() {
        pbstrUserInfo := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pbstrUserInfo, "HRESULT")
        return pbstrUserInfo
    }

    /**
     * Retrieves the name of the user associated with the current thread. (Unicode)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamew
     */
    GetUserName() {
        pbstrUserName := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHostType() {
        result := ComCall(22, this, "uint*", &pdwHostType := 0, "HRESULT")
        return pdwHostType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPort() {
        result := ComCall(23, this, "uint*", &pdwPort := 0, "HRESULT")
        return pdwPort
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetScheme() {
        result := ComCall(24, this, "uint*", &pdwScheme := 0, "HRESULT")
        return pdwScheme
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetZone() {
        result := ComCall(25, this, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetProperties() {
        result := ComCall(26, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {IUri} pUri 
     * @returns {BOOL} 
     */
    IsEqual(pUri) {
        result := ComCall(27, this, "ptr", pUri, BOOL.Ptr, &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    Query(iid) {
        if (IUri.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyBSTR := CallbackCreate(GetMethod(implObj, "GetPropertyBSTR"), flags, 4)
        this.vtbl.GetPropertyLength := CallbackCreate(GetMethod(implObj, "GetPropertyLength"), flags, 4)
        this.vtbl.GetPropertyDWORD := CallbackCreate(GetMethod(implObj, "GetPropertyDWORD"), flags, 4)
        this.vtbl.HasProperty := CallbackCreate(GetMethod(implObj, "HasProperty"), flags, 3)
        this.vtbl.GetAbsoluteUri := CallbackCreate(GetMethod(implObj, "GetAbsoluteUri"), flags, 2)
        this.vtbl.GetAuthority := CallbackCreate(GetMethod(implObj, "GetAuthority"), flags, 2)
        this.vtbl.GetDisplayUri := CallbackCreate(GetMethod(implObj, "GetDisplayUri"), flags, 2)
        this.vtbl.GetDomain := CallbackCreate(GetMethod(implObj, "GetDomain"), flags, 2)
        this.vtbl.GetExtension := CallbackCreate(GetMethod(implObj, "GetExtension"), flags, 2)
        this.vtbl.GetFragment := CallbackCreate(GetMethod(implObj, "GetFragment"), flags, 2)
        this.vtbl.GetHost := CallbackCreate(GetMethod(implObj, "GetHost"), flags, 2)
        this.vtbl.GetPassword := CallbackCreate(GetMethod(implObj, "GetPassword"), flags, 2)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 2)
        this.vtbl.GetPathAndQuery := CallbackCreate(GetMethod(implObj, "GetPathAndQuery"), flags, 2)
        this.vtbl.GetQuery := CallbackCreate(GetMethod(implObj, "GetQuery"), flags, 2)
        this.vtbl.GetRawUri := CallbackCreate(GetMethod(implObj, "GetRawUri"), flags, 2)
        this.vtbl.GetSchemeName := CallbackCreate(GetMethod(implObj, "GetSchemeName"), flags, 2)
        this.vtbl.GetUserInfo := CallbackCreate(GetMethod(implObj, "GetUserInfo"), flags, 2)
        this.vtbl.GetUserName := CallbackCreate(GetMethod(implObj, "GetUserName"), flags, 2)
        this.vtbl.GetHostType := CallbackCreate(GetMethod(implObj, "GetHostType"), flags, 2)
        this.vtbl.GetPort := CallbackCreate(GetMethod(implObj, "GetPort"), flags, 2)
        this.vtbl.GetScheme := CallbackCreate(GetMethod(implObj, "GetScheme"), flags, 2)
        this.vtbl.GetZone := CallbackCreate(GetMethod(implObj, "GetZone"), flags, 2)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.IsEqual := CallbackCreate(GetMethod(implObj, "IsEqual"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyBSTR)
        CallbackFree(this.vtbl.GetPropertyLength)
        CallbackFree(this.vtbl.GetPropertyDWORD)
        CallbackFree(this.vtbl.HasProperty)
        CallbackFree(this.vtbl.GetAbsoluteUri)
        CallbackFree(this.vtbl.GetAuthority)
        CallbackFree(this.vtbl.GetDisplayUri)
        CallbackFree(this.vtbl.GetDomain)
        CallbackFree(this.vtbl.GetExtension)
        CallbackFree(this.vtbl.GetFragment)
        CallbackFree(this.vtbl.GetHost)
        CallbackFree(this.vtbl.GetPassword)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.GetPathAndQuery)
        CallbackFree(this.vtbl.GetQuery)
        CallbackFree(this.vtbl.GetRawUri)
        CallbackFree(this.vtbl.GetSchemeName)
        CallbackFree(this.vtbl.GetUserInfo)
        CallbackFree(this.vtbl.GetUserName)
        CallbackFree(this.vtbl.GetHostType)
        CallbackFree(this.vtbl.GetPort)
        CallbackFree(this.vtbl.GetScheme)
        CallbackFree(this.vtbl.GetZone)
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.IsEqual)
    }
}
