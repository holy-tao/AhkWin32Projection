#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FAX_PROVIDER_STATUS_ENUM.ahk" { FAX_PROVIDER_STATUS_ENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxInboundRoutingExtension interface defines a configuration object used by a fax client application to retrieve information about a fax routing extension registered with the fax service.
 * @remarks
 * A default implementation of <b>IFaxInboundRoutingExtension</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension">FaxInboundRoutingExtension</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxinboundroutingextension
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxInboundRoutingExtension extends IDispatch {
    /**
     * The interface identifier for IFaxInboundRoutingExtension
     * @type {Guid}
     */
    static IID := Guid("{885b5e08-c26c-4ef9-af83-51580a750be1}")

    /**
     * The class identifier for FaxInboundRoutingExtension
     * @type {Guid}
     */
    static CLSID := Guid("{1d7dfb51-7207-4436-a0d9-24e32ee56988}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxInboundRoutingExtension interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_FriendlyName  : IntPtr
        get_ImageName     : IntPtr
        get_UniqueName    : IntPtr
        get_MajorVersion  : IntPtr
        get_MinorVersion  : IntPtr
        get_MajorBuild    : IntPtr
        get_MinorBuild    : IntPtr
        get_Debug         : IntPtr
        get_Status        : IntPtr
        get_InitErrorCode : IntPtr
        get_Methods       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxInboundRoutingExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * @type {BSTR} 
     */
    ImageName {
        get => this.get_ImageName()
    }

    /**
     * @type {BSTR} 
     */
    UniqueName {
        get => this.get_UniqueName()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * @type {Integer} 
     */
    MajorBuild {
        get => this.get_MajorBuild()
    }

    /**
     * @type {Integer} 
     */
    MinorBuild {
        get => this.get_MinorBuild()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Debug {
        get => this.get_Debug()
    }

    /**
     * @type {FAX_PROVIDER_STATUS_ENUM} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    InitErrorCode {
        get => this.get_InitErrorCode()
    }

    /**
     * @type {VARIANT} 
     */
    Methods {
        get => this.get_Methods()
    }

    /**
     * The IFaxInboundRoutingExtension::get_FriendlyName property is a null-terminated string that contains the user-friendly name for the fax routing extension. The string is suitable for display to users.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_friendlyname
     */
    get_FriendlyName() {
        pbstrFriendlyName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrFriendlyName, "HRESULT")
        return pbstrFriendlyName
    }

    /**
     * The IFaxInboundRoutingExtension::get_ImageName property is a null-terminated string that contains the executable image name (DLL path and file name) of the fax routing extension.
     * @remarks
     * The path can include valid environment variables, for example, <c>%SYSTEMDRIVE%</code> and <code>%SYSTEMROOT%</c>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_imagename
     */
    get_ImageName() {
        pbstrImageName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrImageName, "HRESULT")
        return pbstrImageName
    }

    /**
     * The IFaxInboundRoutingExtension::get_UniqueName property is a null-terminated string that contains a unique name for the fax routing extension. The fax service uses this name internally to identify fax routing extensions.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_uniquename
     */
    get_UniqueName() {
        pbstrUniqueName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrUniqueName, "HRESULT")
        return pbstrUniqueName
    }

    /**
     * The IFaxInboundRoutingExtension::get_MajorVersion property is a value that specifies the major part of the version number for the fax routing extension's DLL.
     * @remarks
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorversion
     */
    get_MajorVersion() {
        result := ComCall(10, this, "int*", &plMajorVersion := 0, "HRESULT")
        return plMajorVersion
    }

    /**
     * The IFaxInboundRoutingExtension::get_MinorVersion property is a value that specifies the minor part of the version number for the fax routing extension's DLL.
     * @remarks
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorversion
     */
    get_MinorVersion() {
        result := ComCall(11, this, "int*", &plMinorVersion := 0, "HRESULT")
        return plMinorVersion
    }

    /**
     * The IFaxInboundRoutingExtension::get_MajorBuild property is a value that specifies the major part of the build number for the fax routing extension's DLL.
     * @remarks
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorbuild
     */
    get_MajorBuild() {
        result := ComCall(12, this, "int*", &plMajorBuild := 0, "HRESULT")
        return plMajorBuild
    }

    /**
     * The IFaxInboundRoutingExtension::get_MinorBuild property is a value that specifies the minor part of the build number for the fax routing extension's DLL.
     * @remarks
     * The standard format for build numbers is MajorVersion.MinorVersion.MajorBuild.MinorBuild.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorbuild
     */
    get_MinorBuild() {
        result := ComCall(13, this, "int*", &plMinorBuild := 0, "HRESULT")
        return plMinorBuild
    }

    /**
     * The IFaxInboundRoutingExtension::get_Debug property is a Boolean value that indicates whether the fax routing extension DLL was created in a debug environment.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_debug
     */
    get_Debug() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &pbDebug := 0, "HRESULT")
        return pbDebug
    }

    /**
     * The IFaxInboundRoutingExtension::get_Status property is a value that indicates whether the fax routing extension loaded and initialized successfully.
     * @remarks
     * If the extension did not load successfully, the property indicates the reason for the failure, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> holds the last error code value. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_provider_status_enum">FAX_PROVIDER_STATUS_ENUM</a>.
     * @returns {FAX_PROVIDER_STATUS_ENUM} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_status
     */
    get_Status() {
        result := ComCall(15, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IFaxInboundRoutingExtension::get_InitErrorCode property is a value that specifies the last error code that the fax routing extension returned while the fax service was loading and initializing the fax routing extension's DLL.
     * @remarks
     * The error code may be an HRESULT value or a Win32 error code.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_initerrorcode
     */
    get_InitErrorCode() {
        result := ComCall(16, this, "int*", &plInitErrorCode := 0, "HRESULT")
        return plInitErrorCode
    }

    /**
     * The IFaxInboundRoutingExtension::get_Methods property is an array of GUIDs that uniquely identify the inbound routing methods exposed by the fax routing extension.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_methods
     */
    get_Methods() {
        pvMethods := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pvMethods, "HRESULT")
        return pvMethods
    }

    Query(iid) {
        if (IFaxInboundRoutingExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FriendlyName := CallbackCreate(GetMethod(implObj, "get_FriendlyName"), flags, 2)
        this.vtbl.get_ImageName := CallbackCreate(GetMethod(implObj, "get_ImageName"), flags, 2)
        this.vtbl.get_UniqueName := CallbackCreate(GetMethod(implObj, "get_UniqueName"), flags, 2)
        this.vtbl.get_MajorVersion := CallbackCreate(GetMethod(implObj, "get_MajorVersion"), flags, 2)
        this.vtbl.get_MinorVersion := CallbackCreate(GetMethod(implObj, "get_MinorVersion"), flags, 2)
        this.vtbl.get_MajorBuild := CallbackCreate(GetMethod(implObj, "get_MajorBuild"), flags, 2)
        this.vtbl.get_MinorBuild := CallbackCreate(GetMethod(implObj, "get_MinorBuild"), flags, 2)
        this.vtbl.get_Debug := CallbackCreate(GetMethod(implObj, "get_Debug"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_InitErrorCode := CallbackCreate(GetMethod(implObj, "get_InitErrorCode"), flags, 2)
        this.vtbl.get_Methods := CallbackCreate(GetMethod(implObj, "get_Methods"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FriendlyName)
        CallbackFree(this.vtbl.get_ImageName)
        CallbackFree(this.vtbl.get_UniqueName)
        CallbackFree(this.vtbl.get_MajorVersion)
        CallbackFree(this.vtbl.get_MinorVersion)
        CallbackFree(this.vtbl.get_MajorBuild)
        CallbackFree(this.vtbl.get_MinorBuild)
        CallbackFree(this.vtbl.get_Debug)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_InitErrorCode)
        CallbackFree(this.vtbl.get_Methods)
    }
}
