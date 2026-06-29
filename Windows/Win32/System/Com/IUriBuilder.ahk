#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUri.ahk" { IUri }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IUriBuilder extends IUnknown {
    /**
     * The interface identifier for IUriBuilder
     * @type {Guid}
     */
    static IID := Guid("{4221b2e1-8955-46c0-bd5b-de9897565de7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUriBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateUriSimple    : IntPtr
        CreateUri          : IntPtr
        CreateUriWithFlags : IntPtr
        GetIUri            : IntPtr
        SetIUri            : IntPtr
        GetFragment        : IntPtr
        GetHost            : IntPtr
        GetPassword        : IntPtr
        GetPath            : IntPtr
        GetPort            : IntPtr
        GetQuery           : IntPtr
        GetSchemeName      : IntPtr
        GetUserName        : IntPtr
        SetFragment        : IntPtr
        SetHost            : IntPtr
        SetPassword        : IntPtr
        SetPath            : IntPtr
        SetPort            : IntPtr
        SetQuery           : IntPtr
        SetSchemeName      : IntPtr
        SetUserName        : IntPtr
        RemoveProperties   : IntPtr
        HasBeenModified    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUriBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUriSimple(dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(3, this, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUri(dwCreateFlags, dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(4, this, "uint", dwCreateFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {Integer} dwCreateFlags 
     * @param {Integer} dwUriBuilderFlags 
     * @param {Integer} dwAllowEncodingPropertyMask 
     * @param {Pointer} dwReserved 
     * @returns {IUri} 
     */
    CreateUriWithFlags(dwCreateFlags, dwUriBuilderFlags, dwAllowEncodingPropertyMask, dwReserved) {
        result := ComCall(5, this, "uint", dwCreateFlags, "uint", dwUriBuilderFlags, "uint", dwAllowEncodingPropertyMask, "ptr", dwReserved, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @returns {IUri} 
     */
    GetIUri() {
        result := ComCall(6, this, "ptr*", &ppIUri := 0, "HRESULT")
        return IUri(ppIUri)
    }

    /**
     * 
     * @param {IUri} pIUri 
     * @returns {HRESULT} 
     */
    SetIUri(pIUri) {
        result := ComCall(7, this, "ptr", pIUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchFragment 
     * @param {Pointer<PWSTR>} ppwzFragment 
     * @returns {HRESULT} 
     */
    GetFragment(pcchFragment, ppwzFragment) {
        pcchFragmentMarshal := pcchFragment is VarRef ? "uint*" : "ptr"
        ppwzFragmentMarshal := ppwzFragment is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pcchFragmentMarshal, pcchFragment, ppwzFragmentMarshal, ppwzFragment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchHost 
     * @param {Pointer<PWSTR>} ppwzHost 
     * @returns {HRESULT} 
     */
    GetHost(pcchHost, ppwzHost) {
        pcchHostMarshal := pcchHost is VarRef ? "uint*" : "ptr"
        ppwzHostMarshal := ppwzHost is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pcchHostMarshal, pcchHost, ppwzHostMarshal, ppwzHost, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchPassword 
     * @param {Pointer<PWSTR>} ppwzPassword 
     * @returns {HRESULT} 
     */
    GetPassword(pcchPassword, ppwzPassword) {
        pcchPasswordMarshal := pcchPassword is VarRef ? "uint*" : "ptr"
        ppwzPasswordMarshal := ppwzPassword is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pcchPasswordMarshal, pcchPassword, ppwzPasswordMarshal, ppwzPassword, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @remarks
     * The device context identified by the <i>hdc</i> parameter must contain a closed path.
     * 
     * The points of the path are returned in logical coordinates. Points are stored in the path in device coordinates, so <b>GetPath</b> changes the points from device coordinates to logical coordinates by using the inverse of the current transformation.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-flattenpath">FlattenPath</a> function may be called before <b>GetPath</b> to convert all curves in the path into line segments.
     * @param {Pointer<Integer>} pcchPath 
     * @param {Pointer<PWSTR>} ppwzPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpath
     */
    GetPath(pcchPath, ppwzPath) {
        pcchPathMarshal := pcchPath is VarRef ? "uint*" : "ptr"
        ppwzPathMarshal := ppwzPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, pcchPathMarshal, pcchPath, ppwzPathMarshal, ppwzPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfHasPort 
     * @param {Pointer<Integer>} pdwPort 
     * @returns {HRESULT} 
     */
    GetPort(pfHasPort, pdwPort) {
        pfHasPortMarshal := pfHasPort is VarRef ? "int*" : "ptr"
        pdwPortMarshal := pdwPort is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pfHasPortMarshal, pfHasPort, pdwPortMarshal, pdwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchQuery 
     * @param {Pointer<PWSTR>} ppwzQuery 
     * @returns {HRESULT} 
     */
    GetQuery(pcchQuery, ppwzQuery) {
        pcchQueryMarshal := pcchQuery is VarRef ? "uint*" : "ptr"
        ppwzQueryMarshal := ppwzQuery is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, pcchQueryMarshal, pcchQuery, ppwzQueryMarshal, ppwzQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcchSchemeName 
     * @param {Pointer<PWSTR>} ppwzSchemeName 
     * @returns {HRESULT} 
     */
    GetSchemeName(pcchSchemeName, ppwzSchemeName) {
        pcchSchemeNameMarshal := pcchSchemeName is VarRef ? "uint*" : "ptr"
        ppwzSchemeNameMarshal := ppwzSchemeName is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, pcchSchemeNameMarshal, pcchSchemeName, ppwzSchemeNameMarshal, ppwzSchemeName, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the user associated with the current thread. (Unicode)
     * @remarks
     * If the current thread is impersonating another client, the 
     * <b>GetUserName</b> function returns the user name of the client that the thread is impersonating.
     * 
     * If <b>GetUserName</b> is called from a process that is running under the  "NETWORK SERVICE" account, the string returned in <i>lpBuffer</i> may be different depending on the version of Windows.  On Windows XP, the "NETWORK SERVICE" string is returned. On Windows Vista, the “&lt;HOSTNAME&gt;$” string is returned.
     * @param {Pointer<Integer>} pcchUserName 
     * @param {Pointer<PWSTR>} ppwzUserName 
     * @returns {HRESULT} If the function succeeds, the return value is a nonzero value, and the variable pointed to by <i>lpnSize</i> contains the number of <b>TCHARs</b> copied to the buffer specified by <i>lpBuffer</i>, including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getusernamew
     */
    GetUserName(pcchUserName, ppwzUserName) {
        pcchUserNameMarshal := pcchUserName is VarRef ? "uint*" : "ptr"
        ppwzUserNameMarshal := ppwzUserName is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, pcchUserNameMarshal, pcchUserName, ppwzUserNameMarshal, ppwzUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetFragment(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(16, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetHost(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(17, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetPassword(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(18, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetPath(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(19, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * The SetPort function sets the status associated with a printer port.
     * @remarks
     * > [!Note]  
     * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
     * 
     *  
     * 
     * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
     * 
     * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
     * 
     * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
     * @param {BOOL} fHasPort 
     * @param {Integer} dwNewValue 
     * @returns {HRESULT} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/printdocs/setport
     */
    SetPort(fHasPort, dwNewValue) {
        result := ComCall(20, this, BOOL, fHasPort, "uint", dwNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetQuery(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(21, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetSchemeName(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(22, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzNewValue 
     * @returns {HRESULT} 
     */
    SetUserName(pwzNewValue) {
        pwzNewValue := pwzNewValue is String ? StrPtr(pwzNewValue) : pwzNewValue

        result := ComCall(23, this, "ptr", pwzNewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPropertyMask 
     * @returns {HRESULT} 
     */
    RemoveProperties(dwPropertyMask) {
        result := ComCall(24, this, "uint", dwPropertyMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasBeenModified() {
        result := ComCall(25, this, BOOL.Ptr, &pfModified := 0, "HRESULT")
        return pfModified
    }

    Query(iid) {
        if (IUriBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateUriSimple := CallbackCreate(GetMethod(implObj, "CreateUriSimple"), flags, 4)
        this.vtbl.CreateUri := CallbackCreate(GetMethod(implObj, "CreateUri"), flags, 5)
        this.vtbl.CreateUriWithFlags := CallbackCreate(GetMethod(implObj, "CreateUriWithFlags"), flags, 6)
        this.vtbl.GetIUri := CallbackCreate(GetMethod(implObj, "GetIUri"), flags, 2)
        this.vtbl.SetIUri := CallbackCreate(GetMethod(implObj, "SetIUri"), flags, 2)
        this.vtbl.GetFragment := CallbackCreate(GetMethod(implObj, "GetFragment"), flags, 3)
        this.vtbl.GetHost := CallbackCreate(GetMethod(implObj, "GetHost"), flags, 3)
        this.vtbl.GetPassword := CallbackCreate(GetMethod(implObj, "GetPassword"), flags, 3)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 3)
        this.vtbl.GetPort := CallbackCreate(GetMethod(implObj, "GetPort"), flags, 3)
        this.vtbl.GetQuery := CallbackCreate(GetMethod(implObj, "GetQuery"), flags, 3)
        this.vtbl.GetSchemeName := CallbackCreate(GetMethod(implObj, "GetSchemeName"), flags, 3)
        this.vtbl.GetUserName := CallbackCreate(GetMethod(implObj, "GetUserName"), flags, 3)
        this.vtbl.SetFragment := CallbackCreate(GetMethod(implObj, "SetFragment"), flags, 2)
        this.vtbl.SetHost := CallbackCreate(GetMethod(implObj, "SetHost"), flags, 2)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 2)
        this.vtbl.SetPath := CallbackCreate(GetMethod(implObj, "SetPath"), flags, 2)
        this.vtbl.SetPort := CallbackCreate(GetMethod(implObj, "SetPort"), flags, 3)
        this.vtbl.SetQuery := CallbackCreate(GetMethod(implObj, "SetQuery"), flags, 2)
        this.vtbl.SetSchemeName := CallbackCreate(GetMethod(implObj, "SetSchemeName"), flags, 2)
        this.vtbl.SetUserName := CallbackCreate(GetMethod(implObj, "SetUserName"), flags, 2)
        this.vtbl.RemoveProperties := CallbackCreate(GetMethod(implObj, "RemoveProperties"), flags, 2)
        this.vtbl.HasBeenModified := CallbackCreate(GetMethod(implObj, "HasBeenModified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateUriSimple)
        CallbackFree(this.vtbl.CreateUri)
        CallbackFree(this.vtbl.CreateUriWithFlags)
        CallbackFree(this.vtbl.GetIUri)
        CallbackFree(this.vtbl.SetIUri)
        CallbackFree(this.vtbl.GetFragment)
        CallbackFree(this.vtbl.GetHost)
        CallbackFree(this.vtbl.GetPassword)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.GetPort)
        CallbackFree(this.vtbl.GetQuery)
        CallbackFree(this.vtbl.GetSchemeName)
        CallbackFree(this.vtbl.GetUserName)
        CallbackFree(this.vtbl.SetFragment)
        CallbackFree(this.vtbl.SetHost)
        CallbackFree(this.vtbl.SetPassword)
        CallbackFree(this.vtbl.SetPath)
        CallbackFree(this.vtbl.SetPort)
        CallbackFree(this.vtbl.SetQuery)
        CallbackFree(this.vtbl.SetSchemeName)
        CallbackFree(this.vtbl.SetUserName)
        CallbackFree(this.vtbl.RemoveProperties)
        CallbackFree(this.vtbl.HasBeenModified)
    }
}
