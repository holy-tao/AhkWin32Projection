#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class RightsManagement {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DRMHANDLE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMENVHANDLE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMQUERYHANDLE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMHSESSION_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMPUBHANDLE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AL_NONSILENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AL_NOPERSIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AL_CANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AL_FETCHNOADVISORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AL_NOUI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_GROUPIDENTITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_TEMPORARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_CANCEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_SILENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_SHARED_GROUPIDENTITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ACTIVATE_DELAYED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_GROUPIDENTITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_GROUPIDENTITY_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_GROUPIDENTITY_LID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_SPECIFIED_GROUPIDENTITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_EUL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_EUL_LID => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_CLIENTLICENSOR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_CLIENTLICENSOR_LID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_SPECIFIED_CLIENTLICENSOR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_REVOCATIONLIST => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_REVOCATIONLIST_LID => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_EXPIRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_ISSUERNAME => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_ISSUANCELICENSE_TEMPLATE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_EL_ISSUANCELICENSE_TEMPLATE_LID => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ADD_LICENSE_NOPERSIST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_ADD_LICENSE_PERSIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_TYPE_ACTIVATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_TYPE_CERTIFICATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_TYPE_PUBLISHING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_TYPE_CLIENTLICENSOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_TYPE_SILENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_LOCATION_INTERNET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVICE_LOCATION_ENTERPRISE => 2

    /**
     * @type {String}
     */
    static DRM_DEFAULTGROUPIDTYPE_WINDOWSAUTH => "WindowsAuthProvider"

    /**
     * @type {String}
     */
    static DRM_DEFAULTGROUPIDTYPE_PASSPORT => "PassportAuthProvider"

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SIGN_ONLINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SIGN_OFFLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SIGN_CANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_SERVER_ISSUANCELICENSE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AUTO_GENERATE_KEY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_OWNER_LICENSE_NOPERSIST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_REUSE_KEY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_LOCKBOXTYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_LOCKBOXTYPE_WHITEBOX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_LOCKBOXTYPE_BLACKBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_LOCKBOXTYPE_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AILT_NONSILENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AILT_OBTAIN_ALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DRM_AILT_CANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSDRM_CLIENT_ZONE => 52992

    /**
     * @type {Integer (UInt32)}
     */
    static MSDRM_POLICY_ZONE => 37632

    /**
     * @type {Integer (UInt32)}
     */
    static DRMIDVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMBOUNDLICENSEPARAMSVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRMBINDINGFLAGS_IGNORE_VALIDITY_INTERVALS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRMLICENSEACQDATAVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMACTSERVINFOVERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRMCLIENTSTRUCTVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRMCALLBACKVERSION => 1
;@endregion Constants

;@region Methods
    /**
     * Sets the transport protocol to a specified value and optionally specifies whether the server lockbox is used.
     * @remarks
     * Applications cannot toggle between the WinHTTP and WinINet protocols.
     * 
     * WinINet does not support usage under the network service account. If an application will be run under the network service account, the application must specify the <b>DRMGLOBALOPTIONS_USE_WINHTTP</b> option.
     * 
     * An AD RMS-enabled server application should call the <b>DRMSetGlobalOptions</b> function prior to calling any other rights management functions. Calling <b>DRMSetGlobalOptions</b> after other rights management functions have been called will not change the type of lockbox or transport protocol in use.
     * @param {Integer} eGlobalOptions A value of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drmglobaloptions">DRMGLOBALOPTIONS</a> enumeration that specifies the option to set.
     * 
     * Only one option can be specified in each call to <b>DRMSetGlobalOptions</b>. For example, if both WinHTTP and the server lockbox are required, you must call <b>DRMSetGlobalOptions</b> twice, once with <i>eGlobalOptions</i> set to <b>DRMGLOBALOPTIONS_USE_WINHTTP</b> and once with <i>eGlobalOptions</i> set to <b>DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR</b>.
     * @param {Pointer<Void>} pvdata A pointer to a <b>void</b> value. This parameter is not currently used.
     * @param {Integer} dwlen The size, in bytes, of the <i>pvdata</i> buffer. This parameter is not currently used.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetglobaloptions
     */
    static DRMSetGlobalOptions(eGlobalOptions, pvdata, dwlen) {
        result := DllCall("msdrm.dll\DRMSetGlobalOptions", "int", eGlobalOptions, "ptr", pvdata, "uint", dwlen, "int")
        return result
    }

    /**
     * Returns the version number of the Active Directory Rights Management Services client software and whether the hierarchy is for Production or Pre-production purposes.
     * @param {Pointer<DRM_CLIENT_VERSION_INFO>} pDRMClientVersionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drm_client_version_info">DRM_CLIENT_VERSION_INFO</a> structure that receives the version number of the Active Directory Rights Management Services client software and the hierarchy information, such as Production or Pre-production.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetclientversion
     */
    static DRMGetClientVersion(pDRMClientVersionInfo) {
        result := DllCall("msdrm.dll\DRMGetClientVersion", "ptr", pDRMClientVersionInfo, "int")
        return result
    }

    /**
     * Creates a secure environment for all rights management calls.
     * @remarks
     * This function loads the lockbox, and makes sure that only legal DLLs are loaded, according to the manifest.
     * 
     * The order of certificates is from least trusted first to most trusted (closest to the root) last.
     * 
     * When closing the handles returned by this function, close the library handle before closing the environment 
     *      handle. Otherwise, you will receive an <b>E_DRM_ENV_NOT_LOADED</b> error. Close the library 
     *      handle by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a>. Close the environment 
     *      handle by calling 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a>.
     * @param {Integer} eSecurityProviderType Specifies the type of security provider to use.
     * @param {Integer} eSpecification Specifies which security provider to use.
     * @param {Pointer<Char>} wszSecurityProvider The file name and ID of the security provider. A security provider can be a file on the computer (the 
     *       lockbox) or a hardware device that holds the secure machine key. The path to this key is obtained by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsecurityprovider">DRMGetSecurityProvider</a>.
     * @param {Pointer<Char>} wszManifestCredentials A signed XrML structure that specifies conditions on the environment. For information about making a 
     *       manifest, see 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-application-manifest">Creating an Application Manifest</a>.
     * @param {Pointer<Char>} wszMachineCredentials The machine certificate.
     * @param {Pointer<UInt32>} phEnv A pointer to an environment handle. Close the handle by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a>.
     * @param {Pointer<UInt32>} phDefaultLibrary A pointer to the handle of the library used to create the principal object. You must close this handle 
     *       before closing the environment handle. For more information, see the Remarks section. Close by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a>.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. 
     *        Possible values include, but are not limited to, those in the following list. For a list of common error codes, 
     *        see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drminitenvironment
     */
    static DRMInitEnvironment(eSecurityProviderType, eSpecification, wszSecurityProvider, wszManifestCredentials, wszMachineCredentials, phEnv, phDefaultLibrary) {
        wszSecurityProvider := wszSecurityProvider is String? StrPtr(wszSecurityProvider) : wszSecurityProvider
        wszManifestCredentials := wszManifestCredentials is String? StrPtr(wszManifestCredentials) : wszManifestCredentials
        wszMachineCredentials := wszMachineCredentials is String? StrPtr(wszMachineCredentials) : wszMachineCredentials

        result := DllCall("msdrm.dll\DRMInitEnvironment", "int", eSecurityProviderType, "int", eSpecification, "ptr", wszSecurityProvider, "ptr", wszManifestCredentials, "ptr", wszMachineCredentials, "uint*", phEnv, "uint*", phDefaultLibrary, "int")
        return result
    }

    /**
     * Loads a handle to an approved library, as determined by the credentials.
     * @remarks
     * This function is a secure version of the  <b>LoadLibrary</b> function, however it does not support the extra options of <b>LoadLibraryEx</b>. The returned handle corresponds to the HMODULE output by LoadLibrary. To close the handle returned, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a>, not <b>FreeLibrary</b>. By default, the current directory is the only location this function searches for a library. Any other directory must be specified by either a full path, or a path relative to the current directory. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetprocaddress">DRMGetProcAddress</a>, the secure version of the <b>GetProcAddress</b> function, to get function addresses in loaded libraries.
     * 
     * Dependencies of the loaded DLL will also be loaded, provided they are included in the plug-in credentials and are properly signed. If the DLL has already been loaded, the function will return S_OK and return a pointer to the same handle.<div class="alert"><b>Note</b>  If an application attempts to load a second library with the name of a previously loaded library, this new library will not be checked against the manifest, even if it is from a different path. Use only uniquely named libraries to avoid this circumvention of manifest checking.</div>
     * <div> </div>
     * @param {Integer} hEnv A handle to an environment, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Integer} eSpecification The library provider type.
     * @param {Pointer<Char>} wszLibraryProvider Name and optional path to the DLL. Every DLL must have a unique name. If similarly named DLLs are loaded, even if they are in different paths, only the first item will be included in the manifest and checked.
     * @param {Pointer<Char>} wszCredentials Reserved, must be <b>NULL</b>. The DLL that is loaded must be referenced in the application manifest loaded by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<UInt32>} phLibrary A handle to the library.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmloadlibrary
     */
    static DRMLoadLibrary(hEnv, eSpecification, wszLibraryProvider, wszCredentials, phLibrary) {
        wszLibraryProvider := wszLibraryProvider is String? StrPtr(wszLibraryProvider) : wszLibraryProvider
        wszCredentials := wszCredentials is String? StrPtr(wszCredentials) : wszCredentials

        result := DllCall("msdrm.dll\DRMLoadLibrary", "uint", hEnv, "int", eSpecification, "ptr", wszLibraryProvider, "ptr", wszCredentials, "uint*", phLibrary, "int")
        return result
    }

    /**
     * Creates an enabling principal needed to bind to a license.
     * @remarks
     * The enabling principal this function creates is used in the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a> structure passed into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the enabling principal handle created by calling this function.
     * @param {Integer} hEnv A handle to an environment created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Integer} hLibrary A handle to a library. Currently, the only valid library that can be used is the one passed out by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<Char>} wszObject A pointer to a null-terminated Unicode string that specifies the enabling principal type. An application can use the object constants specified in Msdrmgetinfo.h.
     * @param {Pointer<DRMID>} pidPrincipal A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmid">DRMID</a> structure that identifies the enabling principal. The <b>DRMID</b> members can be <b>NULL</b> to use the first principal in a license.
     * @param {Pointer<Char>} wszCredentials A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> of the current user.
     * @param {Pointer<UInt32>} phEnablingPrincipal A pointer to a <b>DRMHANDLE</b> value that receives the created principal. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateenablingprincipal
     */
    static DRMCreateEnablingPrincipal(hEnv, hLibrary, wszObject, pidPrincipal, wszCredentials, phEnablingPrincipal) {
        wszObject := wszObject is String? StrPtr(wszObject) : wszObject
        wszCredentials := wszCredentials is String? StrPtr(wszCredentials) : wszCredentials

        result := DllCall("msdrm.dll\DRMCreateEnablingPrincipal", "uint", hEnv, "uint", hLibrary, "ptr", wszObject, "ptr", pidPrincipal, "ptr", wszCredentials, "uint*", phEnablingPrincipal, "int")
        return result
    }

    /**
     * Closes handles to objects created with DRMCreate* functions and libraries loaded by using DRMLoadLibrary.
     * @remarks
     * This function properly clears sensitive data from memory and allows the AD RMS system to keep an accurate reference count on objects used. If an object contains other open objects within it, calling this function will force all contained objects to be closed as well. However, forcing closure of contained objects in this way is not recommended.
     * 
     * If this function fails, an application should destroy the current process after closing the environment with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a>.
     * 
     * Closing a handle to a library will cause the library to be unloaded if it has no remaining open objects.
     * @param {Integer} handle A handle to close.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmclosehandle
     */
    static DRMCloseHandle(handle) {
        result := DllCall("msdrm.dll\DRMCloseHandle", "uint", handle, "int")
        return result
    }

    /**
     * Closes an environment handle.
     * @remarks
     * This function is the last function an application should call in a secure environment. Close embedded handles first by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a>. Calling <b>DRMClose</b>* functions clears out sensitive information from memory and allows the Active Directory Rights Management system to keep an accurate reference count on objects used.
     * 
     * If this function fails, an application should destroy the current process before reinitializing an environment to use.
     * @param {Integer} hEnv A handle to an environment.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcloseenvironmenthandle
     */
    static DRMCloseEnvironmentHandle(hEnv) {
        result := DllCall("msdrm.dll\DRMCloseEnvironmentHandle", "uint", hEnv, "int")
        return result
    }

    /**
     * Creates a copy of a DRMHANDLE.
     * @remarks
     * Use this function to duplicate all handles except environment handles. (For that, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmduplicateenvironmenthandle">DRMDuplicateEnvironmentHandle</a>.) This function allows an application to keep a proper reference count on environment handles. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle created by calling this function.
     * @param {Integer} hToCopy A handle to copy.
     * @param {Pointer<UInt32>} phCopy A copy of the handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmduplicatehandle
     */
    static DRMDuplicateHandle(hToCopy, phCopy) {
        result := DllCall("msdrm.dll\DRMDuplicateHandle", "uint", hToCopy, "uint*", phCopy, "int")
        return result
    }

    /**
     * Creates a copy of an environment handle.
     * @remarks
     * This function allows an application to keep a proper reference count on environment handles, so use this function, rather than simply copy assignment, to copy an environment handle. For other handles, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmduplicatehandle">DRMDuplicateHandle</a>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a> to close the environment handle created by calling this function.
     * @param {Integer} hToCopy A handle to copy. An environment handle is created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<UInt32>} phCopy A copy of the handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a> to close.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmduplicateenvironmenthandle
     */
    static DRMDuplicateEnvironmentHandle(hToCopy, phCopy) {
        result := DllCall("msdrm.dll\DRMDuplicateEnvironmentHandle", "uint", hToCopy, "uint*", phCopy, "int")
        return result
    }

    /**
     * Registers a rights revocation list on the client.
     * @remarks
     * A revocation list holds all group identities, end-user licenses, or other principals that have been revoked. This function blocks the display of content from distributors or users whose license has been revoked. When an attempt to bind to a license fails with <b>E_DRM_BIND_REVOCATION_LIST_STALE</b> or <b>E_DRM_BIND_NO_APPLICABLE_REVOCATION_LIST</b>, this indicates that the license requires a revocation list. This list must either be found in the license store (using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>) or must be acquired fresh using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquireadvisories">DRMAcquireAdvisories</a> and then retrieved from the license store. Registration is only for the lifetime of the environment passed in. Any time that a new environment object is created, the necessary revocation lists must be registered for that environment.
     * @param {Integer} hEnv A handle to an environment, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<Char>} wszRevocationList Revocation list as a null-terminated string.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmregisterrevocationlist
     */
    static DRMRegisterRevocationList(hEnv, wszRevocationList) {
        wszRevocationList := wszRevocationList is String? StrPtr(wszRevocationList) : wszRevocationList

        result := DllCall("msdrm.dll\DRMRegisterRevocationList", "uint", hEnv, "ptr", wszRevocationList, "int")
        return result
    }

    /**
     * Returns S_OK for any level of the security check being run.
     * @remarks
     * Currently only environment security checks are allowed. A comprehensive security check can be time-consuming.
     * @param {Integer} hEnv A handle to an environment.
     * @param {Integer} cLevel Level of the security check to run, from 1 to 10, with 10 being the most secure but most resource-intensive.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmchecksecurity
     */
    static DRMCheckSecurity(hEnv, cLevel) {
        result := DllCall("msdrm.dll\DRMCheckSecurity", "uint", hEnv, "uint", cLevel, "int")
        return result
    }

    /**
     * Informs the Active Directory Rights Management Services (AD RMS) client that an AD RMS-protected document is being or is no longer being displayed.
     * @remarks
     * This function allows the AD RMS client to keep a reference count of all open AD RMS-protected documents in the client application. The AD RMS client uses this information to implement additional user interface security measures, such as disabling the print screen functionality, to prevent the protected documents from being accessed in an unauthorized manner. When the reference count is greater than zero, the additional user interface security measures are applied to all applications, not just those hosting the AD RMS-protected documents. Using this function is not required, but using it enables an application to obtain additional user interface security features for greater document security.
     * 
     * Every call to this function with <b>TRUE</b> must have a corresponding call to this function with <b>FALSE</b> to maintain proper reference counting.
     * @param {Integer} fRegister Pass <b>TRUE</b> when you open an AD RMS-protected document. Pass <b>FALSE</b> when you close that document.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmregistercontent
     */
    static DRMRegisterContent(fRegister) {
        result := DllCall("msdrm.dll\DRMRegisterContent", "int", fRegister, "int")
        return result
    }

    /**
     * Encrypts data.
     * @remarks
     * Memory allocation and release of the encrypted content is the responsibility of the calling function. The following code sample, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/encrypting-content">Encrypting Content</a>, shows how to encrypt content in blocks. This particular example already knows the size of the content to encrypt and allocates memory beforehand. If you must determine the number of bytes to allocate, however,  the required buffer size is returned in the <i>pcNumOutBytes</i> parameter after the first call. Allocate memory and call the function again with  <i>pbOutData</i> set to point to the new memory.
     * 
     * 
     * ```cpp
     * @param {Integer} hCryptoProvider A handle to an AD RMS encrypting object created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsencryptor">DRMCreateEnablingBitsEncryptor</a> function.
     * @param {Integer} iPosition Position in the buffer at which to start encrypting. <b>0</b> corresponds to the first block in a buffer, <b>1</b> corresponds to the second block, and so on. 
     * 
     * <div class="alert"><b>Note</b>  If you use the <b>AES</b> key when you sign the issuance license, <i>iPosition</i> can always be set to 0.</div>
     * <div> </div>
     * @param {Integer} cNumInBytes The number of bytes to encrypt.
     * @param {Pointer<Byte>} pbInData A pointer to a buffer that contains the bytes to encrypt.
     * @param {Pointer<UInt32>} pcNumOutBytes The number of encrypted bytes.
     * @param {Pointer<Byte>} pbOutData A pointer to the encrypted bytes.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmencrypt
     */
    static DRMEncrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData) {
        result := DllCall("msdrm.dll\DRMEncrypt", "uint", hCryptoProvider, "uint", iPosition, "uint", cNumInBytes, "char*", pbInData, "uint*", pcNumOutBytes, "char*", pbOutData, "int")
        return result
    }

    /**
     * Decrypts encrypted content.
     * @remarks
     * Memory allocation and release of the decrypted content is the responsibility of the calling function. The following code sample, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/decrypting-content">Decrypting Content</a>, shows how to decrypt content in blocks. This particular example already knows the size of the content to decrypt and allocates memory beforehand. If you must determine the number of bytes to allocate, however,  the required buffer size is returned in the <i>pcNumOutBytes</i> parameter after the first call. Allocate memory and call the function again with  <i>pbOutData</i> set to point to the new memory.
     * 
     * 
     * ```cpp
     * @param {Integer} hCryptoProvider A handle to an AD RMS decrypting object created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsdecryptor">DRMCreateEnablingBitsDecryptor</a>.
     * @param {Integer} iPosition Position in the buffer at which to start decrypting. <b>0</b> corresponds to the first block in a buffer, <b>1</b> corresponds to the second block, and so on. See the example later in this topic.
     * @param {Integer} cNumInBytes Number of bytes to decrypt.
     * @param {Pointer<Byte>} pbInData Pointer to a buffer that contains the bytes to decrypt.
     * @param {Pointer<UInt32>} pcNumOutBytes Size, in bytes,  of the decrypted data.
     * @param {Pointer<Byte>} pbOutData Decrypted data.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmdecrypt
     */
    static DRMDecrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData) {
        result := DllCall("msdrm.dll\DRMDecrypt", "uint", hCryptoProvider, "uint", iPosition, "uint", cNumInBytes, "char*", pbInData, "uint*", pcNumOutBytes, "char*", pbOutData, "int")
        return result
    }

    /**
     * Allows an application to examine or exercise the rights on a locally stored license.
     * @remarks
     * Calling this function binds a license to the right or rights specified in the  <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a> structure passed to the <i>pParams</i> parameter. If any right requested cannot be exercised by the current user, the function will fail. Note also that you must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> and specify a value for the <i>wszContentId</i> parameter before calling this function and that this value must be the same as the ID set in the <b>DRMBOUNDLICENSEPARAMS</b> structure or the function will fail.
     * 
     * If the function succeeds, it returns a handle to the bound license that can be examined, and also allows an application to exercise the bound right. This function does not decrement metered rights. Decrementing metered rights upon use is the responsibility of the application.
     * 
     * When license binding fails because of a missing or out of date revocation list, the return value does not indicate which license or certificate is causing the error. It could be the end-user license, the user's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a>, a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/c-gly">client licensor certificate</a>, or another license or certificate. You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquireadvisories">DRMAcquireAdvisories</a> (and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmregisterrevocationlist">DRMRegisterRevocationList</a>) for each certificate until the error does not occur.
     * 
     * Principal authenticators required for a license must be loaded before calling this function. However, the authenticator can continue to function after the license is created.
     * 
     * When you have finished using the license handle, close it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> function. <b>DRMCloseHandle</b> closes the handle to the library and deletes the license from memory.
     * 
     * 
     * The handle returned by this function can be passed into one of the following functions to navigate deeper into the license hierarchy:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseattribute">DRMGetBoundLicenseAttribute</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseattributecount">DRMGetBoundLicenseAttributeCount</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobjectcount">DRMGetBoundLicenseObjectCount</a>
     * </li>
     * </ul>
     * @param {Integer} hEnv A handle to an environment; the handle is created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Pointer<DRMBOUNDLICENSEPARAMS>} pParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a> structure that specifies additional options; for more information, see the Remarks section. The principal specified here is the one the application will try to bind to. If you pass in <b>NULL</b> to identify the principal or rights group, the first principal or rights group in the license will be used.
     * @param {Pointer<Char>} wszLicenseChain A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a> (or license chain).
     * @param {Pointer<UInt32>} phBoundLicense A pointer to a handle that receives the bound license. The <b>DRMHANDLE</b> passed back through <i>phBoundLicense</i> allows an application to navigate through all the license's objects (such as principals or rights) and attributes (such as maximum play count). A bound license consolidates duplicated rights information in the license and removes any rights information that is not available to the current user.
     * @param {Pointer<UInt32>} phErrorLog This parameter must be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateboundlicense
     */
    static DRMCreateBoundLicense(hEnv, pParams, wszLicenseChain, phBoundLicense, phErrorLog) {
        wszLicenseChain := wszLicenseChain is String? StrPtr(wszLicenseChain) : wszLicenseChain

        result := DllCall("msdrm.dll\DRMCreateBoundLicense", "uint", hEnv, "ptr", pParams, "ptr", wszLicenseChain, "uint*", phBoundLicense, "uint*", phErrorLog, "int")
        return result
    }

    /**
     * Creates a decryption object that is used to decrypt content data.
     * @remarks
     * A consuming application performs the following steps to decrypt content previously encrypted by a publishing application.<ol>
     * <li>Retrieve an end-user license. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> to retrieve the license if it already exists in the store. If function succeeds, go to step 2. If the license is not in the store, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> followed by <b>DRMEnumerateLicense</b>.</li>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> to create a license that binds to one or more rights in the end-user license. The bound license includes a symmetric key that can be used for decryption.</li>
     * <li>Call <b>DRMCreateEnablingBitsDecryptor</b> to create a decrypting object associated with the bound right and content key.</li>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmdecrypt">DRMDecrypt</a> to use the content key to decrypt the content.</li>
     * </ol>
     * 
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> function to close the decrypting object handle when you are finished with it. Both the decrypting object handle and the bound license handle must remain open until decryption is complete.
     * @param {Integer} hBoundLicense A handle to a bound license object created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszRight An optional null-terminated string that contains the right to exercise. A decrypting object can be bound to only one right at a time.
     * @param {Integer} hAuxLib Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<Char>} wszAuxPlug Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} phDecryptor A pointer to the decrypting object.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateenablingbitsdecryptor
     */
    static DRMCreateEnablingBitsDecryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phDecryptor) {
        wszRight := wszRight is String? StrPtr(wszRight) : wszRight
        wszAuxPlug := wszAuxPlug is String? StrPtr(wszAuxPlug) : wszAuxPlug

        result := DllCall("msdrm.dll\DRMCreateEnablingBitsDecryptor", "uint", hBoundLicense, "ptr", wszRight, "uint", hAuxLib, "ptr", wszAuxPlug, "uint*", phDecryptor, "int")
        return result
    }

    /**
     * Creates an AD RMS encrypting object that is used to encrypt content data.
     * @remarks
     * Perform the following steps to encrypt content. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/encrypting-content">Encrypting Content</a>.<ul>
     * <li>Acquire an end-user license. If the issuance license that you are using for this purpose was signed online, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> followed by  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>. If the issuance license was signed offline, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetownerlicense">DRMGetOwnerLicense</a> instead.</li>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> to create a license that binds to the EDIT or OWNER right in the end-user license. The bound license includes a symmetric key that can be used for encryption.</li>
     * <li>Call <b>DRMCreateEnablingBitsEncryptor</b> to create an encrypting object associated with the bound right and content key.</li>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmencrypt">DRMEncrypt</a> to use the content key to encrypt the content.</li>
     * </ul>
     * 
     * 
     * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> function to close the encrypting object handle when you are finished with it. Both the encrypting object handle and the bound license handle must remain open until encryption is complete.
     * @param {Integer} hBoundLicense A handle to a bound license, produced by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszRight Optional null-terminated string containing a right. If you specify <b>NULL</b>, the AD RMS encrypting object binds to the first valid right in the license.
     * @param {Integer} hAuxLib Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<Char>} wszAuxPlug Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<UInt32>} phEncryptor A pointer to the encrypting object.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateenablingbitsencryptor
     */
    static DRMCreateEnablingBitsEncryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phEncryptor) {
        wszRight := wszRight is String? StrPtr(wszRight) : wszRight
        wszAuxPlug := wszAuxPlug is String? StrPtr(wszAuxPlug) : wszAuxPlug

        result := DllCall("msdrm.dll\DRMCreateEnablingBitsEncryptor", "uint", hBoundLicense, "ptr", wszRight, "uint", hAuxLib, "ptr", wszAuxPlug, "uint*", phEncryptor, "int")
        return result
    }

    /**
     * The DRMAttest function is no longer supported and returns E_NOTIMPL.
     * @remarks
     * This function can be used with challenge/response protocols by including the challenge in the data buffer. An output string may contain the principal's certificates, in addition to the signature.
     * 
     * The data is concatenated with the manifest used to initialize the RM environment. A manifest is a signed XrML blob that includes information to authenticate the program and all required DLLs, as well as a list of any prohibited DLLs. The manifest used is the one loaded when the RM environment was initialized. For information about making a manifest, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-application-manifest">Creating an Application Manifest</a>.
     * 
     * To return a value, first call this function with <b>NULL</b> passed into the <i>wszAttestedBlob</i> parameter. The value returned in <i>pcStrLen</i> will indicate the size of the variable the application must create to hold the encoded signature. All buffer allocation and destruction are the responsibility of the caller.
     * 
     * Data signed by using <b>DRMAttest</b> can be verified by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmverify">DRMVerify</a>.
     * @param {Integer} hEnablingPrincipal A handle to an enabling principal object created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a>.
     * @param {Pointer<Char>} wszData The data to encode.
     * @param {Integer} eType An enumeration that determines whether to include full environment data or only a hash.
     * @param {Pointer<UInt32>} pcAttestedBlob Length, in characters, of the string being returned, plus one for a terminating null character.
     * @param {Pointer<Char>} wszAttestedBlob The signed data.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmattest
     */
    static DRMAttest(hEnablingPrincipal, wszData, eType, pcAttestedBlob, wszAttestedBlob) {
        wszData := wszData is String? StrPtr(wszData) : wszData
        wszAttestedBlob := wszAttestedBlob is String? StrPtr(wszAttestedBlob) : wszAttestedBlob

        result := DllCall("msdrm.dll\DRMAttest", "uint", hEnablingPrincipal, "ptr", wszData, "int", eType, "uint*", pcAttestedBlob, "ptr", wszAttestedBlob, "int")
        return result
    }

    /**
     * Requests a secure time from the rights management system.
     * @param {Integer} hEnv Environment handle.
     * @param {Integer} eTimerIdType The type of time returned.
     * @param {Pointer<SYSTEMTIME>} poTimeObject Pointer to a time structure.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgettime
     */
    static DRMGetTime(hEnv, eTimerIdType, poTimeObject) {
        result := DllCall("msdrm.dll\DRMGetTime", "uint", hEnv, "int", eTimerIdType, "ptr", poTimeObject, "int")
        return result
    }

    /**
     * Retrieves information about encrypting or decrypting objects.
     * @remarks
     * Memory allocation and deallocation are handled by the caller. To create a buffer and retrieve information, call this function twice.<ol>
     * <li>Set <i>pbBuffer</i> to <b>NULL</b> and call <b>DRMGetInfo</b>. The function returns the required number of Unicode characters, including the terminating <b>NULL</b> character, in the <i>pcBuffer</i> parameter.</li>
     * <li>Allocate memory for the buffer. Remember that a Unicode character is two bytes long.</li>
     * <li>Call <b>DRMGetInfo</b> again with 
     * <i>pbBuffer</i> equal to the pointer you created when allocating the buffer.</li>
     * <li>Free the allocated memory when you are finished using it.</li>
     * </ol>
     * 
     * 
     * To retrieve  information about the secure environment, you can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetenvironmentinfo">DRMGetEnvironmentInfo</a> function.
     * @param {Integer} handle Specifies the handle to query. This can be created by using one of the following functions:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsdecryptor">DRMCreateEnablingBitsDecryptor</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsencryptor">DRMCreateEnablingBitsEncryptor</a>
     * </li>
     * </ul>
     * <div class="alert"><b>Note</b>  You can specify only the handle of an encrypting or a decrypting object. If you specify any other handle, the function returns <b>E_DRM_INVALID_HANDLE</b>.</div>
     * <div> </div>
     * @param {Pointer<Char>} wszAttribute The attribute of the handle to query for. The supported attributes are <b>g_wszQUERY_BLOCKSIZE</b>, to determine the block size, and <b>g_wszQUERY_SYMMETRICKEY_TYPE</b>, to determine whether the cipher mode is AES ECB or AES CBC 4K. 
     * 
     * <div class="alert"><b>Note</b>  You can use <b>g_wszQUERY_SYMMETRICKEY_TYPE</b> only in Windows 7. It is not available for earlier versions of AD RMS.</div>
     * <div> </div>
     * @param {Pointer<Int32>} peEncoding Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drmencodingtype">DRMENCODINGTYPE</a> enumeration that identifies the type of encoding to be applied to the information retrieved.
     * @param {Pointer<UInt32>} pcBuffer A pointer to a <b>UINT</b> value that, on input, contains the size of the buffer pointed to by the <i>pbBuffer</i> parameter. The size of the buffer is expressed as the number of Unicode characters, including the terminating null character. On output, the value contains the number of characters copied to the buffer. The number copied includes the terminating null character.
     * @param {Pointer<Byte>} pbBuffer A pointer to a null-terminated Unicode string that receives the value associated with the attribute specified by the <i>wszAttribute</i> parameter. The size of this buffer is specified by the <i>pcBuffer</i> parameter. The size is expressed as the number of Unicode characters, including the terminating null character.
     * 
     * <div class="alert"><b>Important</b>  If the publishing license was signed using the <b>AES_CBC4K</b> value, and the <i>wszAttribute</i> parameter is specified as <b>g_wszQUERY_BLOCKSIZE</b>, <i>pbBuffer</i> returns a value of <b>4096</b>.</div>
     * <div> </div>
     * <div class="alert"><b>Important</b>  If <i>wszAttribute</i> is specified as <b>g_wszQUERY_SYMMETRICKEY_TYPE</b>, possible values for <i>pbBuffer</i> include <b>AES</b> for ECB encryption and <b>AES_CBC4K</b> for CBC encryption.</div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetinfo
     */
    static DRMGetInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String? StrPtr(wszAttribute) : wszAttribute

        result := DllCall("msdrm.dll\DRMGetInfo", "uint", handle, "ptr", wszAttribute, "int*", peEncoding, "uint*", pcBuffer, "char*", pbBuffer, "int")
        return result
    }

    /**
     * Returns information about a secure environment.
     * @remarks
     * This function returns information only about environment handles. For information about other handles, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetinfo">DRMGetInfo</a>.
     * 
     * Memory allocation and deallocation are handled by the caller.To create a buffer and retrieve environment information, perform the following steps:
     * 
     * <ol>
     * <li>Call <b>DRMGetEnvironmentInfo</b> with <i>pbBuffer</i> equal to <b>NULL</b>. The function returns the required number of Unicode characters, including the terminating NULL character, in the <i>pcBuffer</i> parameter.</li>
     * <li>Allocate memory for the buffer. Remember that a Unicode character is two bytes long.</li>
     * <li>Call <b>DRMGetEnvironmentInfo</b> again with 
     * <i>pbBuffer</i> equal to the pointer you created when allocating the buffer.</li>
     * <li>When you have finished using the memory, free it.</li>
     * </ol>
     * 
     * 
     * In Rights Management Services client 1.0 SP1, the only supported attribute is <b>g_wszQUERY_BLOCKSIZE</b>. For the attributes that can be queried in Rights Management Services client 1.0, see the Msdrmgetinfo.h header file that installs with this SDK.
     * @param {Integer} handle Environment handle.
     * @param {Pointer<Char>} wszAttribute The attribute to query for. In Rights Management Services client 1.0 SP1, the only supported attribute is <b>g_wszQUERY_BLOCKSIZE</b>. In Rights Management Services client 1.0, the attributes that can be queried are listed in the header file Msdrmgetinfo.h. Attributes include <b>g_wszQUERY_MANIFESTSOURCE</b> and <b>g_wszQUERY_APIVERSION</b>.
     * @param {Pointer<Int32>} peEncoding Encoding type used.
     * @param {Pointer<UInt32>} pcBuffer A pointer to a UINT value that, on input, contains the size of the buffer pointed to by the <i>pbBuffer</i> parameter. The size of the buffer is expressed as the number of Unicode characters, including the terminating null character. On output, the value contains the number of characters copied to the buffer. The number copied includes the terminating null character.
     * @param {Pointer<Byte>} pbBuffer A pointer to a null-terminated Unicode string that receives the value associated with the attribute specified by the <i>wszAttribute</i> parameter. The size of this buffer is specified by the <i>pcBuffer</i> parameter. The size is expressed as the number of Unicode characters, including the terminating null character.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetenvironmentinfo
     */
    static DRMGetEnvironmentInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String? StrPtr(wszAttribute) : wszAttribute

        result := DllCall("msdrm.dll\DRMGetEnvironmentInfo", "uint", handle, "ptr", wszAttribute, "int*", peEncoding, "uint*", pcBuffer, "char*", pbBuffer, "int")
        return result
    }

    /**
     * Returns the address of a function in a library. It is the secure version of the GetProcAddress function.
     * @remarks
     * For more information about this function, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>.
     * @param {Integer} hLibrary A handle to the library where the function resides. Output from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmloadlibrary">DRMLoadLibrary</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<Char>} wszProcName The name of the function to find the address of.
     * @param {Pointer<FARPROC>} ppfnProcAddress Address of the procedure to run.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetprocaddress
     */
    static DRMGetProcAddress(hLibrary, wszProcName, ppfnProcAddress) {
        wszProcName := wszProcName is String? StrPtr(wszProcName) : wszProcName

        result := DllCall("msdrm.dll\DRMGetProcAddress", "uint", hLibrary, "ptr", wszProcName, "ptr", ppfnProcAddress, "int")
        return result
    }

    /**
     * Retrieves the number of occurrences of an object within a specified branch of a license.
     * @remarks
     * Certain license structures, such as a <b>RIGHT</b> structure, may have multiple instances in a license. This method returns a count of these occurrences, so that an application can iterate through them to access a particular one by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a>.
     * 
     * The Active Directory Rights Management system exposes an object-oriented interface to the underlying license XrML. This function, along with other <b>DRMGetBoundLicense_xxx</b> functions, allows an application to navigate this structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/querying-licenses">Querying Licenses</a>.
     * @param {Integer} hQueryRoot A handle to the branch of the license to query, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Pointer<UInt32>} pcSubObjects Number of objects of this type within this branch.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetboundlicenseobjectcount
     */
    static DRMGetBoundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects) {
        wszSubObjectType := wszSubObjectType is String? StrPtr(wszSubObjectType) : wszSubObjectType

        result := DllCall("msdrm.dll\DRMGetBoundLicenseObjectCount", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint*", pcSubObjects, "int")
        return result
    }

    /**
     * Returns an object from a bound license.
     * @remarks
     * There are many kinds of objects in a license, such as principals, rights, and access conditions. The Active Directory Rights Management system exposes an object-oriented interface to the underlying license XrML. This function, along with other <b>DRMGetBoundLicense_xxx</b> functions, allows an application to navigate this structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/querying-licenses">Querying Licenses</a>. On first call, use the license handle itself as the query root.
     * 
     * On first call, this function takes the <b>DRMHANDLE</b> returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * 
     * The <i>wszSubObjectType</i> parameter identifies an XrML type as shown in the following example. Using g_wszQUERY_OBJECTTYPE to query the XrML would return "Group Identity Licensor."
     * 
     * 
     * ```cpp
     * <PRINCIPAL internal-id="1">
     *   <OBJECT type="Group Identity Licensor">
     *   <ID type="Group Identity">someone@example.com</ID> 
     *   <NAME>Pavel's Group Identity</NAME> 
     *   </OBJECT>
     * ```
     * 
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle created by calling this function.
     * @param {Integer} hQueryRoot A handle to a license or license object, from a previous call to this function or from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Integer} iWhich Zero-based index specifying which occurrence to retrieve.
     * @param {Pointer<UInt32>} phSubObject A handle to the returned license object. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetboundlicenseobject
     */
    static DRMGetBoundLicenseObject(hQueryRoot, wszSubObjectType, iWhich, phSubObject) {
        wszSubObjectType := wszSubObjectType is String? StrPtr(wszSubObjectType) : wszSubObjectType

        result := DllCall("msdrm.dll\DRMGetBoundLicenseObject", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint", iWhich, "uint*", phSubObject, "int")
        return result
    }

    /**
     * Retrieves the number of occurrences of an attribute in a license.
     * @remarks
     * Certain attributes, such as maximum use count, may appear in more than one branch of a license. This method returns a count of these occurrences, so that an application can iterate through them to access a particular one by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseattribute">DRMGetBoundLicenseAttribute</a>.
     * 
     * The Active Directory Rights Management system exposes an object-oriented interface to the underlying license XrML. This function, along with other <b>DRMGetBoundLicense_xxx</b> functions, allows an application to navigate this structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/querying-licenses">Querying Licenses</a>.
     * @param {Integer} hQueryRoot A handle to a license or license object, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszAttribute Name of the attribute to count.
     * @param {Pointer<UInt32>} pcAttributes Count of attribute occurrences.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetboundlicenseattributecount
     */
    static DRMGetBoundLicenseAttributeCount(hQueryRoot, wszAttribute, pcAttributes) {
        wszAttribute := wszAttribute is String? StrPtr(wszAttribute) : wszAttribute

        result := DllCall("msdrm.dll\DRMGetBoundLicenseAttributeCount", "uint", hQueryRoot, "ptr", wszAttribute, "uint*", pcAttributes, "int")
        return result
    }

    /**
     * Retrieves a bound license attribute from the license XrML.
     * @remarks
     * The Active Directory Rights Management system exposes an object-oriented interface to the underlying license XrML. This function, along with other <b>DRMGetBoundLicense_xxx</b> functions, allows an application to navigate this structure.
     * 
     * Attributes hold information about an object, such as its name, issue time, or SKU value. To obtain attribute information, you must first determine the size of the buffer needed to hold the retrieved information by calling the function with <b>NULL</b> in the <i>pbBuffer</i> value. If the function succeeds and returns a value in <i>pcBuffer</i>, then allocate a properly sized buffer by using this value and call the function again, passing in to <i>pbBuffer</i> the allocated buffer to receive the value of the attribute.
     * 
     * An object can have several instances of an attribute with the same name. For example, there can be several authenticator type values in a license. In this case, it may be necessary to iterate through all the instances of an attribute by first calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseattributecount">DRMGetBoundLicenseAttributeCount</a> to get a count of existing objects and then looping through all <i>iWhich</i> instances of the attribute, starting at zero and incrementing by one.
     * @param {Integer} hQueryRoot A handle to a root query object, from a previous call to this function or from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {Pointer<Char>} wszAttribute The attribute to retrieve.
     * @param {Integer} iWhich Zero-based index of the occurrence to retrieve.
     * @param {Pointer<Int32>} peEncoding Encoding type used.
     * @param {Pointer<UInt32>} pcBuffer Size, in characters, of the attribute retrieved plus one for a terminating null character.
     * @param {Pointer<Byte>} pbBuffer Pointer to the attribute object.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetboundlicenseattribute
     */
    static DRMGetBoundLicenseAttribute(hQueryRoot, wszAttribute, iWhich, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String? StrPtr(wszAttribute) : wszAttribute

        result := DllCall("msdrm.dll\DRMGetBoundLicenseAttribute", "uint", hQueryRoot, "ptr", wszAttribute, "uint", iWhich, "int*", peEncoding, "uint*", pcBuffer, "char*", pbBuffer, "int")
        return result
    }

    /**
     * Creates a client session, which hosts license storage sessions and is used in activation and other function calls.
     * @remarks
     * If this function is successful, the AD RMS server returns a client session handle that is used by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a> to create a rights account certificate (RAC) in the license store for the new client session. The RAC is created by using the credentials of the logged–on user. If the email address specified in the <i>wszGroupID</i> parameter does not match that specified in the credentials, functions such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmisactivated">DRMIsActivated</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> that use information associated with the client session to search the license store for the RAC will fail.
     * 
     * For example, assume that  the user logged on by using cat@example.com but the <i>wszGroupID</i> parameter is set to dog@example.com. The RAC is created for cat@example.com. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> function, however, searches the license store for a RAC that contains  dog@example.com and fails.
     * 
     * All license storage sessions must be closed before closing the client session. When you have finished using the client session, close it by passing the handle provided by this function to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function.
     * 
     * The <b>DRMCreateClientSession</b> function cannot be called concurrently by different processes running as different users on the same computer if one or more of these processes is a service process. A call by a second  process, for example, can succeed only after the client session handle for the first process has been closed.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to an application-defined callback function that will receive asynchronous function status messages in response to other AD RMS functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a>. The format of this callback function is defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>. This parameter cannot be <b>NULL</b>.
     * @param {Integer} uCallbackVersion Specifies the version of the callback function. Currently, only version zero is supported.
     * @param {Pointer<Char>} wszGroupIDProviderType 
     * @param {Pointer<Char>} wszGroupID A pointer to a null-terminated Unicode string that contains an email address for the user in the format <i>someone@example.com</i>. Typically, this value already exists in Active Directory (AD) and is the same ID as that supplied in the logon credentials. If it is not the same, later calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmisactivated">DRMIsActivated</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> will fail. For more information, see Remarks.
     * 
     * Set this parameter to  <b>NULL</b> if you intend only to use the client session handle created by this function to retrieve a service location by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a>.
     * @param {Pointer<UInt32>} phClient A pointer to a <b>DRMHSESSION</b> value that receives the client session handle. When you have finished using the client session, close it by passing this handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateclientsession
     */
    static DRMCreateClientSession(pfnCallback, uCallbackVersion, wszGroupIDProviderType, wszGroupID, phClient) {
        wszGroupIDProviderType := wszGroupIDProviderType is String? StrPtr(wszGroupIDProviderType) : wszGroupIDProviderType
        wszGroupID := wszGroupID is String? StrPtr(wszGroupID) : wszGroupID

        result := DllCall("msdrm.dll\DRMCreateClientSession", "ptr", pfnCallback, "uint", uCallbackVersion, "ptr", wszGroupIDProviderType, "ptr", wszGroupID, "uint*", phClient, "int")
        return result
    }

    /**
     * Indicates whether the current user or machine is activated.
     * @remarks
     * You can call <b>DRMIsActivated</b> to determine the current state of computer or user activation before calling any function that requires prior activation. If <b>DRMIsActivated</b> fails, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a>.
     * 
     * This function internally uses information contained in the client session. If the user ID associated with the client session does not match the ID of the logged–on user, this function will fail. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>.
     * @param {Integer} hClient A handle to a client session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer<DRM_ACTSERV_INFO>} pActServInfo This parameter is reserved and must be set to <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmisactivated
     */
    static DRMIsActivated(hClient, uFlags, pActServInfo) {
        result := DllCall("msdrm.dll\DRMIsActivated", "uint", hClient, "uint", uFlags, "ptr", pActServInfo, "int")
        return result
    }

    /**
     * Obtains a lockbox and machine certificate for a machine or a rights account certificate for a user.
     * @remarks
     * If an application attempts to activate a user on a computer that has not yet been activated, the function will fail. We recommend that an application call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmisactivated">DRMIsActivated</a> before calling this function to determine the activation status of the computer. Activating a machine that is already activated will overwrite the existing lockbox and machine certificate. Activating a user a second time will add an additional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> to the computer. A user needs to activate a particular computer only once, although updates in the lockbox architecture may require downloading and activating a new lockbox.
     * 
     * There are several options in activation.<table>
     * <tr>
     * <th>Option</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Silent or nonsilent</td>
     * <td>Nonsilent activation is the default. Silent activation is specified by <b>DRM_ACTIVATE_SILENT</b> and is required for machine activation.  If silent activation is specified and <i>pActServInfo</i> is not <b>NULL</b>, the function creates and sends an activation request to the URL specified in the <b>wszURL</b> member of <i>pActServInfo</i>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drm_actserv_info">DRM_ACTSERV_INFO</a>.</td>
     * </tr>
     * <tr>
     * <td>Windows or Windows Live ID</td>
     * <td>This is determined by the type of client handle passed in to <i>hClient</i>.</td>
     * </tr>
     * <tr>
     * <td>Temporary or permanent</td>
     * <td>This applies only to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> (RAC), not to a machine certificate. Permanent activation is the default. Temporary is specified by the <b>DRM_ACTIVATE_TEMPORARY</b> flag. When you acquire a temporary RAC by using the <b>DRM_ACTIVATE_TEMPORARY</b> flag, the RAC is stored in the permanent license store, though it will expire shortly. The default validity time for a temporary RAC is 15 minutes, although this can be changed by the AD RMS service's administrator. To avoid cluttering the license store with expired RACs, you should delete a temporary RAC when ending a client session.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The following list describes what happens with combinations of these options.<table>
     * <tr>
     * <th>Option</th>
     * <th>Temporary</th>
     * <th>Permanent</th>
     * </tr>
     * <tr>
     * <td>Silent Windows</td>
     * <td>Activation occurs without a dialog box. The user currently logged in is activated.</td>
     * <td>Activation occurs without a dialog box. The user currently logged in is activated.</td>
     * </tr>
     * <tr>
     * <td>Nonsilent Windows</td>
     * <td>A Windows password dialog box appears. The user specified is activated.</td>
     * <td>A Windows password dialog box appears. The user specified is activated.</td>
     * </tr>
     * <tr>
     * <td>Silent Windows Live ID</td>
     * <td>Not allowed.</td>
     * <td>Not allowed.</td>
     * </tr>
     * <tr>
     * <td>Nonsilent Windows Live ID</td>
     * <td>A Windows Live ID login window appears. The user specified is activated.</td>
     * <td>A Windows Live ID login window appears. The user specified is activated.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * During execution, <b>DRMActivate</b> calls into the user-defined callback function and sets the <i>msg</i> parameter to <b>DRM_MSG_ACTIVATE_MACHINE</b> or <b>DRM_MSG_ACTIVATE_GROUPIDENTITY</b>. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>.
     * @param {Integer} hClient A handle to a client session, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>.
     * @param {Integer} uFlags Specifies the type of activation wanted, plus additional options; for more information, see Remarks. This parameter can be a combination of one or more of the following flags.
     * @param {Integer} uLangID The language ID used by the application. If this parameter is set to zero, the default language ID for the logged-on user is used.
     * @param {Pointer<DRM_ACTSERV_INFO>} pActServInfo Optional server information. If the client has not been configured to use Active Directory Federation Services (ADFS) with AD RMS, you can pass <b>NULL</b> to use the Windows Live ID service for service discovery. If the client has been configured to use ADFS, you must pass the Windows Live certification URL. <!-- Currently, the Windows Live ID certification service URL is https://certification.isv.drm.microsoft.com/certification/certification.asmx.--> For more information about service discovery, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {Pointer<Void>} hParentWnd Parent window handle used in nonsilent Windows Live ID activation (user activation only). In nonsilent activation, a Windows Live ID window opens to request user information. This parameter allows the application to assign an arbitrary window as the window's parent. If this parameter is <b>NULL</b>, the active window is used.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmactivate
     */
    static DRMActivate(hClient, uFlags, uLangID, pActServInfo, pvContext, hParentWnd) {
        result := DllCall("msdrm.dll\DRMActivate", "uint", hClient, "uint", uFlags, "uint", uLangID, "ptr", pActServInfo, "ptr", pvContext, "ptr", hParentWnd, "int")
        return result
    }

    /**
     * Retrieves the URL of a server that can perform various rights management services, such as activation or license acquisition.
     * @remarks
     * Discovery of the service URL depends on the interaction between the <i>uServiceType</i>, <i>uServiceLocation</i>, and <i>wszIssuanceLicense</i> parameters in the following manner.
     * 
     * If you set the <i>uServiceType</i> parameter to DRM_SERVICE_TYPE_CERTIFICATION or to  DRM_SERVICE_TYPE_ACTIVATION and:<ul>
     * <li>You pass a signed issuance license to the <i>wszIssuanceLicense</i> parameter. The licensing URL is retrieved from the signed issuance license, a call is made to the licensing server to discover the certification URL that corresponds with the calling user, and the function returns the certification URL.</li>
     * <li>You set the <i>wszIssuanceLicense</i> parameter to <b>NULL</b> and the <i>uServiceLocation</i> parameter to DRM_SERVICE_LOCATION_INTERNET, the function returns an error code of E_DRM_USE_DEFAULT.</li>
     * <li>You set the <i>wszIssuanceLicense</i> parameter to <b>NULL</b>, and the  <i>uServiceLocation</i> parameter to DRM_SERVICE_LOCATION_ENTERPRISE, the URL is retrieved from the registry or from Active Directory (AD).</li>
     * </ul>
     * 
     * 
     * If you set the <i>uServiceType</i> parameter to DRM_SERVICE_TYPE_PUBLISHING or to DRM_SERVICE_TYPE_CLIENTLICENSOR and:<ul>
     * <li>You set the <i>uServiceLocation</i> parameter to DRM_SERVICE_LOCATION_INTERNET, the Passport service is supported to retrieve a service URL from the web.</li>
     * <li>You set the  <i>uServiceLocation</i> parameter to DRM_SERVICE_LOCATION_ENTERPRISE and the <i>wszIssuanceLicense</i> parameter to <b>NULL</b>, the licensing service URL is retrieved from the registry and returned by the function call. Or, in the absence of a registry entry, the certification URL is retrieved from the service connection point in Active Directory (AD), a call is made to the certification server to discover the licensing service URL, and the function returns the licensing service URL.</li>
     * <li>You set the  <i>uServiceLocation</i> parameter to DRM_SERVICE_LOCATION_ENTERPRISE and pass a signed issuance license to the <i>wszIssuanceLicense</i> parameter, the function attempts to retrieve the configured licensing URL from the registry. If this attempt fails, the licensing URL is retrieved from the signed issuance license and a call is made to the licensing server to discover the user's specific licensing URL.</li>
     * </ul>
     * 
     * 
     * For the preceding cases where the function searches the registry, you can force your application to find a specific URL by adding the appropriate registry key in the following list, along with the URL, as a string value called <b>(default)</b>.  Do not add the .asmx page to the URL.<table>
     * <tr>
     * <th>Registry key</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <ul>
     * <li>32-bit application on a 32-bit computer</li>
     * <li>64-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>Activation</b>
     * 
     * <ul>
     * <li>32-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Wow6432Node</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>Activation</b>
     * 
     * </td>
     * <td>
     * For RMS v1.0, set this registry value to the URL of a computer activation service. To use this value for certification, set it to the certification virtual root of the enterprise.
     * 
     * Beginning with RMS v1.0 SP1, this value can only be used to discover a certification service. Therefore, set it to the URL of the rights account virtual root, http://<i>ServerName</i>/_wmcs/certification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <ul>
     * <li>32-bit application on a 32-bit computer</li>
     * <li>64-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>EnterprisePublishing</b>
     * 
     * <ul>
     * <li>32-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Wow6432Node</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>EnterprisePublishing</b>
     * 
     * </td>
     * <td>Set this registry value to the URL of a service that signs issuance licenses within an enterprise network.</td>
     * </tr>
     * <tr>
     * <td>
     * <ul>
     * <li>32-bit application on a 32-bit computer</li>
     * <li>64-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>CloudPublishing</b>
     * 
     * <ul>
     * <li>32-bit application on a 64-bit computer</li>
     * </ul>
     * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Wow6432Node</b>&#92;<b>Microsoft</b>&#92;<b>MSDRM</b>&#92;<b>ServiceLocation</b>&#92;<b>CloudPublishing</b>
     * 
     * </td>
     * <td>Set this registry value to the URL of a service that signs issuance licenses over the Internet.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The application is responsible for allocating and freeing memory for the retrieved data. To find the buffer size required, call the function with <b>NULL</b> in the <i>wszServiceURL</i> parameter. The buffer size will be passed back to you  through the <i>puServiceURLLength</i> parameter.
     * 
     * For a service discovery code example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/onlinesigning-getserviceurl-cpp">OnlineSigning_GetServiceURL.cpp</a>. There is no service discovery for acquiring <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user licenses</a> because this information can be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/i-gly">issuance license</a> used to acquire the <i>end-user license</i>.
     * @param {Integer} hClient A handle to a client session. The handle can be obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. The handle is optional and can be <b>NULL</b>.
     * @param {Integer} uServiceType 
     * @param {Integer} uServiceLocation 
     * @param {Pointer<Char>} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains a signed issuance license. This parameter can be <b>NULL</b>. For more information, see Remarks.
     * @param {Pointer<UInt32>} puServiceURLLength A pointer to a <b>UINT</b> that, on input, contains the size, in characters, of the <i>wszServiceURL</i> buffer. This value includes the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszServiceURL</i> buffer.
     * 
     * If <i>wszServiceURL</i> is <b>NULL</b>, this <b>UINT</b> receives the number of characters, including the terminating null character, that are required for the server URL.
     * @param {Pointer<Char>} wszServiceURL A pointer to a Unicode string buffer that receives the URL of the server. The <i>puServiceURLLength</i> parameter contains the size, in characters, including the terminating null character, of this buffer.
     * 
     * If this parameter is <b>NULL</b>, <i>puServiceURLLength</i> receives the number of characters, including the terminating null character, that are required for the server URL.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetservicelocation
     */
    static DRMGetServiceLocation(hClient, uServiceType, uServiceLocation, wszIssuanceLicense, puServiceURLLength, wszServiceURL) {
        wszIssuanceLicense := wszIssuanceLicense is String? StrPtr(wszIssuanceLicense) : wszIssuanceLicense
        wszServiceURL := wszServiceURL is String? StrPtr(wszServiceURL) : wszServiceURL

        result := DllCall("msdrm.dll\DRMGetServiceLocation", "uint", hClient, "uint", uServiceType, "uint", uServiceLocation, "ptr", wszIssuanceLicense, "uint*", puServiceURLLength, "ptr", wszServiceURL, "int")
        return result
    }

    /**
     * Creates a license storage session, which is needed to acquire or manipulate a license.
     * @remarks
     * A license storage session is used for acquiring, deleting, and enumerating licenses, among other uses. To actually bind to a license and exercise its rights, an application must use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * 
     * The environment handle and default library handle are created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * 
     * The handle returned in the <i>phLicenseStorage</i> parameter must be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function when the license storage session is no longer needed.
     * @param {Integer} hEnv A handle to the AD RMS environment. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Integer} hDefaultLibrary A handle to the default library. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Integer} hClient A handle to a client session. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {Integer} uFlags This parameter is reserved and must be set to zero.
     * @param {Pointer<Char>} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains a signed issuance license. The created license storage session is associated with this issuance license.
     * @param {Pointer<UInt32>} phLicenseStorage A pointer to a handle that receives the license storage session handle. This handle must be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function when the license storage session is no longer needed.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreatelicensestoragesession
     */
    static DRMCreateLicenseStorageSession(hEnv, hDefaultLibrary, hClient, uFlags, wszIssuanceLicense, phLicenseStorage) {
        wszIssuanceLicense := wszIssuanceLicense is String? StrPtr(wszIssuanceLicense) : wszIssuanceLicense

        result := DllCall("msdrm.dll\DRMCreateLicenseStorageSession", "uint", hEnv, "uint", hDefaultLibrary, "uint", hClient, "uint", uFlags, "ptr", wszIssuanceLicense, "uint*", phLicenseStorage, "int")
        return result
    }

    /**
     * Adds an end-user license to the temporary or permanent license store.
     * @remarks
     * An application can manage its own end-user licenses instead of submitting them to the computer's permanent license store. To do so, the application calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> with <b>DRM_AL_NOPERSIST</b> specified. The application then retrieves the license from the license store using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>, deletes the license from the license store using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmdeletelicense">DRMDeleteLicense</a>, and saves the end-user license itself. The temporary license store is destroyed when the reader session ends. To use the license the next time, the application must add it to the temporary license store using this function. <b>DRMAddLicense</b> can be called multiple times to add multiple licenses to the temporary license store.
     * @param {Integer} hLicenseStorage A handle to a license storage session, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a>.
     * @param {Integer} uFlags 
     * @param {Pointer<Char>} wszLicense A pointer to null-terminated string that contains the end-user license chain to add to the temporary or permanent license store.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmaddlicense
     */
    static DRMAddLicense(hLicenseStorage, uFlags, wszLicense) {
        wszLicense := wszLicense is String? StrPtr(wszLicense) : wszLicense

        result := DllCall("msdrm.dll\DRMAddLicense", "uint", hLicenseStorage, "uint", uFlags, "ptr", wszLicense, "int")
        return result
    }

    /**
     * Retrieves revocation lists required by a submitted license.
     * @remarks
     * This function retrieves advisory lists asynchronously. The URL where the revocation list is posted is stored in the license that is passed in, but it can be overridden by <i>wszURL</i>.
     * 
     * After an advisory list has been obtained, it must be registered by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmregisterrevocationlist">DRMRegisterRevocationList</a>. It is simplest to enumerate all licenses in the license store by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> and then register each, rather than attempting to locate the item you just acquired.
     * 
     * You should periodically delete duplicate or outdated revocation lists from the license store by enumerating revocation lists. To enumerate revocation lists, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> with the <b>DRM_EL_EXPIRED</b> flag, and then call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmdeletelicense">DRMDeleteLicense</a>. Because enumerating and examining licenses can be time-consuming, an application might perform this task only periodically.
     * 
     * An application will be informed that a new revocation list must be acquired if the call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> function returns <b>E_DRM_BIND_REVOCATION_LIST_STALE</b> or <b>E_DRM_BIND_NO_APPLICABLE_REVOCATION_LIST</b>.
     * 
     * For more information about revocation lists and how to create them, see the Active Directory Rights Management Services deployment guide, which comes with <a href="https://www.microsoft.com/downloads/details.aspx?FamilyId=8EF6D80A-6A9C-4FB9-AB51-790980816FFE&displaylang=en">Rights Management Services</a>.
     * 
     * The application callback function specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-advisory">DRM_MSG_ACQUIRE_ADVISORY</a> message to provide status feedback.
     * @param {Integer} hLicenseStorage A handle to a license storage session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function.
     * @param {Pointer<Char>} wszLicense A pointer to a null-terminated Unicode string that contains the license that requires a revocation list. This can be any license or certificate (or certificate chain or concatenated licenses) that supports revocation lists, including <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user licenses</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificates</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/c-gly">client licensor certificates</a>.
     * @param {Pointer<Char>} wszURL A pointer to a null-terminated Unicode string that contains an additional URL to query for advisories. This will be checked in addition to any URLs mentioned in the license passed in. This parameter can be set to <b>NULL</b>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmacquireadvisories
     */
    static DRMAcquireAdvisories(hLicenseStorage, wszLicense, wszURL, pvContext) {
        wszLicense := wszLicense is String? StrPtr(wszLicense) : wszLicense
        wszURL := wszURL is String? StrPtr(wszURL) : wszURL

        result := DllCall("msdrm.dll\DRMAcquireAdvisories", "uint", hLicenseStorage, "ptr", wszLicense, "ptr", wszURL, "ptr", pvContext, "int")
        return result
    }

    /**
     * Enumerates valid licenses, machine certificates or rights account certificates, revocation lists for the current user, or issuance license templates.
     * @remarks
     * By default, this function enumerates only unexpired licenses as determined by comparing the <b>VALIDITYTIME</b> element in each license with the creation time of the session object. To include expired licenses in the enumeration, combine the <i>uFlags</i> parameter with <b>DRM_EL_EXPIRED</b>.
     * 
     * Also, if the <b>ID</b> element in the <b>ISSUEDPRINCIPALS</b> element of the license does not match the user ID associated with the session object, or the session user ID does not match the ID of the logged–on user, this function will fail. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>.
     * 
     * The following sections discuss how to enumerate the various types of licenses. When iterating through a collection, you can examine each license retrieved by manually parsing the XrML string or, in some cases, by binding to the license and using the <b>DRMGetBoundLicense*</b> functions.
     * 
     * 
     * Perform the following steps to enumerate an end-user license:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a>, passing in a signed issuance license.</li>
     * <li>Set the <i>uIndex</i> parameter to zero and the  <i>uFlags</i> parameter to <b>DRM_EL_EUL</b> and call <b>DRMEnumerateLicense</b>. The AD RMS client retrieves the first valid EUL for which the content ID matches the content ID of the issuance license used to create the license storage session. If, however, the issuance license was republished with the same content ID but different rights, the EUL returned may not be the one sought. If it is not, increment the <i>uIndex</i> parameter and call <b>DRMEnumerateLicense</b> again. You can continue iterating until you find the correct EUL or the function returns  <b>E_DRM_NO_MORE_DATA</b>.</li>
     * </ol>
     * 
     * 
     * Perform the following steps to enumerate a machine certificate:<ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> to create a session object. The type of session created determines the nature of the value returned in the <i>pfSharedFlag</i> parameter. For more information, see the <b>DRM_EL_MACHINE</b> constant in the <i>uFlags</i> parameter.</li>
     * <li>Set the <i>uIndex</i> parameter to zero or one and the  <i>uFlags</i> parameter to <b>DRM_EL_MACHINE</b> and call <b>DRMEnumerateLicense</b>.</li>
     * </ol>
     * 
     * 
     * Perform the following steps to enumerate rights account certificates (RACs):<ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> to create a client session.</li>
     * <li>Set the <i>uIndex</i> parameter to zero and the  <i>uFlags</i> parameter to <b>DRM_EL_GROUPIDENTITY</b> and call <b>DRMEnumerateLicense</b>.</li>
     * <li>Examine the RAC returned. If it is not the one sought, increment <i>uIndex</i> and call <b>DRMEnumerateLicense</b> again. You can continue iterating until you find the correct RAC or the function returns  <b>E_DRM_NO_MORE_DATA</b>.</li>
     * </ol>
     * 
     * 
     * Perform the following steps to enumerate client licensor certificates (CLCs):<ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> to create a client session.</li>
     * <li>Set the <i>uIndex</i> parameter to zero and the  <i>uFlags</i> parameter to <b>DRM_EL_CLIENTLICENSOR</b> and call <b>DRMEnumerateLicense</b>.</li>
     * <li>Examine the CLC returned. If it is not the one sought, increment <i>uIndex</i> and call <b>DRMEnumerateLicense</b> again. You can continue iterating until you find the correct CLC or the function returns  <b>E_DRM_NO_MORE_DATA</b>.</li>
     * </ol>
     * 
     * 
     * Perform the following steps to enumerate issuance license templates:<ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> to create a client session.</li>
     * <li>Set the <i>uIndex</i> parameter to zero and the  <i>uFlags</i> parameter to <b>DRM_EL_ISSUANCELICENSE_TEMPLATE</b> and call <b>DRMEnumerateLicense</b>.</li>
     * <li>Examine the template. If it is not the one sought, increment <i>uIndex</i> and call <b>DRMEnumerateLicense</b> again. You can continue iterating until you find the correct template or the function returns  <b>E_DRM_NO_MORE_DATA</b>.</li>
     * </ol>
     * 
     * 
     * Perform the following steps to enumerate revocation lists:<ol>
     * <li>Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> to create a session object. Use the client session handle to retrieve revocation lists for rights account or client licensor certificates. Use the license storage session handle to retrieve the revocation lists for end user licenses.</li>
     * <li>Set the <i>uIndex</i> parameter to zero and the  <i>uFlags</i> parameter to <b>DRM_EL_REVOCATIONLIST</b> and call <b>DRMEnumerateLicense</b>.</li>
     * <li>If the revocation list is not the one sought, increment <i>uIndex</i> and call <b>DRMEnumerateLicense</b> again. You can continue iterating until you find the correct list or the function returns  <b>E_DRM_NO_MORE_DATA</b>.</li>
     * </ol>
     * 
     * 
     * You must call <b>DRMEnumerateLicense</b> twice to retrieve one license. Set the <i>wszCertificateData</i> to <b>NULL</b> on the first call to retrieve the required buffer size. Allocate memory and call <b>DRMEnumerateLicense</b> again. This is illustrated by the following example.
     * 
     * 
     * ```cpp
     * // Call DRMEnumerateLicense with the wszCertificateData parameter set
     * // to NULL.
     * hr = DRMEnumerateLicense( 
     *          hClient,                          // Client session handle
     *          DRM_EL_SPECIFIED_CLIENTLICENSOR,  // Flags
     *          0,                                // Index
     *          &fShared,                         // Shared license
     *          &uiClientLicensorCertLength,      // Certificate length
     *          NULL                              // Certificate
     *          );
     * 
     * if ( FAILED( hr ) && ( E_DRM_NO_MORE_DATA != hr ) )
     * {
     *    goto e_Exit;
     * }
     * 
     * // There are no client licensor certificates. Acquire one.
     * else if ( E_DRM_NO_MORE_DATA == hr )
     * {
     *     // TODO: Acquire a client licensor certificate.
     * }
     * 
     * // A client licensor certificate was found. Allocate memory and
     * // call DRMEnumerateLicense again.
     * else
     * {
     * 
     *    wszClientLicensorCert = new WCHAR[ uiClientLicensorCertLength ];
     *    if ( NULL == wszClientLicensorCert )
     *    {
     *       hr = E_OUTOFMEMORY;
     *       goto e_Exit;
     *    }
     * 
     *    hr = DRMEnumerateLicense( 
     *          hClient,                          // Client session handle
     *          DRM_EL_SPECIFIED_CLIENTLICENSOR,  // Flags
     *          0,                                // Index
     *          &fShared,                         // Shared license
     *          &uiClientLicensorCertLength,      // Certificate length
     *          wszClientLicensorCert             // Certificate
     *          );
     * 
     *    if ( FAILED( hr ) )
     *    {
     *       goto e_Exit;
     *    }
     * }
     * 
     * e_Exit:
     * 
     *     if ( NULL != hClient )
     *     {
     *         hr = DRMCloseSession( hClient );
     *     }
     * 
     *     if ( NULL != wszUserId )
     *     {
     *         delete [] wszUserId;
     *     }
     * 
     * 
     *     if ( NULL != wszLicensingSvr )
     *     {
     *         delete [] wszLicensingSvr;
     *     }
     * 
     *     if ( NULL != wszClientLicensorCert )
     *     {
     *         delete [] wszClientLicensorCert;
     *     }
     * 
     *     return hr;
     * 
     * 
     * ```
     * @param {Integer} hSession A handle to a client or license storage session. The type of session passed into <i>hSession</i> depends on the type of item to enumerate. To enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user licenses</a>, use a license storage session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. To enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/m-gly">machine certificates</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificates</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/c-gly">client licensor certificates</a>, or issuance license templates, use a client session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. Use either type of handle to enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">revocation lists</a>.
     * @param {Integer} uFlags 
     * @param {Integer} uIndex The index number of the certificate or license to retrieve. To begin an enumeration, pass in zero for this parameter. To obtain subsequent licenses, increment this value until the function returns <b>E_DRM_NO_MORE_DATA</b>. For more information, see Remarks.
     * @param {Pointer<Int32>} pfSharedFlag A pointer to a <b>BOOL</b> value that receives one (1) if the retrieved license is shared or zero (0) if the retrieved license is not shared.
     * @param {Pointer<UInt32>} puCertificateDataLen A pointer to a UINT value that, on entry, contains the size of the <i>wszCertificateData</i> buffer. This size includes the terminating null character. After the function returns, this value contains the number of characters copied to the buffer, including the terminating null character.
     * 
     * To obtain the necessary size of the buffer, pass <b>NULL</b> for <i>wszCertificateData</i>. The required number of characters, including the terminating null character, will be placed in this value.
     * @param {Pointer<Char>} wszCertificateData A pointer to  a null-terminated Unicode string that receives the license, ID, or template depending on which flags were 
     * set.
     * 
     * To obtain the necessary size of this buffer, pass <b>NULL</b> for <i>wszCertificateData</i>. The required number of characters, including the terminating null character, will be placed in <i>puCertificateDataLen</i>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmenumeratelicense
     */
    static DRMEnumerateLicense(hSession, uFlags, uIndex, pfSharedFlag, puCertificateDataLen, wszCertificateData) {
        wszCertificateData := wszCertificateData is String? StrPtr(wszCertificateData) : wszCertificateData

        result := DllCall("msdrm.dll\DRMEnumerateLicense", "uint", hSession, "uint", uFlags, "uint", uIndex, "int*", pfSharedFlag, "uint*", puCertificateDataLen, "ptr", wszCertificateData, "int")
        return result
    }

    /**
     * Attempts to acquire an end-user license or client licensor certificate asynchronously.
     * @remarks
     * This function is used for retrieving an end-user license or client licensor certificate asynchronously. There 
     *      is no synchronous version of this function. To cancel a license request in process, call 
     *      <b>DRMAcquireLicense</b> again with 
     *      <b>DRM_AL_CANCEL</b> specified in <i>uFlags</i>. The progress of this 
     *      function, and any data returned,  will be returned to the callback function (see 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>).
     * 
     * If the retrieved end-user license requires any revocation lists, these are acquired at the same time, unless 
     *      <b>DRM_AL_FETCHNOADVISORY</b> is specified in <i>uFlags</i>. A failure to 
     *      retrieve required revocation lists will be indicated by <b>E_DRM_NO_CONNECT</b>. The 
     *      application must register any retrieved lists by using 
     *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmregisterrevocationlist">DRMRegisterRevocationList</a>.
     * 
     * This function can occur silently or nonsilently.
     * 
     * <div class="alert"><b>Note</b>  Nonsilent license acquisition is supported only in RMS client 1.0. Effective with RMS client 1.0 SP1, 
     *      nonsilent license acquisition is no longer supported, and MSDRMCtrl.dll is not shipped.</div>
     * <div> </div>
     * In nonsilent license acquisition, a license acquisition URL is returned to the callback function in a 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drm_license_acq_data">DRM_LICENSE_ACQ_DATA</a> structure. The application then 
     *      opens a web browser that is directed to a URL that specifies an HTML page that contains the ActiveX control in 
     *      MSDRMCtrl.dll. The page is used to obtain additional information, such as a credit card number, and 
     *      then calls the ActiveX control's <b>AcquireLicense</b> 
     *      function, which causes license acquisition to proceed as normal. The license can only be returned to the 
     *      permanent license store.
     * 
     * In  silent license acquisition, no webpages need be opened, and license acquisition progress is noted in the 
     *      application's callback function.
     * 
     * The retrieved license is added to the temporary or permanent license store, depending on whether 
     *      <b>DRM_AL_NOPERSIST</b> is specified or not. In nonsilent license acquisition, the acquired 
     *      license cannot be added to the temporary license store, only to the permanent license store, where it must be 
     *      retrieved by  using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>. The 
     *      following list describes possible combinations of license acquisition type with license store type.
     * 
     * <table>
     * <tr>
     * <th>License store</th>
     * <th>Silent acquisition</th>
     * <th>Nonsilent acquisition</th>
     * </tr>
     * <tr>
     * <td>Temporary</td>
     * <td><b>DRM_AL_NOPERSIST</b></td>
     * <td>Not possible</td>
     * </tr>
     * <tr>
     * <td>Permanent</td>
     * <td>No flags</td>
     * <td><b>DRM_AL_NONSILENT</b></td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Although the issuance license is signed and protected by encryption, it would be possible for a malicious publisher to include the URL of a malicious website; there is no way to verify the nature of this URL in advance.</div>
     * <div> </div>
     * AD RMS allows an administrator to specify an extranet licensing  URL in addition to an internal (intranet) URL. Each  URL is copied into the license under a separate &lt;DISTRIBUTIONPOINT&gt; node with the internal URL appearing first. This is illustrated by the following example.
     * 
     * 
     * ```xml
     * 
     *       <DISTRIBUTIONPOINT>
     *       - <OBJECT type="License-Acquisition-URL">
     *           <ID type="MS-GUID">
     *             {0F45FD50-383B-43EE-90A4-ED013CD0CFE5}
     *           </ID> 
     *           <NAME>DRM Server Cluster</NAME> 
     *           <ADDRESS type="URL">
     *             https://corprights/_wmcs/licensing
     *           </ADDRESS> 
     *         </OBJECT>
     *       </DISTRIBUTIONPOINT>
     *       <DISTRIBUTIONPOINT>
     *       - <OBJECT type="Extranet-License-Acquisition-URL">
     *           <ID type="MS-GUID">
     *             {94BF969A-CA04-44d6-AA96-51071281FAG2}
     *           </ID> 
     *           <NAME>DRM Server Cluster</NAME> 
     *           <ADDRESS type="URL">
     *             https://corprights.example.com/_wmcs/licensing
     *           </ADDRESS> 
     *         </OBJECT>
     *       </DISTRIBUTIONPOINT>
     * 
     * ```
     * 
     * 
     * Multiple URLs are often specified so that  users can access protected content both at work and at home. The second URL provides a license acquisition point that does not require the user working at home to log on to the corporate network. The <b>DRMAcquireLicense</b> function, however, uses the first URL by default. Therefore, to allow the consumer to use an alternate URL, your application must parse the license.
     * @param {Integer} hSession A handle to a client or license storage session.
     * 
     * A client session handle is obtained by using the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. In this case, 
     *        a client licensor certificate is acquired. The application callback function specified in the <b>DRMCreateClientSession</b> function will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-clientlicensor">DRM_MSG_ACQUIRE_CLIENTLICENSOR</a> message to provide status feedback.
     * 
     * A license storage session handle is obtained by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. In this case, an end-user license is acquired. The application callback function specified in the client session passed in the <i>hClient</i> parameter of the  <b>DRMCreateLicenseStorageSession</b> function will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-license">DRM_MSG_ACQUIRE_LICENSE</a> message to provide status feedback.
     * @param {Integer} uFlags Specifies options for the function call. This parameter can be zero or a combination of one or more of the following flags.
     * @param {Pointer<Char>} wszGroupIdentityCredential An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> (RAC). If this is not used, this function will check the license store for a RAC that matches the license used to create <i>hSession</i>. If none is found, this function will fail.
     * @param {Pointer<Char>} wszRequestedRights This parameter is reserved and must be <b>NULL</b>.
     * @param {Pointer<Char>} wszCustomData Optional application-specific data that might be required for a license. This must be a valid XML string. After returning control to the caller, this function creates a license request by using the application-specific data specified here.
     * @param {Pointer<Char>} wszURL A license acquisition URL. This parameter is required when a client licensor certificate is being acquired and optional when an end-user license is being acquired. The URL can be used for both silent and nonsilent license acquisition. When present, this URL overrides the URL specified in the license that was used to create the license storage session passed into <i>hSession</i>.
     * 
     * A license may hold multiple license acquisition URLs, but only the first is used by default. To use any of the other URLs specified, you must parse the license. For more information, see the Remarks section.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmacquirelicense
     */
    static DRMAcquireLicense(hSession, uFlags, wszGroupIdentityCredential, wszRequestedRights, wszCustomData, wszURL, pvContext) {
        wszGroupIdentityCredential := wszGroupIdentityCredential is String? StrPtr(wszGroupIdentityCredential) : wszGroupIdentityCredential
        wszRequestedRights := wszRequestedRights is String? StrPtr(wszRequestedRights) : wszRequestedRights
        wszCustomData := wszCustomData is String? StrPtr(wszCustomData) : wszCustomData
        wszURL := wszURL is String? StrPtr(wszURL) : wszURL

        result := DllCall("msdrm.dll\DRMAcquireLicense", "uint", hSession, "uint", uFlags, "ptr", wszGroupIdentityCredential, "ptr", wszRequestedRights, "ptr", wszCustomData, "ptr", wszURL, "ptr", pvContext, "int")
        return result
    }

    /**
     * Deletes a license, client licensor certificate, revocation list, or issuance license template.
     * @remarks
     * The AD RMS system does not check to determine whether out of date licenses or revocation lists are stored in the license store, even when acquiring a new license or revocation list for content already owned. Therefore, it is important to occasionally delete  licenses or certificates. This can be a time-consuming process, so it might be best to perform this action occasionally or during program idle time.
     * 
     * If you delete an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a>, this function will not automatically delete associated revocation lists.
     * 
     * If you delete a license by using the content  ID, the <i>hSession</i> parameter must be the handle of a client session.
     * 
     * License and certificate IDs can be enumerated by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>. If you already have the license or certificate you want to delete from the license store, you can query it for its ID (by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseattribute">DRMGetUnboundLicenseAttribute</a> functions with the <b>g_wszQUERY_IDVALUE</b> constant) and pass the value into this function.
     * @param {Integer} hSession A handle to a license storage session or client session. You can use a  storage session handle to delete end-user licenses and revocation lists. You can use a client session handle to delete end-user licenses, rights account certificates,  client licensor certificates, and issuance license templates.
     * 
     * You can retrieve a handle to a license storage session by using   the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. You can retrieve a handle to a client session by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {Pointer<Char>} wszLicenseId A pointer to a null-terminated string that contains the ID of the license or template to be deleted. The license ID can be found inside the <b>ID</b> element of the license XrML, by querying using the license querying functions and the <b>g_wszQUERY_CONTENTIDVALUE</b> constant. The template ID is a GUID. You can enumerate the GUIDs by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> function.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmdeletelicense
     */
    static DRMDeleteLicense(hSession, wszLicenseId) {
        wszLicenseId := wszLicenseId is String? StrPtr(wszLicenseId) : wszLicenseId

        result := DllCall("msdrm.dll\DRMDeleteLicense", "uint", hSession, "ptr", wszLicenseId, "int")
        return result
    }

    /**
     * Closes a client session or a license storage session.
     * @remarks
     * Client sessions are created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. License storage sessions are created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. Be sure to close a session properly by using this function, which clears out sensitive information from memory and properly closes session handles.
     * @param {Integer} hSession A handle to the session to be closed.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmclosesession
     */
    static DRMCloseSession(hSession) {
        result := DllCall("msdrm.dll\DRMCloseSession", "uint", hSession, "int")
        return result
    }

    /**
     * Duplicates a client or license storage session.
     * @remarks
     * Creating, copying, and closing handles with the appropriate function allows the rights management system to maintain a reference count on resources and free them appropriately, and also clears sensitive data from memory. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> to close the handle created by calling this function.
     * @param {Integer} hSessionIn A handle to a session to duplicate.
     * @param {Pointer<UInt32>} phSessionOut Pointer to the duplicated session handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmduplicatesession
     */
    static DRMDuplicateSession(hSessionIn, phSessionOut) {
        result := DllCall("msdrm.dll\DRMDuplicateSession", "uint", hSessionIn, "uint*", phSessionOut, "int")
        return result
    }

    /**
     * Retrieves the path to a lockbox.
     * @remarks
     * When you obtain the output values, first call this function with both <i>wszType</i> and <i>wszPath</i> set to <b>NULL</b> to obtain the needed buffer sizes through <i>puTypeLen</i> and <i>puPathLen</i>. If you set only one buffer pointer to <b>NULL</b>, an error is generated. It is the application's responsibility to allocate and free buffer space.
     * @param {Integer} uFlags Reserved.
     * @param {Pointer<UInt32>} puTypeLen On input, length of the allocated <i>wszType</i> buffer. On output, actual length, in characters, plus one for a null terminator, of the value returned by <i>wszType</i>.
     * @param {Pointer<Char>} wszType Type of security provider (such as "filename").
     * @param {Pointer<UInt32>} puPathLen On input, length of the allocated <i>wszPath</i> buffer. On output, actual length, in characters, plus one for a null terminator, of the value returned by <i>wszPath</i>.
     * @param {Pointer<Char>} wszPath Path to the lockbox.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetsecurityprovider
     */
    static DRMGetSecurityProvider(uFlags, puTypeLen, wszType, puPathLen, wszPath) {
        wszType := wszType is String? StrPtr(wszType) : wszType
        wszPath := wszPath is String? StrPtr(wszPath) : wszPath

        result := DllCall("msdrm.dll\DRMGetSecurityProvider", "uint", uFlags, "uint*", puTypeLen, "ptr", wszType, "uint*", puPathLen, "ptr", wszPath, "int")
        return result
    }

    /**
     * Encodes data using a public encoding method, such as base64.
     * @remarks
     * Note that encoding is not encrypting. Encoding does not protect content, but transforms it into a format appropriate for a specific use.
     * 
     * Buffer space for the encoded data must be allocated and freed by the caller. The size necessary for this buffer can be determined by calling this function with <b>NULL</b> in the <i>wszEncodedString</i> parameter.
     * @param {Pointer<Char>} wszAlgID The encoding algorithm. Currently the only valid value is "base64".
     * @param {Integer} uDataLen Length of the input data, in bytes.
     * @param {Pointer<Byte>} pbDecodedData Pointer to the data to encode.
     * @param {Pointer<UInt32>} puEncodedStringLen Length of the output data, in bytes.
     * @param {Pointer<Char>} wszEncodedString The encoded string.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmencode
     */
    static DRMEncode(wszAlgID, uDataLen, pbDecodedData, puEncodedStringLen, wszEncodedString) {
        wszAlgID := wszAlgID is String? StrPtr(wszAlgID) : wszAlgID
        wszEncodedString := wszEncodedString is String? StrPtr(wszEncodedString) : wszEncodedString

        result := DllCall("msdrm.dll\DRMEncode", "ptr", wszAlgID, "uint", uDataLen, "char*", pbDecodedData, "uint*", puEncodedStringLen, "ptr", wszEncodedString, "int")
        return result
    }

    /**
     * Decodes a string encoded with a common algorithm, such as base64.
     * @remarks
     * Encoding is not the same as encrypting.
     * 
     * Buffer space for the decoded data must be allocated and freed by the caller. The size necessary for this buffer can be determined by calling this function with <b>NULL</b> in the <i>pbDecodedData</i> parameter.
     * @param {Pointer<Char>} wszAlgID The encoding algorithm name. Currently "base64" is the only valid value.
     * @param {Pointer<Char>} wszEncodedString The encoded string.
     * @param {Pointer<UInt32>} puDecodedDataLen The length of the decoded string, in characters, plus one for a null terminator.
     * @param {Pointer<Byte>} pbDecodedData Pointer to the decoded data.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmdecode
     */
    static DRMDecode(wszAlgID, wszEncodedString, puDecodedDataLen, pbDecodedData) {
        wszAlgID := wszAlgID is String? StrPtr(wszAlgID) : wszAlgID
        wszEncodedString := wszEncodedString is String? StrPtr(wszEncodedString) : wszEncodedString

        result := DllCall("msdrm.dll\DRMDecode", "ptr", wszAlgID, "ptr", wszEncodedString, "uint*", puDecodedDataLen, "char*", pbDecodedData, "int")
        return result
    }

    /**
     * Builds a certificate chain from an arbitrary number of certificates.
     * @remarks
     * Memory allocation and deallocation for the chain are handled by the caller. To determine the required size for the <i>wszChain</i> buffer, call this function with <b>NULL</b> for the <i>wszChain</i> parameter. The required number of Unicode characters, including the terminating null character, will be returned in the <i>pcChain</i> parameter.
     * 
     * This function can be used to transform certificate chains that are returned by the AD RMS SOAP methods into certificate chains that can be used by AD RMS functions. For an example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/decryption-getboundlicense-cpp">Decryption_GetBoundLicense.cpp</a>.
     * @param {Integer} cCertificates The number of certificates in the <i>rgwszCertificates</i> array.
     * @param {Pointer<Char>} rgwszCertificates An array of null-terminated Unicode string pointers that contain the certificates to construct the chain from. The number of elements in this array is specified by the <i>cCertificates</i> parameter.
     * @param {Pointer<UInt32>} pcChain A pointer to a <b>UINT</b> that, on input, contains the size, in Unicode characters, of the  <i>wszChain</i> string. This character count must include the terminating null character.
     * 
     * On output, this <b>UINT</b> receives the number of Unicode characters copied into the buffer, including the terminating null character.
     * @param {Pointer<Char>} wszChain A pointer to a null-terminated Unicode string that receives the constructed chain.
     * 
     * To determine the required size for this buffer, call this function with <b>NULL</b> for the <i>wszChain</i> parameter. The required number of Unicode characters, including the terminating null character, will be returned in the <i>pcChain</i> parameter.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmconstructcertificatechain
     */
    static DRMConstructCertificateChain(cCertificates, rgwszCertificates, pcChain, wszChain) {
        wszChain := wszChain is String? StrPtr(wszChain) : wszChain

        result := DllCall("msdrm.dll\DRMConstructCertificateChain", "uint", cCertificates, "ptr", rgwszCertificates, "uint*", pcChain, "ptr", wszChain, "int")
        return result
    }

    /**
     * Creates a handle to an unbound license, to allow an application to navigate its objects and attributes.
     * @remarks
     * This function is for querying unbound end-user licenses, and also for obtaining license acquisition URLs from issuance licenses. The unbound end-user license retrieved by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> is a certificate chain. To properly query the unbound license itself, first call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmdeconstructcertificatechain">DRMDeconstructCertificateChain</a> to obtain the first element of the chain (item zero), which is the actual license.
     * 
     * An application can navigate this interface using various <b>DRMGetUnboundLicense_xxx</b> functions (for unbound licenses). To examine bound licenses, use the <b>DRMGetBoundLicense_xxx</b> functions.
     * 
     * Both bound and unbound licenses can be examined. Whether you decide to use a bound or an unbound license depends on whether you need to exercise the rights or just examine the license. Bound licenses can exist only after a secure environment has been created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>. Unbound licenses, however, do not require a secure environment.
     * 
     * The output of this function can be passed into one of the <b>DRMGetUnboundLicense_xxx</b> functions. The only object you can query for in an issuance license is g_wszQUERY_DISTRIBUTIONPOINT. The only attributes you can query for are g_wszQUERY_IDTYPE, g_wszQUERY_IDVALUE, g_wszQUERY_NAME, g_wszQUERY_ADDRESSTYPE, and g_wszQUERY_ADDRESSVALUE.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosequeryhandle">DRMCloseQueryHandle</a> to close the unbound license handle created by calling this function.
     * @param {Pointer<Char>} wszCertificate The leaf certificate on the license to be examined, in plain text (not encoded).
     * @param {Pointer<UInt32>} phQueryRoot Pointer to a handle to the root object of the license. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosequeryhandle">DRMCloseQueryHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmparseunboundlicense
     */
    static DRMParseUnboundLicense(wszCertificate, phQueryRoot) {
        wszCertificate := wszCertificate is String? StrPtr(wszCertificate) : wszCertificate

        result := DllCall("msdrm.dll\DRMParseUnboundLicense", "ptr", wszCertificate, "uint*", phQueryRoot, "int")
        return result
    }

    /**
     * Closes a handle to an unbound license object.
     * @remarks
     * The AD RMS system exposes an object-oriented interface to a license. Bound licenses are accessed using a <b>DRMHANDLE</b>, while unbound licenses are accessed by a <b>DRMQUERYHANDLE</b>. The two types are not interchangeable. This function closes unbound licenses. For more information about examining unbound licenses, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {Integer} hQuery A handle to an object in an unbound license.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmclosequeryhandle
     */
    static DRMCloseQueryHandle(hQuery) {
        result := DllCall("msdrm.dll\DRMCloseQueryHandle", "uint", hQuery, "int")
        return result
    }

    /**
     * Counts the instances of an object within a specified branch of the license.
     * @remarks
     * Certain objects, such as rights, may have multiple instances in a license. This function allows an application to iterate through instances of an object type by providing an upper bound in a loop when calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a>. The value returned by this function, however, is one-based; subtract one from it when using it as a loop boundary.
     * 
     * This query will search only at the level immediately below the passed in object. So, for example, if the root license handle is passed in and the attribute to find is g_wszQUERY_OWNER, the query will find nothing because the OWNER appears at the second level or deeper (counting the license root as level 0).
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {Pointer<Char>} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Pointer<UInt32>} pcSubObjects Count of object instances one level down within the specified branch.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetunboundlicenseobjectcount
     */
    static DRMGetUnboundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects) {
        wszSubObjectType := wszSubObjectType is String? StrPtr(wszSubObjectType) : wszSubObjectType

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseObjectCount", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint*", pcSubObjects, "int")
        return result
    }

    /**
     * Retrieves an object of a specified type in an unbound license.
     * @remarks
     * Each object can have several instances within a license. A license may contain many rights objects, for example. In this case, it may be necessary to iterate through all the objects in this class by first calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobjectcount">DRMGetUnboundLicenseObjectCount</a> to get a count of existing objects, and then looping through all instances, starting at zero and incrementing the <i>iWhich</i> value by one. If a specific object is sought, each retrieved object can be queried for its attributes, such as its name.
     * 
     * This query will search only at the level immediately below the passed in object. So, for example, if the root license handle is passed in and the attribute to find is g_wszQUERY_OWNER, the query will find nothing because the OWNER object appears at the second level or deeper (counting the license root as level 0).
     * 
     * The <i>wszSubObjectType</i> parameter identifies an XrML node value as shown in the following example. Using g_wszQUERY_OBJECTTYPE in a query would return "Group Identity Licensor." The only object you can query for in an issuance license is g_wszQUERY_DISTRIBUTIONPOINT.
     * 
     * 
     * ```cpp
     * <PRINCIPAL internal-id="1">
     *   <OBJECT type="Group Identity Licensor">
     *   <ID type="Group Identity">someone@example.com</ID>
     *   <NAME>Pavel's Group Identity</NAME>
     *   </OBJECT>
     * ```
     * 
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosequeryhandle">DRMCloseQueryHandle</a>  to close the object handle created by calling this function.
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created using <b>DRMGetUnboundLicenseObject</b> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {Pointer<Char>} wszSubObjectType Name of the object to find.
     * @param {Integer} iIndex Zero-based index indicating which instance to retrieve, if more than one exists.
     * @param {Pointer<UInt32>} phSubQuery The retrieved object. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the  handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetunboundlicenseobject
     */
    static DRMGetUnboundLicenseObject(hQueryRoot, wszSubObjectType, iIndex, phSubQuery) {
        wszSubObjectType := wszSubObjectType is String? StrPtr(wszSubObjectType) : wszSubObjectType

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseObject", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint", iIndex, "uint*", phSubQuery, "int")
        return result
    }

    /**
     * Retrieves the number of occurrences of an attribute within an object in an unbound license.
     * @remarks
     * Certain attributes, such as maximum count, may appear more than once in a branch of a license. This method returns a count of these occurrences, so that an application can iterate through them or access a particular one. This query will search only at the level immediately below the passed in object. So, for example, if the root license handle is passed in and the attribute to find is g_wszQUERY_SKUVALUE, the query will find nothing because the SKUVALUE appears at the second level or deeper (counting the license root as level 0).
     * @param {Integer} hQueryRoot A handle to a license or an object in the license, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {Pointer<Char>} wszAttributeType Name of the attribute to retrieve.
     * @param {Pointer<UInt32>} pcAttributes Count of attribute occurrences one level down within the specified branch.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetunboundlicenseattributecount
     */
    static DRMGetUnboundLicenseAttributeCount(hQueryRoot, wszAttributeType, pcAttributes) {
        wszAttributeType := wszAttributeType is String? StrPtr(wszAttributeType) : wszAttributeType

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseAttributeCount", "uint", hQueryRoot, "ptr", wszAttributeType, "uint*", pcAttributes, "int")
        return result
    }

    /**
     * Retrieves an unbound license attribute from the underlying XrML.
     * @remarks
     * Attributes hold information about an object, such as its name, issue time, or SKU value. All allocating and freeing of memory are the responsibility of the caller. To obtain the size of the returned value, first call this function with the attribute sought (such as "Issue Date"), and <b>NULL</b> in the <i>pbBuffer</i> value. The size required for the buffer will be passed out in <i>pcBuffer</i>.
     * 
     * An object may have several instances of an attribute with the same name. For example, a <b>RIGHT</b> object may have several name-value pairs. In this case, it may be necessary to iterate through all the instances of an attribute (g_wszQUERY_RIGHTSPARAMETERNAME or g_wszQUERY_RIGHTSPARAMETERVALUE in the preceding example) by first calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseattributecount">DRMGetUnboundLicenseAttributeCount</a> to get a count of existing objects, and then looping through all <i>iWhich</i> instances of the attribute, starting at zero and incrementing by one.
     * 
     * This query will search only at the level immediately below the passed in object. So, for example, if the root license handle is passed in and the attribute to find is g_wszQUERY_SKUVALUE, the query will find nothing because the SKUVALUE appears at the second level or deeper (counting the license root as level 0).
     * 
     * The only attributes you can query for in an issuance license are g_wszQUERY_IDTYPE, g_wszQUERY_IDVALUE, g_wszQUERY_NAME, g_wszQUERY_ADDRESSTYPE, and g_wszQUERY_ADDRESSVALUE.
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {Pointer<Char>} wszAttributeType Name of the attribute to retrieve.
     * @param {Integer} iWhich Zero-based index of the attribute to retrieve.
     * @param {Pointer<Int32>} peEncoding An enumeration value specifying the encoding type of the return value.
     * @param {Pointer<UInt32>} pcBuffer Size of the returned data, in characters, plus one for a null terminator.
     * @param {Pointer<Byte>} pbBuffer Attribute value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetunboundlicenseattribute
     */
    static DRMGetUnboundLicenseAttribute(hQueryRoot, wszAttributeType, iWhich, peEncoding, pcBuffer, pbBuffer) {
        wszAttributeType := wszAttributeType is String? StrPtr(wszAttributeType) : wszAttributeType

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseAttribute", "uint", hQueryRoot, "ptr", wszAttributeType, "uint", iWhich, "int*", peEncoding, "uint*", pcBuffer, "char*", pbBuffer, "int")
        return result
    }

    /**
     * Retrieves the number of certificates in a certificate chain.
     * @remarks
     * This function is used with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmdeconstructcertificatechain">DRMDeconstructCertificateChain</a> to allow an application to loop through a certificate chain and retrieve individual certificates.
     * @param {Pointer<Char>} wszChain The chain to count.
     * @param {Pointer<UInt32>} pcCertCount The number of certificates in the chain.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetcertificatechaincount
     */
    static DRMGetCertificateChainCount(wszChain, pcCertCount) {
        wszChain := wszChain is String? StrPtr(wszChain) : wszChain

        result := DllCall("msdrm.dll\DRMGetCertificateChainCount", "ptr", wszChain, "uint*", pcCertCount, "int")
        return result
    }

    /**
     * Retrieves a specified certificate from a certificate chain.
     * @remarks
     * This function allows an application to retrieve individual certificates from a chain. To determine the number of certificates available, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetcertificatechaincount">DRMGetCertificateChainCount</a>.
     * 
     * Memory allocation and deallocation for <i>wszCert</i> are handled by the caller. The <i>szChain</i> buffer length can be obtained from the <i>pcCert</i> parameter by calling this function with <b>NULL</b> in the <i>wszCert</i> parameter.
     * @param {Pointer<Char>} wszChain The certificate chain.
     * @param {Integer} iWhich A zero-based index specifying which certificate to retrieve.
     * @param {Pointer<UInt32>} pcCert The length of the retrieved certificate, in characters, plus one for a null terminator.
     * @param {Pointer<Char>} wszCert The certificate requested.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmdeconstructcertificatechain
     */
    static DRMDeconstructCertificateChain(wszChain, iWhich, pcCert, wszCert) {
        wszChain := wszChain is String? StrPtr(wszChain) : wszChain
        wszCert := wszCert is String? StrPtr(wszCert) : wszCert

        result := DllCall("msdrm.dll\DRMDeconstructCertificateChain", "ptr", wszChain, "uint", iWhich, "uint*", pcCert, "ptr", wszCert, "int")
        return result
    }

    /**
     * No longer supported and returns E_NOTIMPL.
     * @param {Pointer<Char>} wszData The data to verify (original data).
     * @param {Pointer<UInt32>} pcAttestedData Length, in characters, of the data to verify, plus one for a terminating null character.
     * @param {Pointer<Char>} wszAttestedData The signed data.
     * @param {Pointer<Int32>} peType Whether full environment information,  or just a hash of the environment, is included.
     * @param {Pointer<UInt32>} pcPrincipal Size, in characters, of the <i>wszPrincipalCredentials</i> parameter, plus one for a terminating null character.
     * @param {Pointer<Char>} wszPrincipal Certificate chain of the principal attesting the data. This chain is needed to create the principal used to verify the data.
     * @param {Pointer<UInt32>} pcManifest Size, in characters, of the manifest used to sign the data, plus one for a terminating null character. For information about making a manifest, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-application-manifest">Creating an Application Manifest</a>.
     * @param {Pointer<Char>} wszManifest The manifest used to sign, as a null-terminated string.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmverify
     */
    static DRMVerify(wszData, pcAttestedData, wszAttestedData, peType, pcPrincipal, wszPrincipal, pcManifest, wszManifest) {
        wszData := wszData is String? StrPtr(wszData) : wszData
        wszAttestedData := wszAttestedData is String? StrPtr(wszAttestedData) : wszAttestedData
        wszPrincipal := wszPrincipal is String? StrPtr(wszPrincipal) : wszPrincipal
        wszManifest := wszManifest is String? StrPtr(wszManifest) : wszManifest

        result := DllCall("msdrm.dll\DRMVerify", "ptr", wszData, "uint*", pcAttestedData, "ptr", wszAttestedData, "int*", peType, "uint*", pcPrincipal, "ptr", wszPrincipal, "uint*", pcManifest, "ptr", wszManifest, "int")
        return result
    }

    /**
     * Creates a user that will be granted a right.
     * @remarks
     * At license request time, a user must present a rights account certificate identifying themselves by SID or PUID 
     *      if the user ID is WINDOWS or PASSPORT. If the user ID type is UNSPECIFIED (that is, if you do not know if it will 
     *      be Windows, Passport, or some other type), you can simply enter an email address of a client, and the AD RMS 
     *      system will use the email address alone to verify identity. However, this method is much less secure.
     * 
     * Windows authorization is used when a client is within an enterprise with its own license server (typically this 
     *      occurs over a LAN or Virtual Private Network). When a client will be requesting a use license from a server 
     *      outside an enterprise (typically over the Internet), you should use Passport authorization. To use Passport 
     *      authorization on your AD RMS service, go to the AD RMS Global Administration webpage, view the 
     *      <b>Trust Policies</b> page, and then click <b>Trust Passport RACs</b>. 
     *      You may mix Windows and Passport users in a single issuance license.
     * 
     * If you want to create an issuance license for a group of people under an email distribution list (such as 
     *      marketing@contoso.com), insert the fully qualified distribution list name into 
     *      <i>wszUserName</i>, and leave <i>wszUserId</i> empty. The server will 
     *      expand the distribution list when obtaining the use license. Note that this can cause a performance lag if the 
     *      distribution list contains several nested distribution lists within it.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle of the 
     *      user object  created by calling this function.
     * @param {Pointer<Char>} wszUserName A null-terminated string that identifies a user or group of users (see Remarks). This parameter is often an 
     *        email address.  When the user created is passed in as <i>hOwner</i> to 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a>, this value is 
     *        attached to the Owner node in the license XrML. For more information about possible values for this parameter, 
     *        see the <i>wszUserIdType</i> parameter.
     * @param {Pointer<Char>} wszUserId A null-terminated string that identifies a user that will be granted a right. This parameter can be a 
     *        Passport ID (PUID), Windows ID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/s-gly">security ID</a> (SID), or 
     *        <b>NULL</b>. If this parameter is <b>NULL</b>, 
     *        <i>wszUserIdType</i> must contain "Unspecified". This ID is verified by the 
     *        Active Directory Rights Management Services system. For more information about possible values for this 
     *        parameter, see the <i>wszUserIdType</i> parameter.
     * @param {Pointer<Char>} wszUserIdType 
     * @param {Pointer<UInt32>} phUser A pointer to the handle of the created user. Call 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For 
     *        a list of common error codes, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateuser
     */
    static DRMCreateUser(wszUserName, wszUserId, wszUserIdType, phUser) {
        wszUserName := wszUserName is String? StrPtr(wszUserName) : wszUserName
        wszUserId := wszUserId is String? StrPtr(wszUserId) : wszUserId
        wszUserIdType := wszUserIdType is String? StrPtr(wszUserIdType) : wszUserIdType

        result := DllCall("msdrm.dll\DRMCreateUser", "ptr", wszUserName, "ptr", wszUserId, "ptr", wszUserIdType, "uint*", phUser, "int")
        return result
    }

    /**
     * Creates an XrML right that will define a right granted to a user or group.
     * @remarks
     * Determining which rights a user can be granted is the responsibility of the application. The only right that Active Directory Rights Management Services enforces is EDIT, which grants the user the right to modify content.
     * 
     * A right can have any name that can be validly expressed in XML.
     * 
     * The <i>pstFrom</i> and <i>pstUntil</i> parameters specify the start and end validity times of the right. These parameters must either both be specified, or both be <b>NULL</b>. An application cannot set only one validity time.
     * 
     * One problem that can arise when creating licenses with short validity times is the problem of clock skew. <i>Clock skew</i> is when the publishing computer's clock and the end user's computer clock are not exactly aligned. Clock skew can cause attempts to exercise rights to fail. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/clock-skew">Clock Skew</a>.
     * 
     * The <i>pwszExtendedInfoName</i> and <i>pwszExtendedInfoValue</i> parameters are pointers to two parallel arrays that associate name-value pairs that hold additional right-specific information. These name-value pairs can specify any additional information you want, and they are retrieved by index number by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetrightextendedinfo">DRMGetRightExtendedInfo</a>. Extended information items are optional, but if a name or value is given, the corresponding item in the other array cannot be <b>NULL</b>.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle of the right created by calling this function.
     * @param {Pointer<Char>} wszRightName A pointer to a null-terminated Unicode string that contains the name of a user-defined or standard XrML (version 1.2) right. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/official-template-xrml">Official Template XrML</a>.
     * @param {Pointer<SYSTEMTIME>} pstFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time, in UTC time, when this right will become valid. For more information, see Remarks. Both <i>pstFrom</i> and <i>pstUntil</i> must be specified, or both must be <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time, in UTC time, when this right will expire. For more information, see Remarks. Both <i>pstFrom</i> and <i>pstUntil</i> must be specified, or both must be <b>NULL</b>.
     * @param {Integer} cExtendedInfo The number of elements in the <i>pwszExtendedInfoName</i> and <i>pwszExtendedInfoValue</i> arrays. If this parameter is zero, then both the <i>pwszExtendedInfoName</i> and <i>pwszExtendedInfoValue</i> parameters must be <b>NULL</b>.
     * @param {Pointer<Char>} pwszExtendedInfoName An array of null-terminated Unicode string pointers that contains the names of extended information data. Each name in this array must be unique. The <b>cExtendedInfo</b> parameter contains the number of elements in this array.
     * @param {Pointer<Char>} pwszExtendedInfoValue An array of null-terminated Unicode string pointers that contains the values of the extended information items.  The <b>cExtendedInfo</b> parameter contains the number of elements in this array.
     * @param {Pointer<UInt32>} phRight A pointer to a handle that receives the handle of the created right. This handle can be used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmaddrightwithuser">DRMAddRightWithUser</a> function to bind the right to a user. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateright
     */
    static DRMCreateRight(wszRightName, pstFrom, pstUntil, cExtendedInfo, pwszExtendedInfoName, pwszExtendedInfoValue, phRight) {
        wszRightName := wszRightName is String? StrPtr(wszRightName) : wszRightName

        result := DllCall("msdrm.dll\DRMCreateRight", "ptr", wszRightName, "ptr", pstFrom, "ptr", pstUntil, "uint", cExtendedInfo, "ptr", pwszExtendedInfoName, "ptr", pwszExtendedInfoValue, "uint*", phRight, "int")
        return result
    }

    /**
     * Creates an issuance license from scratch, from a template, or from a signed issuance license.
     * @remarks
     * An issuance license is a list of rights, users, metadata, and other information that specifies how a specific user on a specific computer is able to use the specified content. This issuance license must be signed by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a> function or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-acquireissuancelicense">AcquireIssuanceLicense</a> SOAP method. The resulting signed issuance license is given to a potential end user who must then request an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a> by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> function. An application may request an end-user license on behalf of another end user by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-acquireprelicense">AcquirePreLicense</a> SOAP method. It is only the end-user license that allows an application to exercise the rights that have been granted.
     * 
     * This function allows you to create licenses in three different ways.
     * 
     * <table>
     * <tr>
     * <th><i>wszIssuanceLicense</i> value</th>
     * <th><i>hBoundLicense</i> value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>An unsigned issuance license from a file or an issuance license handle passed into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetissuancelicensetemplate">DRMGetIssuanceLicenseTemplate</a>
     * </td>
     * <td><b>NULL</b></td>
     * <td>Use to create an issuance license from a template. The new issuance license contains information from the old issuance license (the list follows this table), but it does not reuse the content key. </td>
     * </tr>
     * <tr>
     * <td>A signed issuance license</td>
     * <td>A handle to the license bound by the OWNER or VIEWRIGHTSDATA right</td>
     * <td>Use to reuse rights information (the list follows this table).</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td><b>NULL</b></td>
     * <td>Use to create an issuance license from scratch. It includes no users, rights, metadata, or policies.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * When an issuance license (signed or unsigned) is passed in, the following data is reused:
     * 
     * <ul>
     * <li>Users (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateuser">DRMCreateUser</a>)</li>
     * <li>Rights (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateright">DRMCreateRight</a>)</li>
     * <li>Application-specific data (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetapplicationspecificdata">DRMSetApplicationSpecificData</a>)</li>
     * <li>Metadata (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a>)</li>
     * <li>Name and description (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetnameanddescription">DRMSetNameAndDescription</a>)</li>
     * <li>Revocation point (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetrevocationpoint">DRMSetRevocationPoint</a>)</li>
     * <li>Usage policy (from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetusagepolicy">DRMSetUsagePolicy</a>)</li>
     * </ul>
     * 
     * 
     * Because nonsilent license acquisition is not supported, <i>wszReferralInfoName</i> and <i>wszReferralInfoURL</i> should be <b>NULL</b>.
     * 
     * For RMS client 1.0, the referral point described by <i>wszReferralInfoName</i> and <i>wszReferralInfoURL</i> is used as a backup URL if a call to the URL specified in the license header fails. This method allows a caller to define a display name and a URL to a site that handles nonsilent license requests for the content.
     * 
     * The <i>hBoundLicense</i> parameter allows an application to be able to reuse data from an existing issuance license. This is done by having the publishing application create a VIEWRIGHTSDATA right and grant it to any application allowed to reuse the issuance license information. However, because this involves binding to a license, which is a task that cannot be done without using a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/l-gly">lockbox</a>, this value should be <b>NULL</b> for server applications that do not use a lockbox.
     * 
     * The purpose of a URL cannot be verified by any part of a client or Active Directory Rights Management Services system. It would be possible for a malicious publisher to include a harmful URL address in an issuance license, although the issuance license creator would need a valid licensed Active Directory Rights Management Services system to do so.
     * 
     * One problem that can arise when creating issuance licenses with short validity times is the problem of clock skew. Clock skew is when the publishing computer's clock and the end user's computer clock are not exactly aligned. Clock skew can cause issuance license signing attempts to fail. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/clock-skew">Clock Skew</a>.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the issuance license handle created by calling this function.
     * @param {Pointer<SYSTEMTIME>} pstTimeFrom The starting UTC validity time for the license. If this value is <b>NULL</b>, the <i>pstTimeUntil</i> parameter must also be <b>NULL</b>. If both parameters are not <b>NULL</b>, <b>E_DRM_INVALID_TIMEINFO</b> is returned if the range time is logically inconsistent. For example, <i>pstTimeFrom</i> cannot be later than <i>pstTimeUntil</i>.
     * @param {Pointer<SYSTEMTIME>} pstTimeUntil The ending UTC validity time for the license. If this value is <b>NULL</b>, the <i>pstTimeFrom</i> parameter must also be <b>NULL</b>. If both parameters are not <b>NULL</b>, <b>E_DRM_INVALID_TIMEINFO</b> is returned if the range time is logically inconsistent. For example, <i>pstTimeFrom</i> cannot be later than <i>pstTimeUntil</i>.
     * @param {Pointer<Char>} wszReferralInfoName Nonsilent license acquisition is not supported; set this parameter to <b>NULL</b>.
     * 
     * For Rights Management Services (RMS) client 1.0, this parameter is a pointer to a null-terminated Unicode string that contains the display name for the URL in <i>wszReferralInfoURL</i>. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Char>} wszReferralInfoURL Nonsilent license acquisition is not supported; set this parameter to <b>NULL</b>.
     * 
     * For RMS client 1.0, this parameter is a pointer to a null-terminated Unicode string that contains the URL where an application should go to request a license for the content nonsilently. This should be an HTML page that hosts the ActiveX control. This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} hOwner A handle to the user that owns the issuance license. The handle is created by calling  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateuser">DRMCreateUser</a> function. The owner is identified under the <b>Owner</b> node in the issuance license XrML. This parameter is optional and can be <b>NULL</b>.
     * 
     * Do not confuse the owner of an issuance license with a user who has been granted the OWNER right. Ownership of an issuance license does not automatically grant any rights to use or modify content.  Specifying a value for the optional <i>hOwner</i> parameter merely enables an application to identify the content owner or author. The ID is added as metadata to the license. The OWNER right, on the other hand, grants a user the authority to exercise all rights contained in the license. Granting yourself (or anyone else) the OWNER right must be done explicitly by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmaddrightwithuser">DRMAddRightWithUser</a>. Zero, one, or more users can be granted the OWNER right, which never expires.
     * 
     * If specified, the issuance license owner is added as metadata beneath the &lt;WORK&gt; node of the license.
     * 
     * 
     * ```
     * <WORK>
     *   <OBJECT type="contentType">
     *     <ID type="contentIdType">contentId</ID>
     *     <NAME>contentName</NAME>
     *   </OBJECT>
     *   <METADATA>
     *     <OWNER>
     *       <OBJECT>
     *         <ID type="Windows"/>
     *         <NAME>david@contoso.com</NAME>
     *       </OBJECT>
     *     </OWNER>
     *   </METADATA>
     *   ...
     * 
     * ```
     * 
     * 
     * If granted, the OWNER right is added as an attribute of the &lt;RIGHT&gt; element in the license XrML.
     * 
     * 
     * ```
     * <WORK>
     *   ...
     *   <RIGHTSGROUP name="MainRights">
     *     <RIGHTSLIST>
     *       <VIEW>
     *         ...
     *       </VIEW>
     *       <RIGHT name="OWNER">
     *         <CONDITIONLIST>
     *           ...
     *         </CONDITIONLIST>
     *       </RIGHT>
     *     </RIGHTSLIST>
     *   </RIGHTSGROUP>
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  In the case where you set <i>hOwner</i> to the license author and use a template where you check the <b>Grant Owner (author) full control right with no expiration</b> check box, the license author can subsequently get an end-user license with Owner rights. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/understanding-xrml-rights">Understanding XrML Rights</a> for more information.</div>
     * <div> </div>
     * @param {Pointer<Char>} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains an issuance license template or a signed issuance license. You can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetissuancelicensetemplate">DRMGetIssuanceLicenseTemplate</a> function to retrieve  a template. If this parameter is <b>NULL</b>,  an issuance license is created.
     * @param {Integer} hBoundLicense A handle to a bound license that contains the VIEWRIGHTSDATA, EDITRIGHTSDATA or OWNER right, which allows an application to reuse rights data or reuse the content key from a previous issuance license. This parameter is optional and can be <b>NULL</b>. For further information about rights, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/understanding-xrml-rights">Understanding XrML Rights</a>.
     * 
     * <div class="alert"><b>Note</b>  If your intent is to create a new issuance license, but you want to use the content key from the original signed issuance license, ensure that the <i>hBoundLicense</i> you pass in to <b>DRMCreateIssuanceLicense</b> is bound to either the OWNER or EDITRIGHTSDATA right. In a subsequent call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a>,  pass in the issuance license handle obtained from <b>DRMCreateIssuanceLicense</b> and  the DRM_REUSE_KEY flag in order to reuse the content key.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} phIssuanceLicense A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drmpubhandle">DRMPUBHANDLE</a> that receives the handle to the new issuance license.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmcreateissuancelicense
     */
    static DRMCreateIssuanceLicense(pstTimeFrom, pstTimeUntil, wszReferralInfoName, wszReferralInfoURL, hOwner, wszIssuanceLicense, hBoundLicense, phIssuanceLicense) {
        wszReferralInfoName := wszReferralInfoName is String? StrPtr(wszReferralInfoName) : wszReferralInfoName
        wszReferralInfoURL := wszReferralInfoURL is String? StrPtr(wszReferralInfoURL) : wszReferralInfoURL
        wszIssuanceLicense := wszIssuanceLicense is String? StrPtr(wszIssuanceLicense) : wszIssuanceLicense

        result := DllCall("msdrm.dll\DRMCreateIssuanceLicense", "ptr", pstTimeFrom, "ptr", pstTimeUntil, "ptr", wszReferralInfoName, "ptr", wszReferralInfoURL, "uint", hOwner, "ptr", wszIssuanceLicense, "uint", hBoundLicense, "uint*", phIssuanceLicense, "int")
        return result
    }

    /**
     * Assigns a right to a user in an issuance license.
     * @remarks
     * Because there is no way to remove a particular user right   (to remove all user rights, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclearallrights">DRMClearAllRights</a> function), we recommend that you collect all user and right information first, and then bind users to rights after all changes have been made.
     * 
     * All rights added must be specifically recognized and handled by the application. An application is not required to handle any standard XrML rights except EDIT. If a user is allowed to edit the content in any way (for example, a user is granted a custom "ADDCOMMENT" right), the user must also be granted the standard XrML EDIT right.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to add the right to. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} hRight The handle of the right to add to the issuance license. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateright">DRMCreateRight</a> function.
     * @param {Integer} hUser The handle of the user to apply the right to. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateuser">DRMCreateUser</a> function.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmaddrightwithuser
     */
    static DRMAddRightWithUser(hIssuanceLicense, hRight, hUser) {
        result := DllCall("msdrm.dll\DRMAddRightWithUser", "uint", hIssuanceLicense, "uint", hRight, "uint", hUser, "int")
        return result
    }

    /**
     * Removes all rights from an existing issuance license.
     * @remarks
     * There is no way to remove individual rights from an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to remove the rights from.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmclearallrights
     */
    static DRMClearAllRights(hIssuanceLicense) {
        result := DllCall("msdrm.dll\DRMClearAllRights", "uint", hIssuanceLicense, "int")
        return result
    }

    /**
     * Adds application-specific metadata to an issuance license.
     * @remarks
     * The <b>DRMSetMetaData</b> function is typically called after <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> to set the content ID, name, and type in an issuance license for a specific item of content. The function is also called before <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a>.
     * 
     * Content IDs are created and set in issuance licenses by a publishing application. For example, the application can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> to create a new issuance license. It can then call <b>CoCreateGUID</b> to  create a unique ID and <b>DRMSetMetaData</b> to associate the ID with the license. The AD RMS client places the ID in the &lt;WORK&gt; node of the issuance license as shown by the following diagram. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-issuance-license">Creating an Issuance License</a>.
     * 
     * 
     * ``` syntax
     * &lt;WORK&gt;
     *    &lt;OBJECT type="Microsoft Office Document"&gt;
     *       &lt;ID type="MSGUID"&gt;{AEADA9BD84F246BD92385A611D624A02}&lt;/ID&gt;
     *       &lt;NAME&gt;Microsoft Office Document&lt;/NAME&gt;
     *    &lt;/OBJECT&gt;
     *     .
     *     .
     *     .
     * &lt;/WORK&gt;
     * ```
     * 
     * After an issuance license has been created, a consuming application can use it to acquire an end–user license. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a>. The appropriate &lt;WORK&gt; nodes and their respective content IDs are copied from the issuance license to the end–user license.
     * 
     * Once an end–user license has been acquired, consuming applications internally use the content ID to bind to that license. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>. Binding verifies the license chain, principals, and environment, and removes all rights that do not apply to the specified user. The bound license can then be used to decrypt protected content.
     * 
     * Finally, the content ID can be used to enumerate end–user licenses. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a>. The content ID is used to locate an end–user license in the license store.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to which the metadata will be added.
     * @param {Pointer<Char>} wszContentId A pointer to a null-terminated Unicode string that uniquely identifies an item of content. The string can contain up to 40 characters plus a terminating null character. We recommend that you use <b>CoCreateGUID</b> to create a GUID. For more information about content IDs, see Remarks.
     * @param {Pointer<Char>} wszContentIdType A pointer to a null-terminated Unicode string that specifies the type of identifier represented by the <i>wszContentId</i> parameter. Possible examples include "MSGUID", "ISBN", "CatalogNumber", and any other that you consider appropriate.
     * @param {Pointer<Char>} wszSKUId A pointer to a null-terminated Unicode string that contains an optional identifier. The string can contain up to 40 characters plus a terminating null character. The SKU ID is optional and allows for further content identification beyond that provided by the required content ID. If <i>wszSKUIdType</i> is specified, the <i>wszSKUId</i> parameter must be specified. Otherwise, it can be <b>NULL</b>.
     * @param {Pointer<Char>} wszSKUIdType A pointer to a null-terminated Unicode string that contains the type of identifier represented by the <i>wszSKUId</i> parameter. If <i>wszSKUId</i> is specified, the <i>wszSKUIdType</i> parameter must be specified. Otherwise, it can be <b>NULL</b>.
     * @param {Pointer<Char>} wszContentType A pointer to a null-terminated Unicode string that contains application-defined information about the content. Examples include "Financial Statement", "Source Code", "Office Document", and any other that you consider appropriate. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<Char>} wszContentName A pointer to a null-terminated Unicode string that contains a display name for the content. This parameter is optional and can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetmetadata
     */
    static DRMSetMetaData(hIssuanceLicense, wszContentId, wszContentIdType, wszSKUId, wszSKUIdType, wszContentType, wszContentName) {
        wszContentId := wszContentId is String? StrPtr(wszContentId) : wszContentId
        wszContentIdType := wszContentIdType is String? StrPtr(wszContentIdType) : wszContentIdType
        wszSKUId := wszSKUId is String? StrPtr(wszSKUId) : wszSKUId
        wszSKUIdType := wszSKUIdType is String? StrPtr(wszSKUIdType) : wszSKUIdType
        wszContentType := wszContentType is String? StrPtr(wszContentType) : wszContentType
        wszContentName := wszContentName is String? StrPtr(wszContentName) : wszContentName

        result := DllCall("msdrm.dll\DRMSetMetaData", "uint", hIssuanceLicense, "ptr", wszContentId, "ptr", wszContentIdType, "ptr", wszSKUId, "ptr", wszSKUIdType, "ptr", wszContentType, "ptr", wszContentName, "int")
        return result
    }

    /**
     * Sets a usage policy that requires or denies access to content based on application name, version, or other environment characteristics.
     * @remarks
     * Usage policies allow or prevent a use license from being exercised by a specific application name or version, application public key, or application digest. For example, a policy may specify that the file can only be opened by version 6.0 or higher of an application, or that it may not be opened by a particular application. A usage policy can only be of one type (name, digest, or public key), which is specified by the <i>eUsagePolicyType</i> parameter; data entered that does not apply to the specified usage policy type is ignored. However, an application can set an unlimited number of policies, so you can implement separate name, digest, and public key policies.
     * 
     * When using this function, only the parameters required by the specific policy type need to have values; the other parameters should be <b>NULL</b>. The following list shows which parameters require values for which usage types. Note that all policy types require the <i>hIssuanceLicense</i>, <i>eUsagePolicyType</i>, <i>fDelete</i>, and <i>fExclusion</i> parameter values in addition to the following values.  
     *  <table>
     * <tr>
     * <th>eUsagePolicyType value</th>
     * <th>Required parameters</th>
     * </tr>
     * <tr>
     * <td><b>DRM_USAGEPOLICY_TYPE_BYNAME</b></td>
     * <td><i>wszName</i><i>wszMinVersion</i>
     * 
     * <i>wszMaxVersion</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>DRM_USAGEPOLICY_TYPE_BYPUBLICKEY</b></td>
     * <td><i>wszPublicKey</i></td>
     * </tr>
     * <tr>
     * <td><b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b></td>
     * <td><i>wszDigestAlgorithm</i><i>pbDigest</i>
     * 
     * <i>cbDigest</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b></td>
     * <td><i>wszMinVersion</i> (Required.)<i>wszMaxVersion</i> (Optional. If used, must be greater than <i>wszMinVersion</i>.) These values are entered in the format <i>x.x.x.x</i>, where <i>x</i> represents an integer, typically from 1 to 4 digits long. So, for example, the version number for Windows XP with Service Pack 1 (SP1) would be "2.5.1.2600"; for Windows Server 2003, it would be "2.5.2.3790".
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The version comparison is a case-sensitive, character-by-character string comparison, so when comparing versions, "6" and "6.0" are considered different. Because of this, an application must use a consistent format when setting and comparing values.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {Integer} eUsagePolicyType One of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type">DRM_USAGEPOLICY_TYPE</a> values that specifies the type of usage policy to be added or deleted. Only one type may be selected.
     * @param {Integer} fDelete Determines whether the policy should be added or removed. <b>TRUE</b> indicates the policy should be deleted. <b>FALSE</b> indicates the policy should be added.
     * @param {Integer} fExclusion Determines whether the application is prohibited from, or required to, exercise the rights. <b>FALSE</b> indicates that the application is required to exercise the rights. <b>TRUE</b> indicates that the application is prohibited from exercising the rights. You must specify <b>TRUE</b> if you set the <i>eUsagePolicyType</i> parameter to <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> or <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>.
     * @param {Pointer<Char>} wszName A pointer to a null-terminated Unicode string that contains the name of the application. This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Pointer<Char>} wszMinVersion A pointer to a null-terminated Unicode string that contains the minimum version of the application that is required to or prohibited from exercising rights. This should be a version string in a form similar to "1.0.1" or "1.00.0000". This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> or <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Pointer<Char>} wszMaxVersion A pointer to a null-terminated Unicode string that contains the maximum version of the application that is required to or prohibited from exercising rights. This should be a version string in a form similar to "1.0.1" or "1.00.0000". This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> and optional when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b>. It is ignored for all other <i>eUsagePolicyType</i> values. If <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b> and this parameter is specified, the version  must be greater than <i>wszMinVersion</i>.
     * @param {Pointer<Char>} wszPublicKey A pointer to a null-terminated Unicode string that contains the public key used to sign the digest of the application required to or prohibited from exercising rights. This string must be a well-formed XrML node. This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYPUBLICKEY</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Pointer<Char>} wszDigestAlgorithm A pointer to a null-terminated Unicode string that contains the algorithm used to create the application digest that is specified by <i>pbDigest</i>.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Pointer<Byte>} pbDigest A pointer to an array of bytes that contains the application digest required or prohibited from exercising rights. The size of this array is contained in the <i>cbDigest</i> parameter.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Integer} cbDigest The number of bytes in the <i>pbDigest</i> array.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetusagepolicy
     */
    static DRMSetUsagePolicy(hIssuanceLicense, eUsagePolicyType, fDelete, fExclusion, wszName, wszMinVersion, wszMaxVersion, wszPublicKey, wszDigestAlgorithm, pbDigest, cbDigest) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszMinVersion := wszMinVersion is String? StrPtr(wszMinVersion) : wszMinVersion
        wszMaxVersion := wszMaxVersion is String? StrPtr(wszMaxVersion) : wszMaxVersion
        wszPublicKey := wszPublicKey is String? StrPtr(wszPublicKey) : wszPublicKey
        wszDigestAlgorithm := wszDigestAlgorithm is String? StrPtr(wszDigestAlgorithm) : wszDigestAlgorithm

        result := DllCall("msdrm.dll\DRMSetUsagePolicy", "uint", hIssuanceLicense, "int", eUsagePolicyType, "int", fDelete, "int", fExclusion, "ptr", wszName, "ptr", wszMinVersion, "ptr", wszMaxVersion, "ptr", wszPublicKey, "ptr", wszDigestAlgorithm, "char*", pbDigest, "uint", cbDigest, "int")
        return result
    }

    /**
     * Sets a refresh rate and location to obtain a revocation list.
     * @remarks
     * A revocation list can revoke end-user licenses, server licensor certificates, or almost anything else with an identifying GUID. For a list of the items that can be revoked, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/revocation">Revocation</a>. The URL provided should refer to the list file itself. The rights management system handles checking for a valid revocation list. This function should only be called once, since subsequent calls will overwrite the previous revocation point in the issuance license.
     * 
     * The public key must be a base-64 encoded string.
     * 
     * Note that if there is no revocation point set in the license, the license can still be revoked by a revocation list signed by the issuer of the license.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {Integer} fDelete Flag indicating whether the existing item should be deleted:    <b>TRUE</b> indicates it should be deleted; <b>FALSE</b> indicates it should be added.
     * @param {Pointer<Char>} wszId ID of the revocation authority posting the revocation list. This must match the ID given in the <b>ISSUER</b> node of the revocation list.
     * @param {Pointer<Char>} wszIdType Type of ID used by <i>wszId</i>.
     * @param {Pointer<Char>} wszURL URL of revocation file list.
     * @param {Pointer<SYSTEMTIME>} pstFrequency How often the list must be updated.
     * @param {Pointer<Char>} wszName Optional human-readable name for a revocation list site.
     * @param {Pointer<Char>} wszPublicKey Public key of key pair used to sign and verify the revocation list.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetrevocationpoint
     */
    static DRMSetRevocationPoint(hIssuanceLicense, fDelete, wszId, wszIdType, wszURL, pstFrequency, wszName, wszPublicKey) {
        wszId := wszId is String? StrPtr(wszId) : wszId
        wszIdType := wszIdType is String? StrPtr(wszIdType) : wszIdType
        wszURL := wszURL is String? StrPtr(wszURL) : wszURL
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszPublicKey := wszPublicKey is String? StrPtr(wszPublicKey) : wszPublicKey

        result := DllCall("msdrm.dll\DRMSetRevocationPoint", "uint", hIssuanceLicense, "int", fDelete, "ptr", wszId, "ptr", wszIdType, "ptr", wszURL, "ptr", pstFrequency, "ptr", wszName, "ptr", wszPublicKey, "int")
        return result
    }

    /**
     * Allows an issuance license to store arbitrary name-value pairs for use by the content-consuming application.
     * @remarks
     * The values stored can be used to pass information to a consuming application, such as the version and name of the publishing application, contact information, or any other arbitrary information. Information is stored in a zero-based array and is retrieved by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetapplicationspecificdata">DRMGetApplicationSpecificData</a> function. This function is used both to store a value or delete a stored value, depending on the flag passed in.
     * 
     * One data pair that is processed by an Active Directory Rights Management Services (AD RMS) server is the string pair "Allow_Server_Editing"/"True". When an issuance license has this value pair, it will allow the service, or any trusted service, to reuse the content key. This allows an issuance license to be republished by using the AD RMS SOAP function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-editissuancelicense">EditIssuanceLicense</a>. This function takes in an old issuance license (with this name-value pair) and a new unsigned issuance license, and puts the content key into the new license. The pair "Allow_Server_Editing"/"True" must be added to the new issuance license if you want to allow publishing again.
     * 
     * To prevent republishing, remove this name-value pair or do not include it (do not add the data item with the value "False").
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {Integer} fDelete A flag that indicates whether to add or delete this name-value pair.   <b>FALSE</b> indicates add; <b>TRUE</b> indicates delete.
     * @param {Pointer<Char>} wszName The name of the data.
     * @param {Pointer<Char>} wszValue The value of the data.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetapplicationspecificdata
     */
    static DRMSetApplicationSpecificData(hIssuanceLicense, fDelete, wszName, wszValue) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszValue := wszValue is String? StrPtr(wszValue) : wszValue

        result := DllCall("msdrm.dll\DRMSetApplicationSpecificData", "uint", hIssuanceLicense, "int", fDelete, "ptr", wszName, "ptr", wszValue, "int")
        return result
    }

    /**
     * Allows an application to specify names and descriptions of the license in multiple (human) languages.
     * @remarks
     * This function allows a license to be distributed internationally. A consuming application can display the localized name and description of the license.
     * 
     * <div class="alert"><b>Note</b>  To set a default language for Name and Description, you can set the locale ID to 0. Take note that this is supported only for templates and licenses created programmatically on the client. AD RMS server administration does not support setting a default language for Name and Description.  For more information about creating an issuance license programmatically, see   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-issuance-license">Creating an Issuance License</a>.</div>
     * <div> </div>
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {Integer} fDelete Flag indicating whether the existing item should be deleted:  <b>TRUE</b> indicates it should be deleted; <b>FALSE</b> indicates it should be added.
     * @param {Integer} lcid A locale ID for this name and description. If <i>lcid</i> is given as <b>NULL</b> or zero, the name and description given become the default license name and description. There may be only one name and description for any LCID (locale identifier).
     * @param {Pointer<Char>} wszName A license name, in the language specified by this locale.
     * @param {Pointer<Char>} wszDescription An optional license description, in the language specified by this locale.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetnameanddescription
     */
    static DRMSetNameAndDescription(hIssuanceLicense, fDelete, lcid, wszName, wszDescription) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszDescription := wszDescription is String? StrPtr(wszDescription) : wszDescription

        result := DllCall("msdrm.dll\DRMSetNameAndDescription", "uint", hIssuanceLicense, "int", fDelete, "uint", lcid, "ptr", wszName, "ptr", wszDescription, "int")
        return result
    }

    /**
     * Specifies the number of days from issuance that can pass before an end�user license must be renewed.
     * @param {Integer} hIssuanceLicense The handle of the issuance license in which to  set the interval time.
     * @param {Integer} cDays An unsigned integer  value that specifies the interval period, in days. For example, if you specify 30, the end–user license must be renewed within 30 days of the day  it was issued.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmsetintervaltime
     */
    static DRMSetIntervalTime(hIssuanceLicense, cDays) {
        result := DllCall("msdrm.dll\DRMSetIntervalTime", "uint", hIssuanceLicense, "uint", cDays, "int")
        return result
    }

    /**
     * Obtains an issuance license template from an existing issuance license.
     * @remarks
     * This function is used to extract a XrML string version of an issuance license when you have a handle to an existing issuance license. This string can then be used as a template to create a new issuance license. To create a new template, first create a blank issuance license by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> (working from a prior template or not), then add custom rights, users, or other information to the issuance license. Pass the modified issuance license to this function and extract the template.
     * 
     * Memory allocation and release for out parameters is the responsibility of the calling function. To obtain the size needed to hold the template string, call this function with <b>NULL</b> in the <i>wszIssuanceLicenseTemplate</i> parameter to retrieve the required size in the <i>puIssuanceLicenseTemplateLength</i> parameter.
     * 
     * The issuance license passed in to <b>DRMGetIssuanceLicenseTemplate</b> must have metadata and associated rights. If it does not, the function call will fail. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function to set metadata for an issuance license. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateright">DRMCreateRight</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmaddrightwithuser">DRMAddRightWithUser</a> functions to create or add rights.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to create a template from.
     * @param {Pointer<UInt32>} puIssuanceLicenseTemplateLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszIssuanceLicenseTemplate</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszIssuanceLicenseTemplate</i> buffer.
     * @param {Pointer<Char>} wszIssuanceLicenseTemplate A pointer to a null-terminated Unicode string that receives the issuance license template XrML. The size of this buffer is specified by the <i>puIssuanceLicenseTemplateLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIssuanceLicenseTemplateLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetissuancelicensetemplate
     */
    static DRMGetIssuanceLicenseTemplate(hIssuanceLicense, puIssuanceLicenseTemplateLength, wszIssuanceLicenseTemplate) {
        wszIssuanceLicenseTemplate := wszIssuanceLicenseTemplate is String? StrPtr(wszIssuanceLicenseTemplate) : wszIssuanceLicenseTemplate

        result := DllCall("msdrm.dll\DRMGetIssuanceLicenseTemplate", "uint", hIssuanceLicense, "uint*", puIssuanceLicenseTemplateLength, "ptr", wszIssuanceLicenseTemplate, "int")
        return result
    }

    /**
     * Acquires a signed issuance license online or offline, or produces an unsigned issuance license that can be signed later.
     * @remarks
     * The application callback function specified in the <i>pfnCallback</i> parameter will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-sign-issuance-license">DRM_MSG_SIGN_ISSUANCE_LICENSE</a> message to provide status feedback. This is an asynchronous function that will return either a signed or an unsigned issuance license to the callback function after <b>DRMGetSignedIssuanceLicense</b> has returned.
     * 
     * You request an unsigned issuance license when you want to obtain the string value of an unsigned issuance license from its handle, for example, if you want to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-acquireissuancelicense">AcquireIssuanceLicense</a> SOAP method, or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetissuancelicensetemplate">DRMGetIssuanceLicenseTemplate</a> function.
     * 
     * The retrieved license is not persisted in the permanent license store; the application must obtain the license in the callback function and handle storage. An application uses this function for publishing. If the issuance license owner (the user referenced in <i>hOwner</i> in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function) calls this function for a signed issuance license, they will receive a use license (deposited in the license store) as well as a signed issuance license in the callback function.
     * 
     * When a user calls this function, the issuance license is signed by an AD RMS service (online) or by a client licensor certificate issued by an AD RMS service (offline), and the content key is encrypted by the server's public key. The server licensor certificate of the server that will be signing the unsigned issuance license can take the place of the client licensor certificate when this function is called by a server application that is not using a lockbox. A server application that does not use a lockbox cannot use this function to obtain a signed issuance license offline.
     * 
     * The application can either supply its own content key, or request that AD RMS create one for it. If you are creating your own key, be sure to create a new content key for each piece of content you want to encrypt. AES is currently the only key type supported by AD RMS.
     * 
     * If this call goes out of the caller's intranet to an Internet location that is not on the user's trusted sites list, a security password dialog box will be presented to the user. A URL is considered to be out of the user's domain if the domain of the URL is fully qualified (for example, the fully qualified [https://licensing.contoso.com/_wmcs/licensing](), instead of the internal URL [https://licensing/_wmcs/licensing]()). Locations inside the user's domain are implicitly trusted; locations outside the user's domain must be explicitly trusted. If an intranet administrator wants to use a service outside the expected user's trust zone, the administrator should consider using a domain group policy to add the company server to the trusted sites for those users.
     * 
     * An issuance license must contain metadata before it can be signed. Typical metadata contains the ID, type, and name of an item of content. If you create the license from scratch, you must manually add metadata by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. If you create the license from a template or from an existing license, the metadata contained there is automatically added to the new issuance license, but you should call <b>DRMSetMetaData</b> to assign a new content ID. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-and-using-issuance-licenses">Creating and Using Issuance Licenses</a>.
     * 
     * The following code sample shows how to use the <b>DRM_REUSE_KEY</b> value for <i>uFlags</i> to specify that the content key should be reused. This functionality is available only with Windows 7.
     * 
     * 
     * ```cpp
     * 
     * extern HRESULT __stdcall StatusCallback( 
     *                DRM_STATUS_MSG msg, 
     *                HRESULT hr, 
     *                void *pvParam, 
     *                void *pvContext 
     *                );
     * 
     * //===================================================================
     * Function:      EditSignedIL
     * 
     * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
     * ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
     * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
     * PARTICULAR PURPOSE.
     * 
     * Copyright (C) Microsoft.  All rights reserved.
     * ===================================================================
     * 
     * /////////////////////////////////////////////////////////////////////
     * // The EditSignedIL function edits a signed issuance license by adding
     * // a user while retaining the content key so that content protected
     * // using the issuance license does not have to be re-encrypted.
     * //
     * // Arguments:
     * //        hEnv                  - [in]  Environment handle
     * //        pwszUserID            - [in]  User email address that needs 
     * //                                      to be added to the IL
     * //        pwszUserRight         - [in]  Right that needs to be granted
     * //        pwszRAC               - [in]  RAC of the Republishing user
     * //        pwszCLC               - [in]  CLC of the Republishing user
     * //        pwszOldSignedIL       - [in]  Old Signed Issuance License
     * //        pwszEUL               - [in]  Use License of the Republishing 
     * //                                      user with EDITRIGHTSDATA or OWNER
     * //        ppwszNewSignedIL      - [out] New Signed Issuance License 
     * 
     * HRESULT EditSignedIL(DRMENVHANDLE hEnv,                        
     *                        PWSTR        pwszUserID,
     *                        PWSTR        pwszUserRight,
     *                        PWSTR        pwszRAC,
     *                        PWSTR        pwszCLC,
     *                        PWSTR        pwszOldSignedIL,
     *                        PWSTR        pwszEUL,
     *                        PWSTR        *ppwszNewSignedIL)
     * {
     *     HRESULT       hr                    = S_OK; // HRESULT return code
     *     DRMPUBHANDLE  hOldIssuanceLicense   = NULL; // Issuance license handle
     *     DRMPUBHANDLE  hNewIssuanceLicense   = NULL; // Issuance license handle
     *     DRMPUBHANDLE  hUser                 = NULL; // User handle
     *     DRMPUBHANDLE  hRight                = NULL; // Right handle
     *     const UINT    GUID_LENGTH           = 128;  // GUID string length
     *     PWSTR         pwszNewContentId      = NULL; // Unique content ID for new IL
     *     UINT          uiNewContentId        = 0;    // content id length
     *     GUID          guid;                         // Raw Guid: unique content ID
     *     const DWORD   DW_WAIT_TIME          = 60000;// Maximum signal duration
     *     DWORD         dwWaitResult          = 0;    // Actual signal duration
     *     SYSTEMTIME    stTimeFrom;                   // Validity period start
     *     SYSTEMTIME    stTimeUntil;                  // Validity period end
     *     DRM_CONTEXT   context;                      // Callback context
     *     DRMHANDLE     hBoundLicense         = NULL; // Bound License handle
     *     DRMHANDLE     hDecryptor            = NULL; // Decryptor handle    
     *     UINT          uiOldContentId        = 0;    // Content Id Length of Old IL
     *     UINT          uiOldContentIdType    = 0;    // Content Id Type Length of Old IL
     *     PWSTR         pwszOldContentId      = NULL; // Content Id of old IL
     *     PWSTR         pwszOldContentIdType  = NULL; // Content Id Type of old IL
     *     DRMID         idOldContent;                 // Content Id structure
     *     PWSTR         pwszSymmKeyType       = NULL; // Symmetric Key Type 
     *     UINT          cbSymmKeyType         = 0;    // Symmetric Key Type Length
     *     DRMENCODINGTYPE encodingType;               // Encoding Type
     *     DRMBOUNDLICENSEPARAMS     bParams;          // Bound License parameters
     * 
     *     wprintf(L"\r\nEntering EditSignedIL. \r\n");
     * 
     *     // Initialize the callback context.
     *     SecureZeroMemory(&context, sizeof(context));
     * 
     *     // Get the system time for the starting and ending times that
     *     // specify the validity period of the unsigned issuance license.
     *     // Add one year to the ending time.
     *     GetSystemTime( &stTimeFrom );
     *     GetSystemTime( &stTimeUntil );
     *     stTimeUntil.wYear++;
     * 
     *     // Obtain the Content Id from the Signed issuance license
     *     //          a. Create an issuance license handle from the signed IL
     *     //          b. Obtain content ID and content ID Type
     *     hr = DRMCreateIssuanceLicense( 
     *           &stTimeFrom,                // Starting validity time
     *           &stTimeUntil,               // Ending validity time
     *           NULL,                       // Not supported
     *           NULL,                       // Not supported
     *           NULL,                       // Handle to license owner
     *           pwszOldSignedIL,            // Existing issuance license
     *           NULL,                       // Bound license handle
     *           &hOldIssuanceLicense);      // Handle to the license
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateIssuanceLicense: hOldIssuanceLicense = %i \r\n",
     *           hOldIssuanceLicense);
     * 
     *     hr = DRMGetMetaData(
     *           hOldIssuanceLicense,        // Handle to the license
     *           &uiOldContentId,            // Content Id Length
     *           NULL,                       // Content Id
     *           &uiOldContentIdType,        // Content Id Type Length
     *           NULL,                       // Content Id Type 
     *           NULL,                       // SKU ID Length
     *           NULL,                       // SKU ID 
     *           NULL,                       // SKU ID Type Length
     *           NULL,                       // SKU ID Type
     *           NULL,                       // Content Type Length
     *           NULL,                       // Content Type
     *           NULL,                       // Content Name Length
     *           NULL);                      // Content Name 
     *     if(FAILED(hr)) goto e_Exit;
     * 
     *     pwszOldContentId = new WCHAR[uiOldContentId];
     *     if(NULL == pwszOldContentId) 
     *     {
     *         hr = E_OUTOFMEMORY;
     *         goto e_Exit;
     *     }
     * 
     *     pwszOldContentIdType = new WCHAR[uiOldContentIdType];
     *     if(NULL == pwszOldContentIdType) 
     *     {
     *         hr = E_OUTOFMEMORY;
     *         goto e_Exit;
     *     }
     * 
     *     hr = DRMGetMetaData(
     *           hOldIssuanceLicense,        // Handle to the license
     *           &uiOldContentId,            // Content Id Length
     *           pwszOldContentId,           // Content Id
     *           &uiOldContentIdType,        // Content Id Type Length
     *           pwszOldContentIdType,       // Content Id Type 
     *           NULL,                       // SKU ID Length
     *           NULL,                       // SKU ID 
     *           NULL,                       // SKU ID Type Length
     *           NULL,                       // SKU ID Type
     *           NULL,                       // Content Type Length
     *           NULL,                       // Content Type
     *           NULL,                       // Content Name Length
     *           NULL);                      // Content Name 
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMGetMetadata: pwszOldContentId = %ws \r\n",
     *           pwszOldContentId);
     * 
     *     // Create the content id structure for the BOUNDLICENSEPARAMS
     *     idOldContent.uVersion  = 0; 
     *     idOldContent.wszIDType = pwszOldContentIdType; 
     *     idOldContent.wszID     = pwszOldContentId; 
     * 
     *     // Bind the license to the EDITRIGHTSDATA or OWNER right 
     *     // to reuse the key. 
     *     bParams.hEnablingPrincipal                     = NULL; 
     *     bParams.hSecureStore                           = NULL; 
     *     bParams.wszRightsRequested                     = L"EDITRIGHTSDATA";  
     *     bParams.wszRightsGroup                         = L"Main-Rights"; 
     *     bParams.idResource                             = idOldContent; 
     *     bParams.wszDefaultEnablingPrincipalCredentials = pwszRAC; 
     *     bParams.cAuthenticatorCount                    = 0; 
     * 
     *     hr = DRMCreateBoundLicense( 
     *         hEnv,                    // secure environment handle 
     *         &bParams,                // additional license options 
     *         pwszEUL,                 // owner license 
     *         &hBoundLicense,          // handle to bound license 
     *         NULL                     // reserved 
     *         ); 
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateBoundLicense: hBoundLicense = %i \r\n",
     *           hBoundLicense);
     * 
     *     hr = DRMCreateEnablingBitsDecryptor( 
     *         hBoundLicense,           // bound license handle 
     *         NULL,                    // right name
     *         NULL,                    // reserved
     *         NULL,                    // reserved
     *         &hDecryptor              // decryptor handle 
     *         ); 
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateEnablingBitsDecryptor: hDecryptor = %i \r\n",
     *           hDecryptor);
     * 
     *     // Obtain the key type set in the decryptor so that it can be 
     *     // specified when creating the new issuance license
     *     // g_wszQUERY_SYMMETRICKEYTYPE requires a client that supports 
     *     // AES-CBC4K. Otherwise, symmetric key type can always be assumed 
     *     // to be "AES"
     *     hr = DRMGetInfo(hDecryptor,
     *                     g_wszQUERY_SYMMETRICKEYTYPE,
     *                     &encodingType,
     *                     &cbSymmKeyType,
     *                     NULL);
     *     if(FAILED(hr)) goto e_Exit;
     * 
     *     pwszSymmKeyType = new WCHAR[cbSymmKeyType / 2];
     *     if(pwszSymmKeyType == NULL) 
     *     {
     *         hr = E_OUTOFMEMORY;
     *         goto e_Exit;
     *     }
     *     SecureZeroMemory(pwszSymmKeyType, cbSymmKeyType);
     * 
     *     hr = DRMGetInfo(hDecryptor,
     *                     g_wszQUERY_SYMMETRICKEYTYPE,
     *                     &encodingType,
     *                     &cbSymmKeyType,
     *                     (BYTE*)pwszSymmKeyType);
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMGetInfo: pwszSymmKeyType = %ws \r\n",
     *           pwszSymmKeyType);
     * 
     *     // Create an unsigned issuance license from the passed in
     *     // signed issuance license.
     *     hr = DRMCreateIssuanceLicense( 
     *           &stTimeFrom,           // Starting validity time
     *           &stTimeUntil,          // Ending validity time
     *           NULL,                  // Not supported
     *           NULL,                  // Not supported
     *           NULL,                  // Handle to license owner
     *           pwszOldSignedIL,       // Existing issuance license
     *           hBoundLicense,         // Bound license: get rights 
     *                                  // and content key 
     *           &hNewIssuanceLicense); // Handle to the new license
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateIssuanceLicense: hNewIssuanceLicense = %i \r\n",
     *           hNewIssuanceLicense);
     * 
     *     // Create a GUID to use as the unique content ID.
     *     hr = CoCreateGuid(&guid);
     *     if(FAILED(hr)) goto e_Exit;
     * 
     *     pwszNewContentId = new WCHAR[GUID_LENGTH];
     *     if (NULL == pwszNewContentId)
     *     {
     *         hr = E_OUTOFMEMORY;
     *         goto e_Exit;
     *     }
     * 
     *     uiNewContentId = StringFromGUID2( guid, pwszNewContentId, GUID_LENGTH );
     *     if (0 == uiNewContentId)
     *     {
     *         hr = E_FAIL;
     *         goto e_Exit;
     *     }
     *     wprintf(L"StringFromGUID2: pwszNewContentId = %s \r\n", pwszNewContentId);
     * 
     *     // Set your metadata in the unsigned issuance license.
     *     hr = DRMSetMetaData(
     *           hNewIssuanceLicense,        // Issuance license handle
     *           pwszNewContentId,           // Unique content ID
     *           L"MS-GUID",                 // Type of content ID
     *           L"SKUId",                   // SKU ID
     *           L"SKUIdType",               // SKU ID type
     *           L"ContentType",             // Content type
     *           L"ContentName");            // Content name
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMSetMetaData succeeded. \r\n");
     * 
     *     // Create a user handle.
     *     hr = DRMCreateUser(
     *           pwszUserID,                 // User ID or name
     *           NULL,                       // Verified ID
     *           L"Windows",                 // Type of user ID
     *           &hUser );                   // Handle to the user
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateUser:  hUser = %i \r\n", hUser);
     * 
     *     // Create a right.
     *     hr = DRMCreateRight( 
     *           pwszUserRight,              // Name of the right to create
     *           &stTimeFrom,                // Starting validity time
     *           &stTimeUntil,               // Ending validity time
     *           0,                          // No extended information
     *           NULL,                       // Extended information name
     *           NULL,                       // Extended information value
     *           &hRight );                  // Handle to the created right
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMCreateRight:  hRight = %i \r\n", hRight);
     * 
     *     // Associate the right with the user and add both to the 
     *     // unsigned issuance license.
     *     hr = DRMAddRightWithUser( 
     *           hNewIssuanceLicense,        // Issuance license handle
     *           hRight,                     // Right from DRMCreateRight
     *           hUser );                    // User from DRMCreateUser
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMAddRightWithUser succeeded. \r\n");
     * 
     *     // Create an event to signal when the license has been signed.
     *     context.hEvent = CreateEvent(
     *           NULL,                       // No attributes
     *           FALSE,                      // Automatic reset
     *           FALSE,                      // Initial state not signaled
     *           NULL);                      // Event object not named
     *     if(NULL == context.hEvent) goto e_Exit;
     * 
     *     // Sign the issuance license offline by using the client
     *     // licensor certificate
     *     hr = DRMGetSignedIssuanceLicense( 
     *           hEnv,                  // Environment handle
     *           hNewIssuanceLicense,   // Issuance license handle
     *           DRM_SIGN_OFFLINE |     // Sign offline with a CLC
     *                 DRM_REUSE_KEY,   // Reuse content key from old IL
     *           NULL,                  // No symmetric key specified
     *           0,                     // No length specified
     *           pwszSymmKeyType,       // Pass in same key type as old IL
     *           pwszCLC,               // Client licensor certificate
     *           &StatusCallback,       // Callback function
     *           NULL,                  // No licensing URL specified
     *           (void*)&context);      // Callback context parameter
     *     if(FAILED(hr)) goto e_Exit;
     *     wprintf(L"DRMGetSignedIssuanceLicense succeeded. \r\n");
     * 
     *     // Wait for the callback to return.
     *     dwWaitResult = WaitForSingleObject(context.hEvent, DW_WAIT_TIME);
     *     if(WAIT_TIMEOUT == dwWaitResult) 
     *     {
     *         hr = E_FAIL;
     *         goto e_Exit;
     *     }
     * 
     *     if(FAILED(context.hr))
     *     {
     *         hr = context.hr;
     *         goto e_Exit;
     *     }
     * 
     *     // Assign the license pointer to the output parameter. 
     *     *ppwszNewSignedIL = context.wszData;
     *     context.wszData = NULL;
     * 
     * e_Exit:
     *     if(NULL != context.hEvent)
     *     {
     *         CloseHandle(context.hEvent);
     *     }
     *     if(NULL != context.wszData)
     *     {
     *         delete[] context.wszData;
     *     }
     *     if(NULL != pwszOldContentId)
     *     {
     *         delete[] pwszOldContentId;
     *     }
     *     if(NULL != pwszOldContentIdType)
     *     {
     *         delete[] pwszOldContentIdType;
     *     }
     *     if(NULL != pwszSymmKeyType)
     *     {
     *         delete[] pwszSymmKeyType;
     *     }
     *     if(NULL != hDecryptor)
     *     {
     *         DRMCloseHandle(hDecryptor);
     *     }
     *     if(NULL != hBoundLicense)
     *     {
     *         DRMCloseHandle(hBoundLicense);
     *     }
     *     if(NULL != hOldIssuanceLicense)
     *     {
     *         DRMClosePubHandle(hOldIssuanceLicense);
     *     }
     *     if(NULL != hNewIssuanceLicense)
     *     {
     *         DRMClosePubHandle(hNewIssuanceLicense);
     *     }
     *     if(NULL != hUser)
     *     {
     *         DRMClosePubHandle(hUser);
     *     }
     *     if(NULL != hRight)
     *     {
     *         DRMClosePubHandle(hRight);
     *     }
     *     if(NULL != pwszNewContentId)
     *     {
     *         delete [] pwszNewContentId;
     *     }
     *     wprintf(L"Leaving EditSignedIL: hr = %x \r\n", hr);
     *     return hr;
     * }
     * 
     * ```
     * @param {Integer} hEnv A handle to a secure environment created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function. The handle is required for offline signing and optional for online signing. Applications that do not use a lockbox should pass <b>NULL</b> for this parameter.
     * @param {Integer} hIssuanceLicense A handle to an issuance license to sign, created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer<Byte>} pbSymKey The content key used to encrypt the document. If this value is <b>NULL</b>, the <i>uFlags</i> parameter must specify <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>. These <i>uFlags</i> values cause <i>pbSymKey</i> to be ignored.
     * @param {Integer} cbSymKey The size, in bytes, of the content key. Currently, this parameter can only be 16 unless the <i>uFlags</i> parameter specifies <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>, in which case this parameter can be zero.
     * @param {Pointer<Char>} wszSymKeyType The key type. The value <b>AES</b> specifies the Advanced Encryption Standard (AES) algorithm with the  electronic code book (ECB) cipher mode. If you are using Windows 7, the value <b>AES_CBC4K</b> can be used to specify the AES algorithm with cipher-block chaining (CBC) cipher mode. See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmencrypt">DRMEncrypt</a> code examples for more information.
     * @param {Pointer<Char>} wszClientLicensorCertificate A pointer to null-terminated Unicode string that contains a client licensor certificate obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> function. If you are attempting online signing, this parameter should be <b>NULL</b>. If you are developing a server application that does not use a lockbox and  if you are using the <b>DRM_SERVER_ISSUANCELICENSE</b> flag in <i>uFlags</i>, pass in the server license certificate chain. The server licensor certificate chain can be retrieved by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-getlicensorcertificate">GetLicensorCertificate</a> SOAP method; however, to make the chain usable, it must be reordered by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmconstructcertificatechain">DRMConstructCertificateChain</a> function.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to the callback function used to notify the application of an asynchronous request's progress. For the signature of the callback function you must provide, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {Pointer<Char>} wszURL A pointer to a null-terminated Unicode string that contains the URL of an AD RMS licensing server that was obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> function. This string takes the form "<i>ADRMSLicensingServerURL</i>/_wmcs/Licensing". This parameter value is required for online license requests; you can use <b>NULL</b> for offline license requests. This URL is entered in the signed issuance license as the default silent license acquisition URL, which is where an application will automatically go to acquire an end-user license if none is specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetsignedissuancelicense
     */
    static DRMGetSignedIssuanceLicense(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, wszClientLicensorCertificate, pfnCallback, wszURL, pvContext) {
        wszSymKeyType := wszSymKeyType is String? StrPtr(wszSymKeyType) : wszSymKeyType
        wszClientLicensorCertificate := wszClientLicensorCertificate is String? StrPtr(wszClientLicensorCertificate) : wszClientLicensorCertificate
        wszURL := wszURL is String? StrPtr(wszURL) : wszURL

        result := DllCall("msdrm.dll\DRMGetSignedIssuanceLicense", "uint", hEnv, "uint", hIssuanceLicense, "uint", uFlags, "char*", pbSymKey, "uint", cbSymKey, "ptr", wszSymKeyType, "ptr", wszClientLicensorCertificate, "ptr", pfnCallback, "ptr", wszURL, "ptr", pvContext, "int")
        return result
    }

    /**
     * Acquires a signed issuance license offline.
     * @remarks
     * To use this function, create an enabling principal from the rights account certificate using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a>. After this, you must parse the client licensor certificate(CLC) to obtain the content ID, in the same manner as you do for the end-user license. Subsequently, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>, passing in the <i>hEnablingPrincipal</i> obtained from the call to <b>DRMCreateEnablingPrincipal</b> and the content ID to create an <i>hBoundLicense</i> that corresponds with the CLC. Next, call <b>DRMGetSignedIssuanceLicenseEx</b>, passing in the <i>hEnablingPrincipal</i> obtained from the call to <b>DRMCreateEnablingPrincipal</b> and the <i>hBoundLicense</i> obtained from the call to <b>DRMCreateBoundLicense</b>. Finally, cache the handles obtained from the call to <b>DRMCreateEnablingPrincipal</b> and the call to <b>DRMCreateBoundLicense</b>.
     * @param {Integer} hEnv A handle to a secure environment created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function. The handle is required for offline signing. Applications that do not use a lockbox should pass <b>NULL</b> for this parameter.
     * @param {Integer} hIssuanceLicense A handle to an issuance license to sign, created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer} pbSymKey The content key used to encrypt the document. If this value is <b>NULL</b>, the <i>uFlags</i> parameter must specify <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>. These <i>uFlags</i> values cause <i>pbSymKey</i> to be ignored.
     * @param {Integer} cbSymKey The size, in bytes, of the content key. Currently, this parameter can only be 16 unless the <i>uFlags</i> parameter specifies <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>, in which case this parameter can be zero.
     * @param {Pointer<Char>} wszSymKeyType The key type. The value <b>AES</b> specifies the Advanced Encryption Standard (AES) algorithm with the  electronic code book (ECB) cipher mode. If you are using Windows 7, the value <b>AES_CBC4K</b> can be used to specify the AES algorithm with cipher-block chaining (CBC) cipher mode. See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmencrypt">DRMEncrypt</a> code examples for more information.
     * @param {Pointer<Void>} pvReserved Reserved for future use.
     * @param {Integer} hEnablingPrincipal A handle to an enabling principal in the end-user license that should be bound. Create this handle by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function by passing in the rights account certificate. This parameter is required.
     * @param {Integer} hBoundLicenseCLC A handle to the bound license corresponding to the client licensor certificate created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>. This can be created by binding the <i>wszClientLicensorCertificate</i> to the <b>ISSUE</b> right using the <i>hEnablingPrincipal</i> handle. This parameter is required.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to the callback function used to notify the application of an asynchronous request's progress. For the signature of the callback function you must provide, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetsignedissuancelicenseex
     * @since windows6.1
     */
    static DRMGetSignedIssuanceLicenseEx(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, pvReserved, hEnablingPrincipal, hBoundLicenseCLC, pfnCallback, pvContext) {
        wszSymKeyType := wszSymKeyType is String? StrPtr(wszSymKeyType) : wszSymKeyType

        result := DllCall("msdrm.dll\DRMGetSignedIssuanceLicenseEx", "uint", hEnv, "uint", hIssuanceLicense, "uint", uFlags, "ptr", pbSymKey, "uint", cbSymKey, "ptr", wszSymKeyType, "ptr", pvReserved, "uint", hEnablingPrincipal, "uint", hBoundLicenseCLC, "ptr", pfnCallback, "ptr", pvContext, "int")
        return result
    }

    /**
     * Closes a previously created DRMPUBHANDLE.
     * @remarks
     * A <b>DRMPUBHANDLE</b> provides an opaque handle to many publishing objects. Creating, copying, and closing these handles with the appropriate Active Directory Rights Management function allows the AD RMS system to maintain a reference count on resources and free them appropriately, and also clears sensitive data from memory.
     * @param {Integer} hPub A handle to a publishing object.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmclosepubhandle
     */
    static DRMClosePubHandle(hPub) {
        result := DllCall("msdrm.dll\DRMClosePubHandle", "uint", hPub, "int")
        return result
    }

    /**
     * Makes a copy of a DRMPUBHANDLE.
     * @remarks
     * Using the appropriate function to create, copy, and close these handles allows Active Directory Rights Management Services to maintain a reference count on resources and free them appropriately; it also clears sensitive data from memory.
     * @param {Integer} hPubIn The <b>DRMPUBHANDLE</b> to make a copy of.
     * @param {Pointer<UInt32>} phPubOut A pointer to a <b>DRMPUBHANDLE</b> value that receives the duplicate handle. When this handle is no longer needed, release it  by passing it to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> function.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmduplicatepubhandle
     */
    static DRMDuplicatePubHandle(hPubIn, phPubOut) {
        result := DllCall("msdrm.dll\DRMDuplicatePubHandle", "uint", hPubIn, "uint*", phPubOut, "int")
        return result
    }

    /**
     * Obtains information about a user.
     * @remarks
     * For more information about user IDs and ID types, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateuser">DRMCreateUser</a>.
     * 
     * When you obtain the output values, you can first call this function with <i>wszUserName</i>, <i>wszUserId</i>, and <i>wszUserIdType</i> set to <b>NULL</b> to obtain the needed buffer sizes through <i>puUserNameLength</i>, <i>puUserIdLength</i>, and <i>puUserIdTypeLength</i>. It is the application's responsibility to allocate and free buffer space.
     * @param {Integer} hUser The handle of the user to obtain information for.
     * @param {Pointer<UInt32>} puUserNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserName</i> buffer.
     * @param {Pointer<Char>} wszUserName A pointer to a null-terminated Unicode string that receives the user name as a fully qualified SMTP email address. This is not enforced or used to check identities; it is only included to provide a human-readable identification. The size of this buffer is specified by the <i>puUserNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserNameLength</i> value.
     * @param {Pointer<UInt32>} puUserIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserId</i> buffer.
     * @param {Pointer<Char>} wszUserId A pointer to a null-terminated Unicode string that receives the  user's ID. The size of this buffer is specified by the <i>puUserIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserIdLength</i> value.
     * @param {Pointer<UInt32>} puUserIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserIdType</i> buffer.
     * @param {Pointer<Char>} wszUserIdType A pointer to a null-terminated Unicode string that receives the type of ID used to identify the user (such as Passport, Windows, or other). The size of this buffer is specified by the <i>puUserIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserIdTypeLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetuserinfo
     */
    static DRMGetUserInfo(hUser, puUserNameLength, wszUserName, puUserIdLength, wszUserId, puUserIdTypeLength, wszUserIdType) {
        wszUserName := wszUserName is String? StrPtr(wszUserName) : wszUserName
        wszUserId := wszUserId is String? StrPtr(wszUserId) : wszUserId
        wszUserIdType := wszUserIdType is String? StrPtr(wszUserIdType) : wszUserIdType

        result := DllCall("msdrm.dll\DRMGetUserInfo", "uint", hUser, "uint*", puUserNameLength, "ptr", wszUserName, "uint*", puUserIdLength, "ptr", wszUserId, "uint*", puUserIdTypeLength, "ptr", wszUserIdType, "int")
        return result
    }

    /**
     * Obtains information about a previously created right.
     * @param {Integer} hRight The handle of the right to retrieve information from.
     * @param {Pointer<UInt32>} puRightNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszRightName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszRightName</i> buffer.
     * @param {Pointer<Char>} wszRightName A pointer to a null-terminated Unicode string that receives the name of the right. The size of this buffer is specified by the <i>puRightNameLength</i> parameter. If this information is not required, set this parameter to <b>NULL</b>.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puRightNameLength</i> value.
     * @param {Pointer<SYSTEMTIME>} pstFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the starting validity time, in UTC time, of the right. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the ending validity time, in UTC time, of the right. If this information is not required, set this parameter to <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetrightinfo
     */
    static DRMGetRightInfo(hRight, puRightNameLength, wszRightName, pstFrom, pstUntil) {
        wszRightName := wszRightName is String? StrPtr(wszRightName) : wszRightName

        result := DllCall("msdrm.dll\DRMGetRightInfo", "uint", hRight, "uint*", puRightNameLength, "ptr", wszRightName, "ptr", pstFrom, "ptr", pstUntil, "int")
        return result
    }

    /**
     * Retrieves custom name-value pairs attached to a right.
     * @remarks
     * The <b>DRMGetRightExtendedInfo</b> method allows a user to add or retrieve arbitrary strings for a right. Applications can use this string to create generic conditions or add any other information associated with a right. These name-value pairs are added in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateright">DRMCreateRight</a> as parallel arrays.
     * 
     * To enumerate the existing extended data values, iterate through the index numbers, starting at zero, until the function returns <b>E_DRM_NO_MORE_DATA</b>.
     * @param {Integer} hRight The handle of the right to retrieve information from.
     * @param {Integer} uIndex The zero-based index of the name-value pair to retrieve.
     * @param {Pointer<UInt32>} puExtendedInfoNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszExtendedInfoName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszExtendedInfoName</i> buffer.
     * @param {Pointer<Char>} wszExtendedInfoName A pointer to a null-terminated Unicode string that receives the name of the item. The size of this buffer is specified by the <i>puExtendedInfoNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puExtendedInfoNameLength</i> value.
     * @param {Pointer<UInt32>} puExtendedInfoValueLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszExtendedInfoValue</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszExtendedInfoValue</i> buffer.
     * @param {Pointer<Char>} wszExtendedInfoValue A pointer to a null-terminated Unicode string that receives the value associated with the name. The size of this buffer is specified by the <i>puExtendedInfoValueLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puExtendedInfoValueLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetrightextendedinfo
     */
    static DRMGetRightExtendedInfo(hRight, uIndex, puExtendedInfoNameLength, wszExtendedInfoName, puExtendedInfoValueLength, wszExtendedInfoValue) {
        wszExtendedInfoName := wszExtendedInfoName is String? StrPtr(wszExtendedInfoName) : wszExtendedInfoName
        wszExtendedInfoValue := wszExtendedInfoValue is String? StrPtr(wszExtendedInfoValue) : wszExtendedInfoValue

        result := DllCall("msdrm.dll\DRMGetRightExtendedInfo", "uint", hRight, "uint", uIndex, "uint*", puExtendedInfoNameLength, "ptr", wszExtendedInfoName, "uint*", puExtendedInfoValueLength, "ptr", wszExtendedInfoValue, "int")
        return result
    }

    /**
     * Retrieves a specific user from an issuance license.
     * @remarks
     * To enumerate all the users in the issuance license, create a loop starting at zero and incrementing by one. When the function returns <b>E_DRM_NO_MORE_DATA</b>, there are no more users in the issuance license.  Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the user handle created by calling this function.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to retrieve the user from.
     * @param {Integer} uIndex The zero-based index of the user in the issuance license to retrieve. To enumerate all the users in the issuance license, create a loop starting at zero and incrementing by one. When the function returns <b>E_DRM_NO_MORE_DATA</b>, there are no more users in the issuance license.
     * @param {Pointer<UInt32>} phUser A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle to the requested user. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetusers
     */
    static DRMGetUsers(hIssuanceLicense, uIndex, phUser) {
        result := DllCall("msdrm.dll\DRMGetUsers", "uint", hIssuanceLicense, "uint", uIndex, "uint*", phUser, "int")
        return result
    }

    /**
     * Retrieves user/right pairs from an issuance license.
     * @remarks
     * This function gets a right associated with a specific user. User rights are added by using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmaddrightwithuser">DRMAddRightWithUser</a>. To enumerate all rights assigned to a user, pass in a user handle and an index value of zero. Continue to call this function, incrementing the index number by one each time, until <b>E_DRM_NO_MORE_DATA</b> is returned.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle created by calling this function.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to retrieve the user rights from.
     * @param {Integer} hUser The handle of a user in the issuance license to retrieve the rights for.
     * @param {Integer} uIndex The zero-based index that indicates which right to retrieve for the specified user. To enumerate all the rights assigned to a user in the issuance license, create a loop starting at zero and incrementing by one. When the function returns <b>E_DRM_NO_MORE_DATA</b>, there are no more rights assigned to that user.
     * @param {Pointer<UInt32>} phRight A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle to the requested right. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetuserrights
     */
    static DRMGetUserRights(hIssuanceLicense, hUser, uIndex, phRight) {
        result := DllCall("msdrm.dll\DRMGetUserRights", "uint", hIssuanceLicense, "uint", hUser, "uint", uIndex, "uint*", phRight, "int")
        return result
    }

    /**
     * Retrieves metadata from an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the metadata from.
     * @param {Pointer<UInt32>} puContentIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentId</i> buffer (required). This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentId</i> buffer.
     * @param {Pointer<Char>} wszContentId A pointer to a null-terminated Unicode string that receives the GUID that identifies the content. The size of this buffer is specified by the <i>puContentIdLength</i> parameter.
     * 
     * To determine the required size of  this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentIdLength</i> value.
     * @param {Pointer<UInt32>} puContentIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentIdType</i> buffer  (required). This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentIdType</i> buffer.
     * @param {Pointer<Char>} wszContentIdType A pointer to a null-terminated Unicode string that receives the type of GUID used to identify the content. The size of this buffer is specified by the <i>puContentIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentIdTypeLength</i> value.
     * @param {Pointer<UInt32>} puSKUIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszSKUId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszSKUId</i> buffer.
     * @param {Pointer<Char>} wszSKUId A pointer to a null-terminated Unicode string that receives the GUID that identifies the SKU of the content. The size of this buffer is specified by the <i>puSKUIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puSKUIdLength</i> value.
     * @param {Pointer<UInt32>} puSKUIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszSKUIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszSKUIdType</i> buffer.
     * @param {Pointer<Char>} wszSKUIdType A pointer to a null-terminated Unicode string that receives the type of SKU ID used to identify content. The size of this buffer is specified by the <i>puSKUIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puSKUIdTypeLength</i> value.
     * @param {Pointer<UInt32>} puContentTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentType</i> buffer.
     * @param {Pointer<Char>} wszContentType A pointer to a null-terminated Unicode string that receives the Multipurpose Internet Mail Extensions (MIME) type of the content. The size of this buffer is specified by the <i>puContentTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentTypeLength</i> value.
     * @param {Pointer<UInt32>} puContentNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentName</i> buffer.
     * @param {Pointer<Char>} wszContentName A pointer to a null-terminated Unicode string that receives the name of the content. The size of this buffer is specified by the <i>puContentNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentNameLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetmetadata
     */
    static DRMGetMetaData(hIssuanceLicense, puContentIdLength, wszContentId, puContentIdTypeLength, wszContentIdType, puSKUIdLength, wszSKUId, puSKUIdTypeLength, wszSKUIdType, puContentTypeLength, wszContentType, puContentNameLength, wszContentName) {
        wszContentId := wszContentId is String? StrPtr(wszContentId) : wszContentId
        wszContentIdType := wszContentIdType is String? StrPtr(wszContentIdType) : wszContentIdType
        wszSKUId := wszSKUId is String? StrPtr(wszSKUId) : wszSKUId
        wszSKUIdType := wszSKUIdType is String? StrPtr(wszSKUIdType) : wszSKUIdType
        wszContentType := wszContentType is String? StrPtr(wszContentType) : wszContentType
        wszContentName := wszContentName is String? StrPtr(wszContentName) : wszContentName

        result := DllCall("msdrm.dll\DRMGetMetaData", "uint", hIssuanceLicense, "uint*", puContentIdLength, "ptr", wszContentId, "uint*", puContentIdTypeLength, "ptr", wszContentIdType, "uint*", puSKUIdLength, "ptr", wszSKUId, "uint*", puSKUIdTypeLength, "ptr", wszSKUIdType, "uint*", puContentTypeLength, "ptr", wszContentType, "uint*", puContentNameLength, "ptr", wszContentName, "int")
        return result
    }

    /**
     * Retrieves a name-value pair of arbitrary application-specific information.
     * @remarks
     * This function can be used to retrieve arbitrary information that was stored in the issuance license by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetapplicationspecificdata">DRMSetApplicationSpecificData</a> function.
     * 
     * The calling application is responsible for memory allocation/deallocation for variables used to hold retrieved data. To determine the size of the data that will be returned, call this function with <b>NULL</b> in <i>wszValue</i> and <i>wszName</i> to retrieve data sizes from <i>puNameLength</i> and <i>puValueLength</i>.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to obtain the data from.
     * @param {Integer} uIndex The zero-based index of the name-value pair in the array of stored name-value pairs to retrieve.
     * @param {Pointer<UInt32>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {Pointer<Char>} wszName A pointer to a Unicode character buffer that receives the name portion of the name-value pair. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<UInt32>} puValueLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszValue</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszValue</i> buffer.
     * @param {Pointer<Char>} wszValue A pointer to a Unicode character buffer that receives the value portion of the name-value pair. The size of this buffer is specified by the <i>puValueLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puValueLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetapplicationspecificdata
     */
    static DRMGetApplicationSpecificData(hIssuanceLicense, uIndex, puNameLength, wszName, puValueLength, wszValue) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszValue := wszValue is String? StrPtr(wszValue) : wszValue

        result := DllCall("msdrm.dll\DRMGetApplicationSpecificData", "uint", hIssuanceLicense, "uint", uIndex, "uint*", puNameLength, "ptr", wszName, "uint*", puValueLength, "ptr", wszValue, "int")
        return result
    }

    /**
     * Retrieves various information from an issuance license.
     * @remarks
     * Memory allocation and release for out parameters are the responsibility of the calling function. To determine the buffer size needed to hold these values, first call this function with <b>NULL</b> in <i>wszDistributionPointName</i> and <i>wszDistributionPointURL</i> to retrieve the required sizes from the length parameters <i>puDistributionPointNameLength</i> and <i>puDistributionPointURLLength</i>.
     * 
     * Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the license owner handle created by calling this function.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to retrieve information from.
     * @param {Pointer<SYSTEMTIME>} pstTimeFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the starting validity time, in UTC time, of the license. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstTimeUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the ending validity time, in UTC time, of the license. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Integer} uFlags A value of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_distribution_point_info">DRM_DISTRIBUTION_POINT_INFO</a> enumeration that specifies the type of service provided by this distribution point (such as publishing or license acquisition). Only one flag can be used.
     * @param {Pointer<UInt32>} puDistributionPointNameLength A pointer to a UINT value that, on entry, contains the length, in characters, of the <i>wszDistributionPointName</i> buffer. This size must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDistributionPointName</i> buffer.
     * 
     * If the <i>wszDistributionPointName</i> string is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<Char>} wszDistributionPointName A pointer to a null-terminated Unicode string that receives the name of a website that can distribute end-user licenses. The size of this buffer is specified by the <i>puDistributionPointNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDistributionPointNameLength</i> value.
     * @param {Pointer<UInt32>} puDistributionPointURLLength A pointer to a UINT value that, on entry, contains the length, in characters, of the <i>wszDistributionPointURL</i> buffer. This size must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDistributionPointURL</i> buffer.
     * 
     * If the <i>wszDistributionPointURL</i> string is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<Char>} wszDistributionPointURL A pointer to a null-terminated Unicode string that receives the URL of a website that can distribute end-user licenses. The size of this buffer is specified by the <i>puDistributionPointURLLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDistributionPointURLLength</i> value.
     * @param {Pointer<UInt32>} phOwner A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle of the issuance license owner. If this information is not required, set this parameter to <b>NULL</b>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @param {Pointer<Int32>} pfOfficial A pointer to  a Boolean value that specifies whether the issuance license is based on an official template. A nonzero value indicates that the license is based on an official template. Official templates are created and signed by the AD RMS server. Unofficial templates are created by the client from scratch or by adapting an official template. If this information is not required, set this parameter to <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-license-from-a-template">Creating a License From a Template</a>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetissuancelicenseinfo
     */
    static DRMGetIssuanceLicenseInfo(hIssuanceLicense, pstTimeFrom, pstTimeUntil, uFlags, puDistributionPointNameLength, wszDistributionPointName, puDistributionPointURLLength, wszDistributionPointURL, phOwner, pfOfficial) {
        wszDistributionPointName := wszDistributionPointName is String? StrPtr(wszDistributionPointName) : wszDistributionPointName
        wszDistributionPointURL := wszDistributionPointURL is String? StrPtr(wszDistributionPointURL) : wszDistributionPointURL

        result := DllCall("msdrm.dll\DRMGetIssuanceLicenseInfo", "uint", hIssuanceLicense, "ptr", pstTimeFrom, "ptr", pstTimeUntil, "uint", uFlags, "uint*", puDistributionPointNameLength, "ptr", wszDistributionPointName, "uint*", puDistributionPointURLLength, "ptr", wszDistributionPointURL, "uint*", phOwner, "int*", pfOfficial, "int")
        return result
    }

    /**
     * Retrieves information about the revocation point for an issuance license.
     * @remarks
     * A revocation list can revoke end-user licenses, server licensor certificates, or almost anything else that has an identifying GUID. The URL provided should refer to the list file itself. Active Directory Rights Management Services (AD RMS) handles checking for a valid revocation list. You could call this function for each revocation point structure in a license if <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> fails because of a stale or missing revocation list. However, a simpler method is to call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquireadvisories">DRMAcquireAdvisories</a>, which updates all revocation lists for you.
     * 
     * If a public key is provided, it should be a well-formed XrML public key node. If the revocation list is signed with a key pair outside the content's chain of trust, the public key of that key pair must be specified here. Otherwise, it should not be used.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the information from.
     * @param {Pointer<UInt32>} puIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszId</i> buffer.
     * @param {Pointer<Char>} wszId A pointer to a null-terminated Unicode string that receives the GUID that identifies the revocation point. The size of this buffer is specified by the <i>puIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIdLength</i> value.
     * @param {Pointer<UInt32>} puIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszIdType</i> buffer.
     * @param {Pointer<Char>} wszIdType A pointer to a null-terminated Unicode string that receives the type of the revocation point identifier. The size of this buffer is specified by the <i>puIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIdTypeLength</i> value.
     * @param {Pointer<UInt32>} puURLLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszURL</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszURL</i> buffer.
     * @param {Pointer<Char>} wszRL A pointer to a null-terminated Unicode string that receives the URL where a revocation list can be obtained. The size of this buffer is specified by the <i>puURLLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puURLLength</i> value.
     * @param {Pointer<SYSTEMTIME>} pstFrequency A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the frequency that the revocation list must be refreshed. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<UInt32>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {Pointer<Char>} wszName A pointer to a null-terminated Unicode string that receives the human-readable name for the revocation location. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<UInt32>} puPublicKeyLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszPublicKey</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszPublicKey</i> buffer.
     * @param {Pointer<Char>} wszPublicKey A pointer to a null-terminated Unicode string that receives the optional public key to identify a revocation list outside the content's chain of trust. The size of this buffer is specified by the <i>puPublicKeyLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puPublicKeyLength</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetrevocationpoint
     */
    static DRMGetRevocationPoint(hIssuanceLicense, puIdLength, wszId, puIdTypeLength, wszIdType, puURLLength, wszRL, pstFrequency, puNameLength, wszName, puPublicKeyLength, wszPublicKey) {
        wszId := wszId is String? StrPtr(wszId) : wszId
        wszIdType := wszIdType is String? StrPtr(wszIdType) : wszIdType
        wszRL := wszRL is String? StrPtr(wszRL) : wszRL
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszPublicKey := wszPublicKey is String? StrPtr(wszPublicKey) : wszPublicKey

        result := DllCall("msdrm.dll\DRMGetRevocationPoint", "uint", hIssuanceLicense, "uint*", puIdLength, "ptr", wszId, "uint*", puIdTypeLength, "ptr", wszIdType, "uint*", puURLLength, "ptr", wszRL, "ptr", pstFrequency, "uint*", puNameLength, "ptr", wszName, "uint*", puPublicKeyLength, "ptr", wszPublicKey, "int")
        return result
    }

    /**
     * Gets a usage policy that requires, or denies, access to content based on application name, version, or other application characteristics.
     * @remarks
     * Usage policies specify requirements or prohibitions for a client attempting to access content. For instance, a policy may specify that the file can only be opened with version 6.0 or higher of an application, or cannot be opened by another specific application. This function only returns data in parameters that apply to the usage policy type specified by <i>peUsagePolicyType</i>; values that are not applicable to the specified usage policy will not be returned, and buffers will not be required. However, an application can set an unlimited number of policies, so you can implement separate name, digest, and public key policies.
     * 
     * If version information is included, the consuming application must have version information or it will not be able to access the content.
     * 
     * Currently, comparison is a case-sensitive, character-by-character string comparison, so the values "6" and "6.0" are considered different. Because of this, an application must use a consistent format when setting and comparing values.
     * @param {Integer} hIssuanceLicense The handle of the issuance license that the usage policy is contained in.
     * @param {Integer} uIndex The zero-based index of the policy to retrieve.
     * @param {Pointer<Int32>} peUsagePolicyType A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type">DRM_USAGEPOLICY_TYPE</a> value that receives one of the <b>DRM_USAGEPOLICY_TYPE</b> values that specifies the type of usage policy (name, public key, and so on). If a usage policy of type <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> is chosen, then application versions between, and including, the minimum and maximum versions specified in  <i>wszMinVersion</i> and <i>wszMaxVersion</i>, respectively, will be included or excluded.
     * @param {Pointer<Int32>} pfExclusion A pointer to a <b>BOOL</b> value that receives a value the specifies whether the policy is an exclusion policy. <b>TRUE</b> indicates that the application is prohibited from exercising the rights. <b>FALSE</b> indicates that the application is required to exercise the rights.
     * @param {Pointer<UInt32>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {Pointer<Char>} wszName A pointer to a null-terminated Unicode string that receives the name of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<UInt32>} puMinVersionLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszMinVersion</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszMinVersion</i> buffer.
     * @param {Pointer<Char>} wszMinVersion A pointer to a null-terminated Unicode string that receives the minimum version of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puMinVersionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puMinVersionLength</i> value.
     * 
     * This will be a version string in a form similar to "1.0.1" or "1.00.0000".
     * @param {Pointer<UInt32>} puMaxVersionLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszMaxVersion</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszMaxVersion</i> buffer.
     * @param {Pointer<Char>} wszMaxVersion A pointer to a null-terminated Unicode string that receives the maximum version of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puMaxVersionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puMaxVersionLength</i> value.
     * 
     * This will be a version string in a form similar to "1.0.1" or "1.00.0000".
     * @param {Pointer<UInt32>} puPublicKeyLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszPublicKey</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszPublicKey</i> buffer.
     * @param {Pointer<Char>} wszPublicKey A pointer to a null-terminated Unicode string that receives the public key used to sign the digest of the application required to exercise or prohibited from exercising rights. The key is a well-formed XrML node. The size of this buffer is specified by the <i>puPublicKeyLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puPublicKeyLength</i> value.
     * @param {Pointer<UInt32>} puDigestAlgorithmLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszDigestAlgorithm</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDigestAlgorithm</i> buffer.
     * @param {Pointer<Char>} wszDigestAlgorithm A pointer to a null-terminated Unicode string that receives the algorithm used to create the application digest that was specified in <i>pbDigest</i>. The size of this buffer is specified by the <i>puDigestAlgorithmLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDigestAlgorithmLength</i> value.
     * @param {Pointer<UInt32>} pcbDigest A pointer to a <b>UINT</b> value that, on entry, contains the length, in bytes, of the <i>pbDigest</i> buffer.
     * 
     * After the function returns, this value contains the number of bytes copied to the <i>pbDigest</i> buffer.
     * @param {Pointer<Byte>} pbDigest A pointer to a buffer that receives the application digest that is required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>pcbDigest</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in bytes, in the <i>pcbDigest</i> value.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetusagepolicy
     */
    static DRMGetUsagePolicy(hIssuanceLicense, uIndex, peUsagePolicyType, pfExclusion, puNameLength, wszName, puMinVersionLength, wszMinVersion, puMaxVersionLength, wszMaxVersion, puPublicKeyLength, wszPublicKey, puDigestAlgorithmLength, wszDigestAlgorithm, pcbDigest, pbDigest) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszMinVersion := wszMinVersion is String? StrPtr(wszMinVersion) : wszMinVersion
        wszMaxVersion := wszMaxVersion is String? StrPtr(wszMaxVersion) : wszMaxVersion
        wszPublicKey := wszPublicKey is String? StrPtr(wszPublicKey) : wszPublicKey
        wszDigestAlgorithm := wszDigestAlgorithm is String? StrPtr(wszDigestAlgorithm) : wszDigestAlgorithm

        result := DllCall("msdrm.dll\DRMGetUsagePolicy", "uint", hIssuanceLicense, "uint", uIndex, "int*", peUsagePolicyType, "int*", pfExclusion, "uint*", puNameLength, "ptr", wszName, "uint*", puMinVersionLength, "ptr", wszMinVersion, "uint*", puMaxVersionLength, "ptr", wszMaxVersion, "uint*", puPublicKeyLength, "ptr", wszPublicKey, "uint*", puDigestAlgorithmLength, "ptr", wszDigestAlgorithm, "uint*", pcbDigest, "char*", pbDigest, "int")
        return result
    }

    /**
     * Retrieves a language specific name and description from an issuance license.
     * @remarks
     * <div class="alert"><b>Note</b>  If, when you enumerate through the Name/Description pairs for locales, you are unable to find the Name/Description pair corresponding with your locale (using the locale ID), you can use the LCID of 0, which is the  default value. Take note that an LCID of 0  can be set only for templates and licenses created programmatically on the client. AD RMS server administration does not support setting a default language for Name and Description. For more information about creating an issuance license programmatically, see   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-issuance-license">Creating an Issuance License</a>.</div>
     * <div> </div>
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the information from.
     * @param {Integer} uIndex The zero-based index of the name and description pair to retrieve.
     * @param {Pointer<UInt32>} pulcid A pointer to a <b>UINT</b> that receives the locale ID of the name and description pair.
     * @param {Pointer<UInt32>} puNameLength A pointer to a <b>UINT</b> that, on input, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {Pointer<Char>} wszName A pointer to a null-terminated Unicode string that receives the name. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> parameter.
     * @param {Pointer<UInt32>} puDescriptionLength A pointer to a <b>UINT</b> that, on input, contains the length, in characters, of the <i>wszDescription</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszDescription</i> buffer.
     * @param {Pointer<Char>} wszDescription A pointer to a null-terminated Unicode string that receives the description. The size of this buffer is specified by the <i>puDescriptionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDescriptionLength</i> parameter.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetnameanddescription
     */
    static DRMGetNameAndDescription(hIssuanceLicense, uIndex, pulcid, puNameLength, wszName, puDescriptionLength, wszDescription) {
        wszName := wszName is String? StrPtr(wszName) : wszName
        wszDescription := wszDescription is String? StrPtr(wszDescription) : wszDescription

        result := DllCall("msdrm.dll\DRMGetNameAndDescription", "uint", hIssuanceLicense, "uint", uIndex, "uint*", pulcid, "uint*", puNameLength, "ptr", wszName, "uint*", puDescriptionLength, "ptr", wszDescription, "int")
        return result
    }

    /**
     * Retrieves an owner license created by calling the DRMGetSignedIssuanceLicense.
     * @remarks
     * An owner license is an end-user license that contains the OWNER right and allows the user to exercise all rights regardless of whether they are specifically granted. It is created by the AD RMS client when you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a> and sign an issuance license offline.  If <b>DRMGetSignedIssuanceLicense</b> is called with the <i>uFlags</i> parameter set to <b>DRM_OWNER_LICENSE_NOPERSIST</b>, the owner license is saved in memory. Otherwise, it is saved in the license store. The <b>DRMGetOwnerLicense</b> function automatically retrieves the license from either location.
     * @param {Integer} hIssuanceLicense A handle to a signed issuance license.
     * @param {Pointer<UInt32>} puOwnerLicenseLength An unsigned integer that contains the length, in characters, of the owner license retrieved by this function. The terminating null character is included in the length.
     * @param {Pointer<Char>} wszOwnerLicense A null-terminated string that contains the owner license in XrML format. For example XrML owner license, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/owner-license-xml-example">Owner License XML Example</a>.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetownerlicense
     */
    static DRMGetOwnerLicense(hIssuanceLicense, puOwnerLicenseLength, wszOwnerLicense) {
        wszOwnerLicense := wszOwnerLicense is String? StrPtr(wszOwnerLicense) : wszOwnerLicense

        result := DllCall("msdrm.dll\DRMGetOwnerLicense", "uint", hIssuanceLicense, "uint*", puOwnerLicenseLength, "ptr", wszOwnerLicense, "int")
        return result
    }

    /**
     * Retrieves the number of days from issuance that can pass before an end�user license must be renewed.
     * @param {Integer} hIssuanceLicense The handle of the issuance license from which the interval time can be retrieved.
     * @param {Pointer<UInt32>} pcDays A pointer to a <b>UINT</b> that specifies the interval period, in days. For example, if the value is  30, the end–user license must be renewed within 30 days of the day  it was issued.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmgetintervaltime
     */
    static DRMGetIntervalTime(hIssuanceLicense, pcDays) {
        result := DllCall("msdrm.dll\DRMGetIntervalTime", "uint", hIssuanceLicense, "uint*", pcDays, "int")
        return result
    }

    /**
     * Repairs a client machine by deleting certificates previously created for the machine or user.
     * @remarks
     * The <b>DRMRepair</b> function first determines whether the machine is activated. If the machine activation is not valid, then the <b>DRMRepair</b> function will restore the machine to a clean state by deleting the machine certificate, rights account certificate, and client licensor certificate of the  currently logged on user.
     * 
     * If the machine activation is valid but the rights account certificate is not valid, then the <b>DRMRepair</b> function will delete the rights account certificate and client licensor certificate of the  currently logged on user.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmrepair
     */
    static DRMRepair() {
        result := DllCall("msdrm.dll\DRMRepair", "int")
        return result
    }

    /**
     * Registers a window in the protected environment.
     * @remarks
     * If the process ID does not equal the ID of the thread that created the window, the function fails. Also, if the visibility state of the window is not <b>WS_VISIBLE</b>, the function fails.
     * @param {Integer} hEnv A handle to the secure environment.
     * @param {Pointer<Void>} hwnd A handle to the window to be registered.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmregisterprotectedwindow
     * @since windows6.0.6000
     */
    static DRMRegisterProtectedWindow(hEnv, hwnd) {
        result := DllCall("msdrm.dll\DRMRegisterProtectedWindow", "uint", hEnv, "ptr", hwnd, "int")
        return result
    }

    /**
     * Indicates whether a window is associated with a protected environment.
     * @param {Pointer<Void>} hwnd The window handle.
     * @param {Pointer<Int32>} pfProtected A pointer to a <b>BOOL</b> that indicates whether the window is associated with a protected environment.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmiswindowprotected
     * @since windows6.0.6000
     */
    static DRMIsWindowProtected(hwnd, pfProtected) {
        result := DllCall("msdrm.dll\DRMIsWindowProtected", "ptr", hwnd, "int*", pfProtected, "int")
        return result
    }

    /**
     * Asynchronously retrieves issuance license templates from a server.
     * @remarks
     * The <b>DRMAcquireIssuanceLicenseTemplate</b> function is asynchronous. It returns immediately with a value of S_OK or an error code. To cancel a request in process, 
     *  call the function  with <b>DRM_AILT_CANCEL</b> specified for the <i>uFlags</i> parameter. To determine the result of the template retrieval operation, you must examine the <i>hr</i> parameter in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-issuance-license-template">DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE</a> message that AD RMS sends to your callback function.
     * 
     * The template collection is saved in the template store of the local AD RMS store. Each template is stored in a file with the format TMP-<i>HashValue</i>-<i>TemplateGUID</i> where the hash value is a base64-encoded SHA-1 hash of server public key. You can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> function to enumerate the templates.
     * 
     * If properly configured, AD RMS clients can automatically obtain templates from the AD RMS server by using a WMI job in the task scheduler. Therefore, if WMI distribution is enabled, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> to enumerate the rights policy templates from the local template store. Applications should avoid calling <b>DRMAcquireIssuanceLicenseTemplate</b> because the WMI job automatically copies templates to the client computer. However, <b>DRMAcquireIssuanceLicenseTemplate</b> can be used to retrieve templates from multiple servers, functionality not supported by the WMI job. You can also use it to retrieve templates if your application relies on a server lockbox. The WMI job is only available to applications that use a client lockbox.
     * @param {Integer} hClient A handle to a client session. The handle is obtained by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. When you call  <b>DRMCreateClientSession</b>, you must specify a callback function that AD RMS can use to return the result of an operation. A string that contains the templates  is sent to the callback function in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-issuance-license-template">DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE</a> message.
     * @param {Integer} uFlags Specifies options for the function call. This parameter can be a combination of one or more of the following flags.
     * @param {Pointer<Void>} pvReserved Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Integer} cTemplates Reserved for future use. This value must be zero.
     * @param {Pointer<Char>} pwszTemplateIds Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<Char>} wszUrl A null-terminated Unicode string that contains the template acquisition URL. You can retrieve this value by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> and setting the <i>uServiceType</i> parameter to <b>DRM_SERVICE_TYPE_CLIENTLICENSOR</b>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is returned in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {Integer} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/msdrm/nf-msdrm-drmacquireissuancelicensetemplate
     * @since windows6.0.6000
     */
    static DRMAcquireIssuanceLicenseTemplate(hClient, uFlags, pvReserved, cTemplates, pwszTemplateIds, wszUrl, pvContext) {
        wszUrl := wszUrl is String? StrPtr(wszUrl) : wszUrl

        result := DllCall("msdrm.dll\DRMAcquireIssuanceLicenseTemplate", "uint", hClient, "uint", uFlags, "ptr", pvReserved, "uint", cTemplates, "ptr", pwszTemplateIds, "ptr", wszUrl, "ptr", pvContext, "int")
        return result
    }

;@endregion Methods
}
