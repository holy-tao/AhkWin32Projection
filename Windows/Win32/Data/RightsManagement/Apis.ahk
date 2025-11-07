#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * @param {Integer} eGlobalOptions A value of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drmglobaloptions">DRMGLOBALOPTIONS</a> enumeration that specifies the option to set.
     * 
     * Only one option can be specified in each call to <b>DRMSetGlobalOptions</b>. For example, if both WinHTTP and the server lockbox are required, you must call <b>DRMSetGlobalOptions</b> twice, once with <i>eGlobalOptions</i> set to <b>DRMGLOBALOPTIONS_USE_WINHTTP</b> and once with <i>eGlobalOptions</i> set to <b>DRMGLOBALOPTIONS_USE_SERVERSECURITYPROCESSOR</b>.
     * @param {Pointer<Void>} pvdata A pointer to a <b>void</b> value. This parameter is not currently used.
     * @param {Integer} dwlen The size, in bytes, of the <i>pvdata</i> buffer. This parameter is not currently used.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetglobaloptions
     */
    static DRMSetGlobalOptions(eGlobalOptions, pvdata, dwlen) {
        pvdataMarshal := pvdata is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMSetGlobalOptions", "int", eGlobalOptions, pvdataMarshal, pvdata, "uint", dwlen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the version number of the Active Directory Rights Management Services client software and whether the hierarchy is for Production or Pre-production purposes.
     * @param {Pointer<DRM_CLIENT_VERSION_INFO>} pDRMClientVersionInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drm_client_version_info">DRM_CLIENT_VERSION_INFO</a> structure that receives the version number of the Active Directory Rights Management Services client software and the hierarchy information, such as Production or Pre-production.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetclientversion
     */
    static DRMGetClientVersion(pDRMClientVersionInfo) {
        result := DllCall("msdrm.dll\DRMGetClientVersion", "ptr", pDRMClientVersionInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a secure environment for all rights management calls.
     * @param {Integer} eSecurityProviderType Specifies the type of security provider to use.
     * @param {Integer} eSpecification Specifies which security provider to use.
     * @param {PWSTR} wszSecurityProvider The file name and ID of the security provider. A security provider can be a file on the computer (the 
     *       lockbox) or a hardware device that holds the secure machine key. The path to this key is obtained by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsecurityprovider">DRMGetSecurityProvider</a>.
     * @param {PWSTR} wszManifestCredentials A signed XrML structure that specifies conditions on the environment. For information about making a 
     *       manifest, see 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-application-manifest">Creating an Application Manifest</a>.
     * @param {PWSTR} wszMachineCredentials The machine certificate.
     * @param {Pointer<Integer>} phEnv A pointer to an environment handle. Close the handle by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a>.
     * @param {Pointer<Integer>} phDefaultLibrary A pointer to the handle of the library used to create the principal object. You must close this handle 
     *       before closing the environment handle. For more information, see the Remarks section. Close by calling 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. 
     *        Possible values include, but are not limited to, those in the following list. For a list of common error codes, 
     *        see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drminitenvironment
     */
    static DRMInitEnvironment(eSecurityProviderType, eSpecification, wszSecurityProvider, wszManifestCredentials, wszMachineCredentials, phEnv, phDefaultLibrary) {
        wszSecurityProvider := wszSecurityProvider is String ? StrPtr(wszSecurityProvider) : wszSecurityProvider
        wszManifestCredentials := wszManifestCredentials is String ? StrPtr(wszManifestCredentials) : wszManifestCredentials
        wszMachineCredentials := wszMachineCredentials is String ? StrPtr(wszMachineCredentials) : wszMachineCredentials

        phEnvMarshal := phEnv is VarRef ? "uint*" : "ptr"
        phDefaultLibraryMarshal := phDefaultLibrary is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMInitEnvironment", "int", eSecurityProviderType, "int", eSpecification, "ptr", wszSecurityProvider, "ptr", wszManifestCredentials, "ptr", wszMachineCredentials, phEnvMarshal, phEnv, phDefaultLibraryMarshal, phDefaultLibrary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Loads a handle to an approved library, as determined by the credentials.
     * @param {Integer} hEnv A handle to an environment, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Integer} eSpecification The library provider type.
     * @param {PWSTR} wszLibraryProvider Name and optional path to the DLL. Every DLL must have a unique name. If similarly named DLLs are loaded, even if they are in different paths, only the first item will be included in the manifest and checked.
     * @param {PWSTR} wszCredentials Reserved, must be <b>NULL</b>. The DLL that is loaded must be referenced in the application manifest loaded by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<Integer>} phLibrary A handle to the library.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmloadlibrary
     */
    static DRMLoadLibrary(hEnv, eSpecification, wszLibraryProvider, wszCredentials, phLibrary) {
        wszLibraryProvider := wszLibraryProvider is String ? StrPtr(wszLibraryProvider) : wszLibraryProvider
        wszCredentials := wszCredentials is String ? StrPtr(wszCredentials) : wszCredentials

        phLibraryMarshal := phLibrary is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMLoadLibrary", "uint", hEnv, "int", eSpecification, "ptr", wszLibraryProvider, "ptr", wszCredentials, phLibraryMarshal, phLibrary, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an enabling principal needed to bind to a license.
     * @param {Integer} hEnv A handle to an environment created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Integer} hLibrary A handle to a library. Currently, the only valid library that can be used is the one passed out by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {PWSTR} wszObject A pointer to a null-terminated Unicode string that specifies the enabling principal type. An application can use the object constants specified in Msdrmgetinfo.h.
     * @param {Pointer<DRMID>} pidPrincipal A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmid">DRMID</a> structure that identifies the enabling principal. The <b>DRMID</b> members can be <b>NULL</b> to use the first principal in a license.
     * @param {PWSTR} wszCredentials A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> of the current user.
     * @param {Pointer<Integer>} phEnablingPrincipal A pointer to a <b>DRMHANDLE</b> value that receives the created principal. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateenablingprincipal
     */
    static DRMCreateEnablingPrincipal(hEnv, hLibrary, wszObject, pidPrincipal, wszCredentials, phEnablingPrincipal) {
        wszObject := wszObject is String ? StrPtr(wszObject) : wszObject
        wszCredentials := wszCredentials is String ? StrPtr(wszCredentials) : wszCredentials

        phEnablingPrincipalMarshal := phEnablingPrincipal is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateEnablingPrincipal", "uint", hEnv, "uint", hLibrary, "ptr", wszObject, "ptr", pidPrincipal, "ptr", wszCredentials, phEnablingPrincipalMarshal, phEnablingPrincipal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes handles to objects created with DRMCreate* functions and libraries loaded by using DRMLoadLibrary.
     * @param {Integer} handle A handle to close.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmclosehandle
     */
    static DRMCloseHandle(handle) {
        result := DllCall("msdrm.dll\DRMCloseHandle", "uint", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes an environment handle.
     * @param {Integer} hEnv A handle to an environment.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcloseenvironmenthandle
     */
    static DRMCloseEnvironmentHandle(hEnv) {
        result := DllCall("msdrm.dll\DRMCloseEnvironmentHandle", "uint", hEnv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a copy of a DRMHANDLE.
     * @param {Integer} hToCopy A handle to copy.
     * @param {Pointer<Integer>} phCopy A copy of the handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmduplicatehandle
     */
    static DRMDuplicateHandle(hToCopy, phCopy) {
        phCopyMarshal := phCopy is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMDuplicateHandle", "uint", hToCopy, phCopyMarshal, phCopy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a copy of an environment handle.
     * @param {Integer} hToCopy A handle to copy. An environment handle is created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {Pointer<Integer>} phCopy A copy of the handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcloseenvironmenthandle">DRMCloseEnvironmentHandle</a> to close.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmduplicateenvironmenthandle
     */
    static DRMDuplicateEnvironmentHandle(hToCopy, phCopy) {
        phCopyMarshal := phCopy is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMDuplicateEnvironmentHandle", "uint", hToCopy, phCopyMarshal, phCopy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a rights revocation list on the client.
     * @param {Integer} hEnv A handle to an environment, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {PWSTR} wszRevocationList Revocation list as a null-terminated string.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmregisterrevocationlist
     */
    static DRMRegisterRevocationList(hEnv, wszRevocationList) {
        wszRevocationList := wszRevocationList is String ? StrPtr(wszRevocationList) : wszRevocationList

        result := DllCall("msdrm.dll\DRMRegisterRevocationList", "uint", hEnv, "ptr", wszRevocationList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns S_OK for any level of the security check being run.
     * @param {Integer} hEnv A handle to an environment.
     * @param {Integer} cLevel Level of the security check to run, from 1 to 10, with 10 being the most secure but most resource-intensive.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmchecksecurity
     */
    static DRMCheckSecurity(hEnv, cLevel) {
        result := DllCall("msdrm.dll\DRMCheckSecurity", "uint", hEnv, "uint", cLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Informs the Active Directory Rights Management Services (AD RMS) client that an AD RMS-protected document is being or is no longer being displayed.
     * @param {BOOL} fRegister Pass <b>TRUE</b> when you open an AD RMS-protected document. Pass <b>FALSE</b> when you close that document.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmregistercontent
     */
    static DRMRegisterContent(fRegister) {
        result := DllCall("msdrm.dll\DRMRegisterContent", "int", fRegister, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encrypts data.
     * @param {Integer} hCryptoProvider A handle to an AD RMS encrypting object created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsencryptor">DRMCreateEnablingBitsEncryptor</a> function.
     * @param {Integer} iPosition Position in the buffer at which to start encrypting. <b>0</b> corresponds to the first block in a buffer, <b>1</b> corresponds to the second block, and so on. 
     * 
     * <div class="alert"><b>Note</b>  If you use the <b>AES</b> key when you sign the issuance license, <i>iPosition</i> can always be set to 0.</div>
     * <div> </div>
     * @param {Integer} cNumInBytes The number of bytes to encrypt.
     * @param {Pointer<Integer>} pbInData A pointer to a buffer that contains the bytes to encrypt.
     * @param {Pointer<Integer>} pcNumOutBytes The number of encrypted bytes.
     * @param {Pointer<Integer>} pbOutData A pointer to the encrypted bytes.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmencrypt
     */
    static DRMEncrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData) {
        pbInDataMarshal := pbInData is VarRef ? "char*" : "ptr"
        pcNumOutBytesMarshal := pcNumOutBytes is VarRef ? "uint*" : "ptr"
        pbOutDataMarshal := pbOutData is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMEncrypt", "uint", hCryptoProvider, "uint", iPosition, "uint", cNumInBytes, pbInDataMarshal, pbInData, pcNumOutBytesMarshal, pcNumOutBytes, pbOutDataMarshal, pbOutData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decrypts encrypted content.
     * @param {Integer} hCryptoProvider A handle to an AD RMS decrypting object created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingbitsdecryptor">DRMCreateEnablingBitsDecryptor</a>.
     * @param {Integer} iPosition Position in the buffer at which to start decrypting. <b>0</b> corresponds to the first block in a buffer, <b>1</b> corresponds to the second block, and so on. See the example later in this topic.
     * @param {Integer} cNumInBytes Number of bytes to decrypt.
     * @param {Pointer<Integer>} pbInData Pointer to a buffer that contains the bytes to decrypt.
     * @param {Pointer<Integer>} pcNumOutBytes Size, in bytes,  of the decrypted data.
     * @param {Pointer<Integer>} pbOutData Decrypted data.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmdecrypt
     */
    static DRMDecrypt(hCryptoProvider, iPosition, cNumInBytes, pbInData, pcNumOutBytes, pbOutData) {
        pbInDataMarshal := pbInData is VarRef ? "char*" : "ptr"
        pcNumOutBytesMarshal := pcNumOutBytes is VarRef ? "uint*" : "ptr"
        pbOutDataMarshal := pbOutData is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMDecrypt", "uint", hCryptoProvider, "uint", iPosition, "uint", cNumInBytes, pbInDataMarshal, pbInData, pcNumOutBytesMarshal, pcNumOutBytes, pbOutDataMarshal, pbOutData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows an application to examine or exercise the rights on a locally stored license.
     * @param {Integer} hEnv A handle to an environment; the handle is created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Pointer<DRMBOUNDLICENSEPARAMS>} pParams A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams">DRMBOUNDLICENSEPARAMS</a> structure that specifies additional options; for more information, see the Remarks section. The principal specified here is the one the application will try to bind to. If you pass in <b>NULL</b> to identify the principal or rights group, the first principal or rights group in the license will be used.
     * @param {PWSTR} wszLicenseChain A pointer to a null-terminated Unicode string that contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a> (or license chain).
     * @param {Pointer<Integer>} phBoundLicense A pointer to a handle that receives the bound license. The <b>DRMHANDLE</b> passed back through <i>phBoundLicense</i> allows an application to navigate through all the license's objects (such as principals or rights) and attributes (such as maximum play count). A bound license consolidates duplicated rights information in the license and removes any rights information that is not available to the current user.
     * @param {Pointer<Integer>} phErrorLog This parameter must be <b>NULL</b>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateboundlicense
     */
    static DRMCreateBoundLicense(hEnv, pParams, wszLicenseChain, phBoundLicense, phErrorLog) {
        wszLicenseChain := wszLicenseChain is String ? StrPtr(wszLicenseChain) : wszLicenseChain

        phBoundLicenseMarshal := phBoundLicense is VarRef ? "uint*" : "ptr"
        phErrorLogMarshal := phErrorLog is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateBoundLicense", "uint", hEnv, "ptr", pParams, "ptr", wszLicenseChain, phBoundLicenseMarshal, phBoundLicense, phErrorLogMarshal, phErrorLog, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a decryption object that is used to decrypt content data.
     * @param {Integer} hBoundLicense A handle to a bound license object created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszRight An optional null-terminated string that contains the right to exercise. A decrypting object can be bound to only one right at a time.
     * @param {Integer} hAuxLib Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {PWSTR} wszAuxPlug Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<Integer>} phDecryptor A pointer to the decrypting object.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateenablingbitsdecryptor
     */
    static DRMCreateEnablingBitsDecryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phDecryptor) {
        wszRight := wszRight is String ? StrPtr(wszRight) : wszRight
        wszAuxPlug := wszAuxPlug is String ? StrPtr(wszAuxPlug) : wszAuxPlug

        phDecryptorMarshal := phDecryptor is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateEnablingBitsDecryptor", "uint", hBoundLicense, "ptr", wszRight, "uint", hAuxLib, "ptr", wszAuxPlug, phDecryptorMarshal, phDecryptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an AD RMS encrypting object that is used to encrypt content data.
     * @param {Integer} hBoundLicense A handle to a bound license, produced by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszRight Optional null-terminated string containing a right. If you specify <b>NULL</b>, the AD RMS encrypting object binds to the first valid right in the license.
     * @param {Integer} hAuxLib Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {PWSTR} wszAuxPlug Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Pointer<Integer>} phEncryptor A pointer to the encrypting object.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateenablingbitsencryptor
     */
    static DRMCreateEnablingBitsEncryptor(hBoundLicense, wszRight, hAuxLib, wszAuxPlug, phEncryptor) {
        wszRight := wszRight is String ? StrPtr(wszRight) : wszRight
        wszAuxPlug := wszAuxPlug is String ? StrPtr(wszAuxPlug) : wszAuxPlug

        phEncryptorMarshal := phEncryptor is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateEnablingBitsEncryptor", "uint", hBoundLicense, "ptr", wszRight, "uint", hAuxLib, "ptr", wszAuxPlug, phEncryptorMarshal, phEncryptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The DRMAttest function is no longer supported and returns E_NOTIMPL.
     * @param {Integer} hEnablingPrincipal A handle to an enabling principal object created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a>.
     * @param {PWSTR} wszData The data to encode.
     * @param {Integer} eType An enumeration that determines whether to include full environment data or only a hash.
     * @param {Pointer<Integer>} pcAttestedBlob Length, in characters, of the string being returned, plus one for a terminating null character.
     * @param {PWSTR} wszAttestedBlob The signed data.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmattest
     */
    static DRMAttest(hEnablingPrincipal, wszData, eType, pcAttestedBlob, wszAttestedBlob) {
        wszData := wszData is String ? StrPtr(wszData) : wszData
        wszAttestedBlob := wszAttestedBlob is String ? StrPtr(wszAttestedBlob) : wszAttestedBlob

        pcAttestedBlobMarshal := pcAttestedBlob is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMAttest", "uint", hEnablingPrincipal, "ptr", wszData, "int", eType, pcAttestedBlobMarshal, pcAttestedBlob, "ptr", wszAttestedBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Requests a secure time from the rights management system.
     * @param {Integer} hEnv Environment handle.
     * @param {Integer} eTimerIdType The type of time returned.
     * @param {Pointer<SYSTEMTIME>} poTimeObject Pointer to a time structure.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgettime
     */
    static DRMGetTime(hEnv, eTimerIdType, poTimeObject) {
        result := DllCall("msdrm.dll\DRMGetTime", "uint", hEnv, "int", eTimerIdType, "ptr", poTimeObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves information about encrypting or decrypting objects.
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
     * @param {PWSTR} wszAttribute The attribute of the handle to query for. The supported attributes are <b>g_wszQUERY_BLOCKSIZE</b>, to determine the block size, and <b>g_wszQUERY_SYMMETRICKEY_TYPE</b>, to determine whether the cipher mode is AES ECB or AES CBC 4K. 
     * 
     * <div class="alert"><b>Note</b>  You can use <b>g_wszQUERY_SYMMETRICKEY_TYPE</b> only in Windows 7. It is not available for earlier versions of AD RMS.</div>
     * <div> </div>
     * @param {Pointer<Integer>} peEncoding Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drmencodingtype">DRMENCODINGTYPE</a> enumeration that identifies the type of encoding to be applied to the information retrieved.
     * @param {Pointer<Integer>} pcBuffer A pointer to a <b>UINT</b> value that, on input, contains the size of the buffer pointed to by the <i>pbBuffer</i> parameter. The size of the buffer is expressed as the number of Unicode characters, including the terminating null character. On output, the value contains the number of characters copied to the buffer. The number copied includes the terminating null character.
     * @param {Pointer<Integer>} pbBuffer A pointer to a null-terminated Unicode string that receives the value associated with the attribute specified by the <i>wszAttribute</i> parameter. The size of this buffer is specified by the <i>pcBuffer</i> parameter. The size is expressed as the number of Unicode characters, including the terminating null character.
     * 
     * <div class="alert"><b>Important</b>  If the publishing license was signed using the <b>AES_CBC4K</b> value, and the <i>wszAttribute</i> parameter is specified as <b>g_wszQUERY_BLOCKSIZE</b>, <i>pbBuffer</i> returns a value of <b>4096</b>.</div>
     * <div> </div>
     * <div class="alert"><b>Important</b>  If <i>wszAttribute</i> is specified as <b>g_wszQUERY_SYMMETRICKEY_TYPE</b>, possible values for <i>pbBuffer</i> include <b>AES</b> for ECB encryption and <b>AES_CBC4K</b> for CBC encryption.</div>
     * <div> </div>
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetinfo
     */
    static DRMGetInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String ? StrPtr(wszAttribute) : wszAttribute

        peEncodingMarshal := peEncoding is VarRef ? "int*" : "ptr"
        pcBufferMarshal := pcBuffer is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetInfo", "uint", handle, "ptr", wszAttribute, peEncodingMarshal, peEncoding, pcBufferMarshal, pcBuffer, pbBufferMarshal, pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns information about a secure environment.
     * @param {Integer} handle Environment handle.
     * @param {PWSTR} wszAttribute The attribute to query for. In Rights Management Services client 1.0 SP1, the only supported attribute is <b>g_wszQUERY_BLOCKSIZE</b>. In Rights Management Services client 1.0, the attributes that can be queried are listed in the header file Msdrmgetinfo.h. Attributes include <b>g_wszQUERY_MANIFESTSOURCE</b> and <b>g_wszQUERY_APIVERSION</b>.
     * @param {Pointer<Integer>} peEncoding Encoding type used.
     * @param {Pointer<Integer>} pcBuffer A pointer to a UINT value that, on input, contains the size of the buffer pointed to by the <i>pbBuffer</i> parameter. The size of the buffer is expressed as the number of Unicode characters, including the terminating null character. On output, the value contains the number of characters copied to the buffer. The number copied includes the terminating null character.
     * @param {Pointer<Integer>} pbBuffer A pointer to a null-terminated Unicode string that receives the value associated with the attribute specified by the <i>wszAttribute</i> parameter. The size of this buffer is specified by the <i>pcBuffer</i> parameter. The size is expressed as the number of Unicode characters, including the terminating null character.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetenvironmentinfo
     */
    static DRMGetEnvironmentInfo(handle, wszAttribute, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String ? StrPtr(wszAttribute) : wszAttribute

        peEncodingMarshal := peEncoding is VarRef ? "int*" : "ptr"
        pcBufferMarshal := pcBuffer is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetEnvironmentInfo", "uint", handle, "ptr", wszAttribute, peEncodingMarshal, peEncoding, pcBufferMarshal, pcBuffer, pbBufferMarshal, pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the address of a function in a library. It is the secure version of the GetProcAddress function.
     * @param {Integer} hLibrary A handle to the library where the function resides. Output from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmloadlibrary">DRMLoadLibrary</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a>.
     * @param {PWSTR} wszProcName The name of the function to find the address of.
     * @param {Pointer<Pointer<FARPROC>>} ppfnProcAddress Address of the procedure to run.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetprocaddress
     */
    static DRMGetProcAddress(hLibrary, wszProcName, ppfnProcAddress) {
        wszProcName := wszProcName is String ? StrPtr(wszProcName) : wszProcName

        ppfnProcAddressMarshal := ppfnProcAddress is VarRef ? "ptr*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetProcAddress", "uint", hLibrary, "ptr", wszProcName, ppfnProcAddressMarshal, ppfnProcAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of occurrences of an object within a specified branch of a license.
     * @param {Integer} hQueryRoot A handle to the branch of the license to query, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Pointer<Integer>} pcSubObjects Number of objects of this type within this branch.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetboundlicenseobjectcount
     */
    static DRMGetBoundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects) {
        wszSubObjectType := wszSubObjectType is String ? StrPtr(wszSubObjectType) : wszSubObjectType

        pcSubObjectsMarshal := pcSubObjects is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetBoundLicenseObjectCount", "uint", hQueryRoot, "ptr", wszSubObjectType, pcSubObjectsMarshal, pcSubObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns an object from a bound license.
     * @param {Integer} hQueryRoot A handle to a license or license object, from a previous call to this function or from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Integer} iWhich Zero-based index specifying which occurrence to retrieve.
     * @param {Pointer<Integer>} phSubObject A handle to the returned license object. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetboundlicenseobject
     */
    static DRMGetBoundLicenseObject(hQueryRoot, wszSubObjectType, iWhich, phSubObject) {
        wszSubObjectType := wszSubObjectType is String ? StrPtr(wszSubObjectType) : wszSubObjectType

        phSubObjectMarshal := phSubObject is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetBoundLicenseObject", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint", iWhich, phSubObjectMarshal, phSubObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of occurrences of an attribute in a license.
     * @param {Integer} hQueryRoot A handle to a license or license object, from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetboundlicenseobject">DRMGetBoundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszAttribute Name of the attribute to count.
     * @param {Pointer<Integer>} pcAttributes Count of attribute occurrences.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetboundlicenseattributecount
     */
    static DRMGetBoundLicenseAttributeCount(hQueryRoot, wszAttribute, pcAttributes) {
        wszAttribute := wszAttribute is String ? StrPtr(wszAttribute) : wszAttribute

        pcAttributesMarshal := pcAttributes is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetBoundLicenseAttributeCount", "uint", hQueryRoot, "ptr", wszAttribute, pcAttributesMarshal, pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a bound license attribute from the license XrML.
     * @param {Integer} hQueryRoot A handle to a root query object, from a previous call to this function or from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>.
     * @param {PWSTR} wszAttribute The attribute to retrieve.
     * @param {Integer} iWhich Zero-based index of the occurrence to retrieve.
     * @param {Pointer<Integer>} peEncoding Encoding type used.
     * @param {Pointer<Integer>} pcBuffer Size, in characters, of the attribute retrieved plus one for a terminating null character.
     * @param {Pointer<Integer>} pbBuffer Pointer to the attribute object.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetboundlicenseattribute
     */
    static DRMGetBoundLicenseAttribute(hQueryRoot, wszAttribute, iWhich, peEncoding, pcBuffer, pbBuffer) {
        wszAttribute := wszAttribute is String ? StrPtr(wszAttribute) : wszAttribute

        peEncodingMarshal := peEncoding is VarRef ? "int*" : "ptr"
        pcBufferMarshal := pcBuffer is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetBoundLicenseAttribute", "uint", hQueryRoot, "ptr", wszAttribute, "uint", iWhich, peEncodingMarshal, peEncoding, pcBufferMarshal, pcBuffer, pbBufferMarshal, pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a client session, which hosts license storage sessions and is used in activation and other function calls.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to an application-defined callback function that will receive asynchronous function status messages in response to other AD RMS functions, such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a>. The format of this callback function is defined in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>. This parameter cannot be <b>NULL</b>.
     * @param {Integer} uCallbackVersion Specifies the version of the callback function. Currently, only version zero is supported.
     * @param {PWSTR} wszGroupIDProviderType 
     * @param {PWSTR} wszGroupID A pointer to a null-terminated Unicode string that contains an email address for the user in the format <i>someone@example.com</i>. Typically, this value already exists in Active Directory (AD) and is the same ID as that supplied in the logon credentials. If it is not the same, later calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmisactivated">DRMIsActivated</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> will fail. For more information, see Remarks.
     * 
     * Set this parameter to  <b>NULL</b> if you intend only to use the client session handle created by this function to retrieve a service location by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a>.
     * @param {Pointer<Integer>} phClient A pointer to a <b>DRMHSESSION</b> value that receives the client session handle. When you have finished using the client session, close it by passing this handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateclientsession
     */
    static DRMCreateClientSession(pfnCallback, uCallbackVersion, wszGroupIDProviderType, wszGroupID, phClient) {
        wszGroupIDProviderType := wszGroupIDProviderType is String ? StrPtr(wszGroupIDProviderType) : wszGroupIDProviderType
        wszGroupID := wszGroupID is String ? StrPtr(wszGroupID) : wszGroupID

        phClientMarshal := phClient is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateClientSession", "ptr", pfnCallback, "uint", uCallbackVersion, "ptr", wszGroupIDProviderType, "ptr", wszGroupID, phClientMarshal, phClient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates whether the current user or machine is activated.
     * @param {Integer} hClient A handle to a client session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer<DRM_ACTSERV_INFO>} pActServInfo This parameter is reserved and must be set to <b>NULL</b>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmisactivated
     */
    static DRMIsActivated(hClient, uFlags, pActServInfo) {
        result := DllCall("msdrm.dll\DRMIsActivated", "uint", hClient, "uint", uFlags, "ptr", pActServInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains a lockbox and machine certificate for a machine or a rights account certificate for a user.
     * @param {Integer} hClient A handle to a client session, created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>.
     * @param {Integer} uFlags Specifies the type of activation wanted, plus additional options; for more information, see Remarks. This parameter can be a combination of one or more of the following flags.
     * @param {Integer} uLangID The language ID used by the application. If this parameter is set to zero, the default language ID for the logged-on user is used.
     * @param {Pointer<DRM_ACTSERV_INFO>} pActServInfo Optional server information. If the client has not been configured to use Active Directory Federation Services (ADFS) with AD RMS, you can pass <b>NULL</b> to use the Windows Live ID service for service discovery. If the client has been configured to use ADFS, you must pass the Windows Live certification URL. <!-- Currently, the Windows Live ID certification service URL is https://certification.isv.drm.microsoft.com/certification/certification.asmx.--> For more information about service discovery, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {HWND} hParentWnd Parent window handle used in nonsilent Windows Live ID activation (user activation only). In nonsilent activation, a Windows Live ID window opens to request user information. This parameter allows the application to assign an arbitrary window as the window's parent. If this parameter is <b>NULL</b>, the active window is used.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmactivate
     */
    static DRMActivate(hClient, uFlags, uLangID, pActServInfo, pvContext, hParentWnd) {
        hParentWnd := hParentWnd is Win32Handle ? NumGet(hParentWnd, "ptr") : hParentWnd

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMActivate", "uint", hClient, "uint", uFlags, "uint", uLangID, "ptr", pActServInfo, pvContextMarshal, pvContext, "ptr", hParentWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the URL of a server that can perform various rights management services, such as activation or license acquisition.
     * @param {Integer} hClient A handle to a client session. The handle can be obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. The handle is optional and can be <b>NULL</b>.
     * @param {Integer} uServiceType 
     * @param {Integer} uServiceLocation 
     * @param {PWSTR} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains a signed issuance license. This parameter can be <b>NULL</b>. For more information, see Remarks.
     * @param {Pointer<Integer>} puServiceURLLength A pointer to a <b>UINT</b> that, on input, contains the size, in characters, of the <i>wszServiceURL</i> buffer. This value includes the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszServiceURL</i> buffer.
     * 
     * If <i>wszServiceURL</i> is <b>NULL</b>, this <b>UINT</b> receives the number of characters, including the terminating null character, that are required for the server URL.
     * @param {PWSTR} wszServiceURL A pointer to a Unicode string buffer that receives the URL of the server. The <i>puServiceURLLength</i> parameter contains the size, in characters, including the terminating null character, of this buffer.
     * 
     * If this parameter is <b>NULL</b>, <i>puServiceURLLength</i> receives the number of characters, including the terminating null character, that are required for the server URL.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetservicelocation
     */
    static DRMGetServiceLocation(hClient, uServiceType, uServiceLocation, wszIssuanceLicense, puServiceURLLength, wszServiceURL) {
        wszIssuanceLicense := wszIssuanceLicense is String ? StrPtr(wszIssuanceLicense) : wszIssuanceLicense
        wszServiceURL := wszServiceURL is String ? StrPtr(wszServiceURL) : wszServiceURL

        puServiceURLLengthMarshal := puServiceURLLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetServiceLocation", "uint", hClient, "uint", uServiceType, "uint", uServiceLocation, "ptr", wszIssuanceLicense, puServiceURLLengthMarshal, puServiceURLLength, "ptr", wszServiceURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a license storage session, which is needed to acquire or manipulate a license.
     * @param {Integer} hEnv A handle to the AD RMS environment. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Integer} hDefaultLibrary A handle to the default library. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function.
     * @param {Integer} hClient A handle to a client session. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {Integer} uFlags This parameter is reserved and must be set to zero.
     * @param {PWSTR} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains a signed issuance license. The created license storage session is associated with this issuance license.
     * @param {Pointer<Integer>} phLicenseStorage A pointer to a handle that receives the license storage session handle. This handle must be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> function when the license storage session is no longer needed.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreatelicensestoragesession
     */
    static DRMCreateLicenseStorageSession(hEnv, hDefaultLibrary, hClient, uFlags, wszIssuanceLicense, phLicenseStorage) {
        wszIssuanceLicense := wszIssuanceLicense is String ? StrPtr(wszIssuanceLicense) : wszIssuanceLicense

        phLicenseStorageMarshal := phLicenseStorage is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateLicenseStorageSession", "uint", hEnv, "uint", hDefaultLibrary, "uint", hClient, "uint", uFlags, "ptr", wszIssuanceLicense, phLicenseStorageMarshal, phLicenseStorage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds an end-user license to the temporary or permanent license store.
     * @param {Integer} hLicenseStorage A handle to a license storage session, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a>.
     * @param {Integer} uFlags 
     * @param {PWSTR} wszLicense A pointer to null-terminated string that contains the end-user license chain to add to the temporary or permanent license store.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmaddlicense
     */
    static DRMAddLicense(hLicenseStorage, uFlags, wszLicense) {
        wszLicense := wszLicense is String ? StrPtr(wszLicense) : wszLicense

        result := DllCall("msdrm.dll\DRMAddLicense", "uint", hLicenseStorage, "uint", uFlags, "ptr", wszLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves revocation lists required by a submitted license.
     * @param {Integer} hLicenseStorage A handle to a license storage session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function.
     * @param {PWSTR} wszLicense A pointer to a null-terminated Unicode string that contains the license that requires a revocation list. This can be any license or certificate (or certificate chain or concatenated licenses) that supports revocation lists, including <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user licenses</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificates</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/c-gly">client licensor certificates</a>.
     * @param {PWSTR} wszURL A pointer to a null-terminated Unicode string that contains an additional URL to query for advisories. This will be checked in addition to any URLs mentioned in the license passed in. This parameter can be set to <b>NULL</b>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmacquireadvisories
     */
    static DRMAcquireAdvisories(hLicenseStorage, wszLicense, wszURL, pvContext) {
        wszLicense := wszLicense is String ? StrPtr(wszLicense) : wszLicense
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMAcquireAdvisories", "uint", hLicenseStorage, "ptr", wszLicense, "ptr", wszURL, pvContextMarshal, pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enumerates valid licenses, machine certificates or rights account certificates, revocation lists for the current user, or issuance license templates.
     * @param {Integer} hSession A handle to a client or license storage session. The type of session passed into <i>hSession</i> depends on the type of item to enumerate. To enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user licenses</a>, use a license storage session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. To enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/m-gly">machine certificates</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificates</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/c-gly">client licensor certificates</a>, or issuance license templates, use a client session created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. Use either type of handle to enumerate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">revocation lists</a>.
     * @param {Integer} uFlags 
     * @param {Integer} uIndex The index number of the certificate or license to retrieve. To begin an enumeration, pass in zero for this parameter. To obtain subsequent licenses, increment this value until the function returns <b>E_DRM_NO_MORE_DATA</b>. For more information, see Remarks.
     * @param {Pointer<BOOL>} pfSharedFlag A pointer to a <b>BOOL</b> value that receives one (1) if the retrieved license is shared or zero (0) if the retrieved license is not shared.
     * @param {Pointer<Integer>} puCertificateDataLen A pointer to a UINT value that, on entry, contains the size of the <i>wszCertificateData</i> buffer. This size includes the terminating null character. After the function returns, this value contains the number of characters copied to the buffer, including the terminating null character.
     * 
     * To obtain the necessary size of the buffer, pass <b>NULL</b> for <i>wszCertificateData</i>. The required number of characters, including the terminating null character, will be placed in this value.
     * @param {PWSTR} wszCertificateData A pointer to  a null-terminated Unicode string that receives the license, ID, or template depending on which flags were 
     * set.
     * 
     * To obtain the necessary size of this buffer, pass <b>NULL</b> for <i>wszCertificateData</i>. The required number of characters, including the terminating null character, will be placed in <i>puCertificateDataLen</i>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmenumeratelicense
     */
    static DRMEnumerateLicense(hSession, uFlags, uIndex, pfSharedFlag, puCertificateDataLen, wszCertificateData) {
        wszCertificateData := wszCertificateData is String ? StrPtr(wszCertificateData) : wszCertificateData

        pfSharedFlagMarshal := pfSharedFlag is VarRef ? "int*" : "ptr"
        puCertificateDataLenMarshal := puCertificateDataLen is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMEnumerateLicense", "uint", hSession, "uint", uFlags, "uint", uIndex, pfSharedFlagMarshal, pfSharedFlag, puCertificateDataLenMarshal, puCertificateDataLen, "ptr", wszCertificateData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Attempts to acquire an end-user license or client licensor certificate asynchronously.
     * @param {Integer} hSession A handle to a client or license storage session.
     * 
     * A client session handle is obtained by using the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. In this case, 
     *        a client licensor certificate is acquired. The application callback function specified in the <b>DRMCreateClientSession</b> function will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-clientlicensor">DRM_MSG_ACQUIRE_CLIENTLICENSOR</a> message to provide status feedback.
     * 
     * A license storage session handle is obtained by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. In this case, an end-user license is acquired. The application callback function specified in the client session passed in the <i>hClient</i> parameter of the  <b>DRMCreateLicenseStorageSession</b> function will be called with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-license">DRM_MSG_ACQUIRE_LICENSE</a> message to provide status feedback.
     * @param {Integer} uFlags Specifies options for the function call. This parameter can be zero or a combination of one or more of the following flags.
     * @param {PWSTR} wszGroupIdentityCredential An optional <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a> (RAC). If this is not used, this function will check the license store for a RAC that matches the license used to create <i>hSession</i>. If none is found, this function will fail.
     * @param {PWSTR} wszRequestedRights This parameter is reserved and must be <b>NULL</b>.
     * @param {PWSTR} wszCustomData Optional application-specific data that might be required for a license. This must be a valid XML string. After returning control to the caller, this function creates a license request by using the application-specific data specified here.
     * @param {PWSTR} wszURL A license acquisition URL. This parameter is required when a client licensor certificate is being acquired and optional when an end-user license is being acquired. The URL can be used for both silent and nonsilent license acquisition. When present, this URL overrides the URL specified in the license that was used to create the license storage session passed into <i>hSession</i>.
     * 
     * A license may hold multiple license acquisition URLs, but only the first is used by default. To use any of the other URLs specified, you must parse the license. For more information, see the Remarks section.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmacquirelicense
     */
    static DRMAcquireLicense(hSession, uFlags, wszGroupIdentityCredential, wszRequestedRights, wszCustomData, wszURL, pvContext) {
        wszGroupIdentityCredential := wszGroupIdentityCredential is String ? StrPtr(wszGroupIdentityCredential) : wszGroupIdentityCredential
        wszRequestedRights := wszRequestedRights is String ? StrPtr(wszRequestedRights) : wszRequestedRights
        wszCustomData := wszCustomData is String ? StrPtr(wszCustomData) : wszCustomData
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMAcquireLicense", "uint", hSession, "uint", uFlags, "ptr", wszGroupIdentityCredential, "ptr", wszRequestedRights, "ptr", wszCustomData, "ptr", wszURL, pvContextMarshal, pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Deletes a license, client licensor certificate, revocation list, or issuance license template.
     * @param {Integer} hSession A handle to a license storage session or client session. You can use a  storage session handle to delete end-user licenses and revocation lists. You can use a client session handle to delete end-user licenses, rights account certificates,  client licensor certificates, and issuance license templates.
     * 
     * You can retrieve a handle to a license storage session by using   the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreatelicensestoragesession">DRMCreateLicenseStorageSession</a> function. You can retrieve a handle to a client session by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function.
     * @param {PWSTR} wszLicenseId A pointer to a null-terminated string that contains the ID of the license or template to be deleted. The license ID can be found inside the <b>ID</b> element of the license XrML, by querying using the license querying functions and the <b>g_wszQUERY_CONTENTIDVALUE</b> constant. The template ID is a GUID. You can enumerate the GUIDs by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmenumeratelicense">DRMEnumerateLicense</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmdeletelicense
     */
    static DRMDeleteLicense(hSession, wszLicenseId) {
        wszLicenseId := wszLicenseId is String ? StrPtr(wszLicenseId) : wszLicenseId

        result := DllCall("msdrm.dll\DRMDeleteLicense", "uint", hSession, "ptr", wszLicenseId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a client session or a license storage session.
     * @param {Integer} hSession A handle to the session to be closed.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmclosesession
     */
    static DRMCloseSession(hSession) {
        result := DllCall("msdrm.dll\DRMCloseSession", "uint", hSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Duplicates a client or license storage session.
     * @param {Integer} hSessionIn A handle to a session to duplicate.
     * @param {Pointer<Integer>} phSessionOut Pointer to the duplicated session handle. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosesession">DRMCloseSession</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmduplicatesession
     */
    static DRMDuplicateSession(hSessionIn, phSessionOut) {
        phSessionOutMarshal := phSessionOut is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMDuplicateSession", "uint", hSessionIn, phSessionOutMarshal, phSessionOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the path to a lockbox.
     * @param {Integer} uFlags Reserved.
     * @param {Pointer<Integer>} puTypeLen On input, length of the allocated <i>wszType</i> buffer. On output, actual length, in characters, plus one for a null terminator, of the value returned by <i>wszType</i>.
     * @param {PWSTR} wszType Type of security provider (such as "filename").
     * @param {Pointer<Integer>} puPathLen On input, length of the allocated <i>wszPath</i> buffer. On output, actual length, in characters, plus one for a null terminator, of the value returned by <i>wszPath</i>.
     * @param {PWSTR} wszPath Path to the lockbox.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetsecurityprovider
     */
    static DRMGetSecurityProvider(uFlags, puTypeLen, wszType, puPathLen, wszPath) {
        wszType := wszType is String ? StrPtr(wszType) : wszType
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath

        puTypeLenMarshal := puTypeLen is VarRef ? "uint*" : "ptr"
        puPathLenMarshal := puPathLen is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetSecurityProvider", "uint", uFlags, puTypeLenMarshal, puTypeLen, "ptr", wszType, puPathLenMarshal, puPathLen, "ptr", wszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Encodes data using a public encoding method, such as base64.
     * @param {PWSTR} wszAlgID The encoding algorithm. Currently the only valid value is "base64".
     * @param {Integer} uDataLen Length of the input data, in bytes.
     * @param {Pointer<Integer>} pbDecodedData Pointer to the data to encode.
     * @param {Pointer<Integer>} puEncodedStringLen Length of the output data, in bytes.
     * @param {PWSTR} wszEncodedString The encoded string.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmencode
     */
    static DRMEncode(wszAlgID, uDataLen, pbDecodedData, puEncodedStringLen, wszEncodedString) {
        wszAlgID := wszAlgID is String ? StrPtr(wszAlgID) : wszAlgID
        wszEncodedString := wszEncodedString is String ? StrPtr(wszEncodedString) : wszEncodedString

        pbDecodedDataMarshal := pbDecodedData is VarRef ? "char*" : "ptr"
        puEncodedStringLenMarshal := puEncodedStringLen is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMEncode", "ptr", wszAlgID, "uint", uDataLen, pbDecodedDataMarshal, pbDecodedData, puEncodedStringLenMarshal, puEncodedStringLen, "ptr", wszEncodedString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Decodes a string encoded with a common algorithm, such as base64.
     * @param {PWSTR} wszAlgID The encoding algorithm name. Currently "base64" is the only valid value.
     * @param {PWSTR} wszEncodedString The encoded string.
     * @param {Pointer<Integer>} puDecodedDataLen The length of the decoded string, in characters, plus one for a null terminator.
     * @param {Pointer<Integer>} pbDecodedData Pointer to the decoded data.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmdecode
     */
    static DRMDecode(wszAlgID, wszEncodedString, puDecodedDataLen, pbDecodedData) {
        wszAlgID := wszAlgID is String ? StrPtr(wszAlgID) : wszAlgID
        wszEncodedString := wszEncodedString is String ? StrPtr(wszEncodedString) : wszEncodedString

        puDecodedDataLenMarshal := puDecodedDataLen is VarRef ? "uint*" : "ptr"
        pbDecodedDataMarshal := pbDecodedData is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMDecode", "ptr", wszAlgID, "ptr", wszEncodedString, puDecodedDataLenMarshal, puDecodedDataLen, pbDecodedDataMarshal, pbDecodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Builds a certificate chain from an arbitrary number of certificates.
     * @param {Integer} cCertificates The number of certificates in the <i>rgwszCertificates</i> array.
     * @param {Pointer<PWSTR>} rgwszCertificates An array of null-terminated Unicode string pointers that contain the certificates to construct the chain from. The number of elements in this array is specified by the <i>cCertificates</i> parameter.
     * @param {Pointer<Integer>} pcChain A pointer to a <b>UINT</b> that, on input, contains the size, in Unicode characters, of the  <i>wszChain</i> string. This character count must include the terminating null character.
     * 
     * On output, this <b>UINT</b> receives the number of Unicode characters copied into the buffer, including the terminating null character.
     * @param {PWSTR} wszChain A pointer to a null-terminated Unicode string that receives the constructed chain.
     * 
     * To determine the required size for this buffer, call this function with <b>NULL</b> for the <i>wszChain</i> parameter. The required number of Unicode characters, including the terminating null character, will be returned in the <i>pcChain</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmconstructcertificatechain
     */
    static DRMConstructCertificateChain(cCertificates, rgwszCertificates, pcChain, wszChain) {
        wszChain := wszChain is String ? StrPtr(wszChain) : wszChain

        rgwszCertificatesMarshal := rgwszCertificates is VarRef ? "ptr*" : "ptr"
        pcChainMarshal := pcChain is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMConstructCertificateChain", "uint", cCertificates, rgwszCertificatesMarshal, rgwszCertificates, pcChainMarshal, pcChain, "ptr", wszChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a handle to an unbound license, to allow an application to navigate its objects and attributes.
     * @param {PWSTR} wszCertificate The leaf certificate on the license to be examined, in plain text (not encoded).
     * @param {Pointer<Integer>} phQueryRoot Pointer to a handle to the root object of the license. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosequeryhandle">DRMCloseQueryHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmparseunboundlicense
     */
    static DRMParseUnboundLicense(wszCertificate, phQueryRoot) {
        wszCertificate := wszCertificate is String ? StrPtr(wszCertificate) : wszCertificate

        phQueryRootMarshal := phQueryRoot is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMParseUnboundLicense", "ptr", wszCertificate, phQueryRootMarshal, phQueryRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a handle to an unbound license object.
     * @param {Integer} hQuery A handle to an object in an unbound license.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmclosequeryhandle
     */
    static DRMCloseQueryHandle(hQuery) {
        result := DllCall("msdrm.dll\DRMCloseQueryHandle", "uint", hQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Counts the instances of an object within a specified branch of the license.
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {PWSTR} wszSubObjectType The type of XrML object to find. For more information, see Remarks.
     * @param {Pointer<Integer>} pcSubObjects Count of object instances one level down within the specified branch.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetunboundlicenseobjectcount
     */
    static DRMGetUnboundLicenseObjectCount(hQueryRoot, wszSubObjectType, pcSubObjects) {
        wszSubObjectType := wszSubObjectType is String ? StrPtr(wszSubObjectType) : wszSubObjectType

        pcSubObjectsMarshal := pcSubObjects is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseObjectCount", "uint", hQueryRoot, "ptr", wszSubObjectType, pcSubObjectsMarshal, pcSubObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an object of a specified type in an unbound license.
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created using <b>DRMGetUnboundLicenseObject</b> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {PWSTR} wszSubObjectType Name of the object to find.
     * @param {Integer} iIndex Zero-based index indicating which instance to retrieve, if more than one exists.
     * @param {Pointer<Integer>} phSubQuery The retrieved object. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosehandle">DRMCloseHandle</a> to close the  handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetunboundlicenseobject
     */
    static DRMGetUnboundLicenseObject(hQueryRoot, wszSubObjectType, iIndex, phSubQuery) {
        wszSubObjectType := wszSubObjectType is String ? StrPtr(wszSubObjectType) : wszSubObjectType

        phSubQueryMarshal := phSubQuery is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseObject", "uint", hQueryRoot, "ptr", wszSubObjectType, "uint", iIndex, phSubQueryMarshal, phSubQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of occurrences of an attribute within an object in an unbound license.
     * @param {Integer} hQueryRoot A handle to a license or an object in the license, created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {PWSTR} wszAttributeType Name of the attribute to retrieve.
     * @param {Pointer<Integer>} pcAttributes Count of attribute occurrences one level down within the specified branch.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetunboundlicenseattributecount
     */
    static DRMGetUnboundLicenseAttributeCount(hQueryRoot, wszAttributeType, pcAttributes) {
        wszAttributeType := wszAttributeType is String ? StrPtr(wszAttributeType) : wszAttributeType

        pcAttributesMarshal := pcAttributes is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseAttributeCount", "uint", hQueryRoot, "ptr", wszAttributeType, pcAttributesMarshal, pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an unbound license attribute from the underlying XrML.
     * @param {Integer} hQueryRoot A handle to a license or object in the license, created by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetunboundlicenseobject">DRMGetUnboundLicenseObject</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmparseunboundlicense">DRMParseUnboundLicense</a>.
     * @param {PWSTR} wszAttributeType Name of the attribute to retrieve.
     * @param {Integer} iWhich Zero-based index of the attribute to retrieve.
     * @param {Pointer<Integer>} peEncoding An enumeration value specifying the encoding type of the return value.
     * @param {Pointer<Integer>} pcBuffer Size of the returned data, in characters, plus one for a null terminator.
     * @param {Pointer<Integer>} pbBuffer Attribute value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetunboundlicenseattribute
     */
    static DRMGetUnboundLicenseAttribute(hQueryRoot, wszAttributeType, iWhich, peEncoding, pcBuffer, pbBuffer) {
        wszAttributeType := wszAttributeType is String ? StrPtr(wszAttributeType) : wszAttributeType

        peEncodingMarshal := peEncoding is VarRef ? "int*" : "ptr"
        pcBufferMarshal := pcBuffer is VarRef ? "uint*" : "ptr"
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUnboundLicenseAttribute", "uint", hQueryRoot, "ptr", wszAttributeType, "uint", iWhich, peEncodingMarshal, peEncoding, pcBufferMarshal, pcBuffer, pbBufferMarshal, pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of certificates in a certificate chain.
     * @param {PWSTR} wszChain The chain to count.
     * @param {Pointer<Integer>} pcCertCount The number of certificates in the chain.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetcertificatechaincount
     */
    static DRMGetCertificateChainCount(wszChain, pcCertCount) {
        wszChain := wszChain is String ? StrPtr(wszChain) : wszChain

        pcCertCountMarshal := pcCertCount is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetCertificateChainCount", "ptr", wszChain, pcCertCountMarshal, pcCertCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specified certificate from a certificate chain.
     * @param {PWSTR} wszChain The certificate chain.
     * @param {Integer} iWhich A zero-based index specifying which certificate to retrieve.
     * @param {Pointer<Integer>} pcCert The length of the retrieved certificate, in characters, plus one for a null terminator.
     * @param {PWSTR} wszCert The certificate requested.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmdeconstructcertificatechain
     */
    static DRMDeconstructCertificateChain(wszChain, iWhich, pcCert, wszCert) {
        wszChain := wszChain is String ? StrPtr(wszChain) : wszChain
        wszCert := wszCert is String ? StrPtr(wszCert) : wszCert

        pcCertMarshal := pcCert is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMDeconstructCertificateChain", "ptr", wszChain, "uint", iWhich, pcCertMarshal, pcCert, "ptr", wszCert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * No longer supported and returns E_NOTIMPL.
     * @param {PWSTR} wszData The data to verify (original data).
     * @param {Pointer<Integer>} pcAttestedData Length, in characters, of the data to verify, plus one for a terminating null character.
     * @param {PWSTR} wszAttestedData The signed data.
     * @param {Pointer<Integer>} peType Whether full environment information,  or just a hash of the environment, is included.
     * @param {Pointer<Integer>} pcPrincipal Size, in characters, of the <i>wszPrincipalCredentials</i> parameter, plus one for a terminating null character.
     * @param {PWSTR} wszPrincipal Certificate chain of the principal attesting the data. This chain is needed to create the principal used to verify the data.
     * @param {Pointer<Integer>} pcManifest Size, in characters, of the manifest used to sign the data, plus one for a terminating null character. For information about making a manifest, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-an-application-manifest">Creating an Application Manifest</a>.
     * @param {PWSTR} wszManifest The manifest used to sign, as a null-terminated string.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmverify
     */
    static DRMVerify(wszData, pcAttestedData, wszAttestedData, peType, pcPrincipal, wszPrincipal, pcManifest, wszManifest) {
        wszData := wszData is String ? StrPtr(wszData) : wszData
        wszAttestedData := wszAttestedData is String ? StrPtr(wszAttestedData) : wszAttestedData
        wszPrincipal := wszPrincipal is String ? StrPtr(wszPrincipal) : wszPrincipal
        wszManifest := wszManifest is String ? StrPtr(wszManifest) : wszManifest

        pcAttestedDataMarshal := pcAttestedData is VarRef ? "uint*" : "ptr"
        peTypeMarshal := peType is VarRef ? "int*" : "ptr"
        pcPrincipalMarshal := pcPrincipal is VarRef ? "uint*" : "ptr"
        pcManifestMarshal := pcManifest is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMVerify", "ptr", wszData, pcAttestedDataMarshal, pcAttestedData, "ptr", wszAttestedData, peTypeMarshal, peType, pcPrincipalMarshal, pcPrincipal, "ptr", wszPrincipal, pcManifestMarshal, pcManifest, "ptr", wszManifest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a user that will be granted a right.
     * @param {PWSTR} wszUserName A null-terminated string that identifies a user or group of users (see Remarks). This parameter is often an 
     *        email address.  When the user created is passed in as <i>hOwner</i> to 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a>, this value is 
     *        attached to the Owner node in the license XrML. For more information about possible values for this parameter, 
     *        see the <i>wszUserIdType</i> parameter.
     * @param {PWSTR} wszUserId A null-terminated string that identifies a user that will be granted a right. This parameter can be a 
     *        Passport ID (PUID), Windows ID <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/s-gly">security ID</a> (SID), or 
     *        <b>NULL</b>. If this parameter is <b>NULL</b>, 
     *        <i>wszUserIdType</i> must contain "Unspecified". This ID is verified by the 
     *        Active Directory Rights Management Services system. For more information about possible values for this 
     *        parameter, see the <i>wszUserIdType</i> parameter.
     * @param {PWSTR} wszUserIdType 
     * @param {Pointer<Integer>} phUser A pointer to the handle of the created user. Call 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For 
     *        a list of common error codes, see 
     *        <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateuser
     */
    static DRMCreateUser(wszUserName, wszUserId, wszUserIdType, phUser) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszUserId := wszUserId is String ? StrPtr(wszUserId) : wszUserId
        wszUserIdType := wszUserIdType is String ? StrPtr(wszUserIdType) : wszUserIdType

        phUserMarshal := phUser is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateUser", "ptr", wszUserName, "ptr", wszUserId, "ptr", wszUserIdType, phUserMarshal, phUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an XrML right that will define a right granted to a user or group.
     * @param {PWSTR} wszRightName A pointer to a null-terminated Unicode string that contains the name of a user-defined or standard XrML (version 1.2) right. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/official-template-xrml">Official Template XrML</a>.
     * @param {Pointer<SYSTEMTIME>} pstFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time, in UTC time, when this right will become valid. For more information, see Remarks. Both <i>pstFrom</i> and <i>pstUntil</i> must be specified, or both must be <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the time, in UTC time, when this right will expire. For more information, see Remarks. Both <i>pstFrom</i> and <i>pstUntil</i> must be specified, or both must be <b>NULL</b>.
     * @param {Integer} cExtendedInfo The number of elements in the <i>pwszExtendedInfoName</i> and <i>pwszExtendedInfoValue</i> arrays. If this parameter is zero, then both the <i>pwszExtendedInfoName</i> and <i>pwszExtendedInfoValue</i> parameters must be <b>NULL</b>.
     * @param {Pointer<PWSTR>} pwszExtendedInfoName An array of null-terminated Unicode string pointers that contains the names of extended information data. Each name in this array must be unique. The <b>cExtendedInfo</b> parameter contains the number of elements in this array.
     * @param {Pointer<PWSTR>} pwszExtendedInfoValue An array of null-terminated Unicode string pointers that contains the values of the extended information items.  The <b>cExtendedInfo</b> parameter contains the number of elements in this array.
     * @param {Pointer<Integer>} phRight A pointer to a handle that receives the handle of the created right. This handle can be used with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmaddrightwithuser">DRMAddRightWithUser</a> function to bind the right to a user. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateright
     */
    static DRMCreateRight(wszRightName, pstFrom, pstUntil, cExtendedInfo, pwszExtendedInfoName, pwszExtendedInfoValue, phRight) {
        wszRightName := wszRightName is String ? StrPtr(wszRightName) : wszRightName

        pwszExtendedInfoNameMarshal := pwszExtendedInfoName is VarRef ? "ptr*" : "ptr"
        pwszExtendedInfoValueMarshal := pwszExtendedInfoValue is VarRef ? "ptr*" : "ptr"
        phRightMarshal := phRight is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateRight", "ptr", wszRightName, "ptr", pstFrom, "ptr", pstUntil, "uint", cExtendedInfo, pwszExtendedInfoNameMarshal, pwszExtendedInfoName, pwszExtendedInfoValueMarshal, pwszExtendedInfoValue, phRightMarshal, phRight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an issuance license from scratch, from a template, or from a signed issuance license.
     * @param {Pointer<SYSTEMTIME>} pstTimeFrom The starting UTC validity time for the license. If this value is <b>NULL</b>, the <i>pstTimeUntil</i> parameter must also be <b>NULL</b>. If both parameters are not <b>NULL</b>, <b>E_DRM_INVALID_TIMEINFO</b> is returned if the range time is logically inconsistent. For example, <i>pstTimeFrom</i> cannot be later than <i>pstTimeUntil</i>.
     * @param {Pointer<SYSTEMTIME>} pstTimeUntil The ending UTC validity time for the license. If this value is <b>NULL</b>, the <i>pstTimeFrom</i> parameter must also be <b>NULL</b>. If both parameters are not <b>NULL</b>, <b>E_DRM_INVALID_TIMEINFO</b> is returned if the range time is logically inconsistent. For example, <i>pstTimeFrom</i> cannot be later than <i>pstTimeUntil</i>.
     * @param {PWSTR} wszReferralInfoName Nonsilent license acquisition is not supported; set this parameter to <b>NULL</b>.
     * 
     * For Rights Management Services (RMS) client 1.0, this parameter is a pointer to a null-terminated Unicode string that contains the display name for the URL in <i>wszReferralInfoURL</i>. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} wszReferralInfoURL Nonsilent license acquisition is not supported; set this parameter to <b>NULL</b>.
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
     * @param {PWSTR} wszIssuanceLicense A pointer to a null-terminated Unicode string that contains an issuance license template or a signed issuance license. You can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetissuancelicensetemplate">DRMGetIssuanceLicenseTemplate</a> function to retrieve  a template. If this parameter is <b>NULL</b>,  an issuance license is created.
     * @param {Integer} hBoundLicense A handle to a bound license that contains the VIEWRIGHTSDATA, EDITRIGHTSDATA or OWNER right, which allows an application to reuse rights data or reuse the content key from a previous issuance license. This parameter is optional and can be <b>NULL</b>. For further information about rights, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/understanding-xrml-rights">Understanding XrML Rights</a>.
     * 
     * <div class="alert"><b>Note</b>  If your intent is to create a new issuance license, but you want to use the content key from the original signed issuance license, ensure that the <i>hBoundLicense</i> you pass in to <b>DRMCreateIssuanceLicense</b> is bound to either the OWNER or EDITRIGHTSDATA right. In a subsequent call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a>,  pass in the issuance license handle obtained from <b>DRMCreateIssuanceLicense</b> and  the DRM_REUSE_KEY flag in order to reuse the content key.</div>
     * <div> </div>
     * @param {Pointer<Integer>} phIssuanceLicense A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drmpubhandle">DRMPUBHANDLE</a> that receives the handle to the new issuance license.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmcreateissuancelicense
     */
    static DRMCreateIssuanceLicense(pstTimeFrom, pstTimeUntil, wszReferralInfoName, wszReferralInfoURL, hOwner, wszIssuanceLicense, hBoundLicense, phIssuanceLicense) {
        wszReferralInfoName := wszReferralInfoName is String ? StrPtr(wszReferralInfoName) : wszReferralInfoName
        wszReferralInfoURL := wszReferralInfoURL is String ? StrPtr(wszReferralInfoURL) : wszReferralInfoURL
        wszIssuanceLicense := wszIssuanceLicense is String ? StrPtr(wszIssuanceLicense) : wszIssuanceLicense

        phIssuanceLicenseMarshal := phIssuanceLicense is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMCreateIssuanceLicense", "ptr", pstTimeFrom, "ptr", pstTimeUntil, "ptr", wszReferralInfoName, "ptr", wszReferralInfoURL, "uint", hOwner, "ptr", wszIssuanceLicense, "uint", hBoundLicense, phIssuanceLicenseMarshal, phIssuanceLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Assigns a right to a user in an issuance license.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to add the right to. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} hRight The handle of the right to add to the issuance license. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateright">DRMCreateRight</a> function.
     * @param {Integer} hUser The handle of the user to apply the right to. This handle is obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateuser">DRMCreateUser</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmaddrightwithuser
     */
    static DRMAddRightWithUser(hIssuanceLicense, hRight, hUser) {
        result := DllCall("msdrm.dll\DRMAddRightWithUser", "uint", hIssuanceLicense, "uint", hRight, "uint", hUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Removes all rights from an existing issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to remove the rights from.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmclearallrights
     */
    static DRMClearAllRights(hIssuanceLicense) {
        result := DllCall("msdrm.dll\DRMClearAllRights", "uint", hIssuanceLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Adds application-specific metadata to an issuance license.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to which the metadata will be added.
     * @param {PWSTR} wszContentId A pointer to a null-terminated Unicode string that uniquely identifies an item of content. The string can contain up to 40 characters plus a terminating null character. We recommend that you use <b>CoCreateGUID</b> to create a GUID. For more information about content IDs, see Remarks.
     * @param {PWSTR} wszContentIdType A pointer to a null-terminated Unicode string that specifies the type of identifier represented by the <i>wszContentId</i> parameter. Possible examples include "MSGUID", "ISBN", "CatalogNumber", and any other that you consider appropriate.
     * @param {PWSTR} wszSKUId A pointer to a null-terminated Unicode string that contains an optional identifier. The string can contain up to 40 characters plus a terminating null character. The SKU ID is optional and allows for further content identification beyond that provided by the required content ID. If <i>wszSKUIdType</i> is specified, the <i>wszSKUId</i> parameter must be specified. Otherwise, it can be <b>NULL</b>.
     * @param {PWSTR} wszSKUIdType A pointer to a null-terminated Unicode string that contains the type of identifier represented by the <i>wszSKUId</i> parameter. If <i>wszSKUId</i> is specified, the <i>wszSKUIdType</i> parameter must be specified. Otherwise, it can be <b>NULL</b>.
     * @param {PWSTR} wszContentType A pointer to a null-terminated Unicode string that contains application-defined information about the content. Examples include "Financial Statement", "Source Code", "Office Document", and any other that you consider appropriate. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} wszContentName A pointer to a null-terminated Unicode string that contains a display name for the content. This parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetmetadata
     */
    static DRMSetMetaData(hIssuanceLicense, wszContentId, wszContentIdType, wszSKUId, wszSKUIdType, wszContentType, wszContentName) {
        wszContentId := wszContentId is String ? StrPtr(wszContentId) : wszContentId
        wszContentIdType := wszContentIdType is String ? StrPtr(wszContentIdType) : wszContentIdType
        wszSKUId := wszSKUId is String ? StrPtr(wszSKUId) : wszSKUId
        wszSKUIdType := wszSKUIdType is String ? StrPtr(wszSKUIdType) : wszSKUIdType
        wszContentType := wszContentType is String ? StrPtr(wszContentType) : wszContentType
        wszContentName := wszContentName is String ? StrPtr(wszContentName) : wszContentName

        result := DllCall("msdrm.dll\DRMSetMetaData", "uint", hIssuanceLicense, "ptr", wszContentId, "ptr", wszContentIdType, "ptr", wszSKUId, "ptr", wszSKUIdType, "ptr", wszContentType, "ptr", wszContentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a usage policy that requires or denies access to content based on application name, version, or other environment characteristics.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {Integer} eUsagePolicyType One of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type">DRM_USAGEPOLICY_TYPE</a> values that specifies the type of usage policy to be added or deleted. Only one type may be selected.
     * @param {BOOL} fDelete Determines whether the policy should be added or removed. <b>TRUE</b> indicates the policy should be deleted. <b>FALSE</b> indicates the policy should be added.
     * @param {BOOL} fExclusion Determines whether the application is prohibited from, or required to, exercise the rights. <b>FALSE</b> indicates that the application is required to exercise the rights. <b>TRUE</b> indicates that the application is prohibited from exercising the rights. You must specify <b>TRUE</b> if you set the <i>eUsagePolicyType</i> parameter to <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> or <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>.
     * @param {PWSTR} wszName A pointer to a null-terminated Unicode string that contains the name of the application. This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {PWSTR} wszMinVersion A pointer to a null-terminated Unicode string that contains the minimum version of the application that is required to or prohibited from exercising rights. This should be a version string in a form similar to "1.0.1" or "1.00.0000". This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> or <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {PWSTR} wszMaxVersion A pointer to a null-terminated Unicode string that contains the maximum version of the application that is required to or prohibited from exercising rights. This should be a version string in a form similar to "1.0.1" or "1.00.0000". This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> and optional when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b>. It is ignored for all other <i>eUsagePolicyType</i> values. If <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_OSEXCLUSION</b> and this parameter is specified, the version  must be greater than <i>wszMinVersion</i>.
     * @param {PWSTR} wszPublicKey A pointer to a null-terminated Unicode string that contains the public key used to sign the digest of the application required to or prohibited from exercising rights. This string must be a well-formed XrML node. This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYPUBLICKEY</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {PWSTR} wszDigestAlgorithm A pointer to a null-terminated Unicode string that contains the algorithm used to create the application digest that is specified by <i>pbDigest</i>.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Pointer<Integer>} pbDigest A pointer to an array of bytes that contains the application digest required or prohibited from exercising rights. The size of this array is contained in the <i>cbDigest</i> parameter.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @param {Integer} cbDigest The number of bytes in the <i>pbDigest</i> array.  This parameter is required when <i>eUsagePolicyType</i> contains <b>DRM_USAGEPOLICY_TYPE_BYDIGEST</b>. It is ignored for all other <i>eUsagePolicyType</i> values.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetusagepolicy
     */
    static DRMSetUsagePolicy(hIssuanceLicense, eUsagePolicyType, fDelete, fExclusion, wszName, wszMinVersion, wszMaxVersion, wszPublicKey, wszDigestAlgorithm, pbDigest, cbDigest) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszMinVersion := wszMinVersion is String ? StrPtr(wszMinVersion) : wszMinVersion
        wszMaxVersion := wszMaxVersion is String ? StrPtr(wszMaxVersion) : wszMaxVersion
        wszPublicKey := wszPublicKey is String ? StrPtr(wszPublicKey) : wszPublicKey
        wszDigestAlgorithm := wszDigestAlgorithm is String ? StrPtr(wszDigestAlgorithm) : wszDigestAlgorithm

        pbDigestMarshal := pbDigest is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMSetUsagePolicy", "uint", hIssuanceLicense, "int", eUsagePolicyType, "int", fDelete, "int", fExclusion, "ptr", wszName, "ptr", wszMinVersion, "ptr", wszMaxVersion, "ptr", wszPublicKey, "ptr", wszDigestAlgorithm, pbDigestMarshal, pbDigest, "uint", cbDigest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets a refresh rate and location to obtain a revocation list.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {BOOL} fDelete Flag indicating whether the existing item should be deleted:    <b>TRUE</b> indicates it should be deleted; <b>FALSE</b> indicates it should be added.
     * @param {PWSTR} wszId ID of the revocation authority posting the revocation list. This must match the ID given in the <b>ISSUER</b> node of the revocation list.
     * @param {PWSTR} wszIdType Type of ID used by <i>wszId</i>.
     * @param {PWSTR} wszURL URL of revocation file list.
     * @param {Pointer<SYSTEMTIME>} pstFrequency How often the list must be updated.
     * @param {PWSTR} wszName Optional human-readable name for a revocation list site.
     * @param {PWSTR} wszPublicKey Public key of key pair used to sign and verify the revocation list.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetrevocationpoint
     */
    static DRMSetRevocationPoint(hIssuanceLicense, fDelete, wszId, wszIdType, wszURL, pstFrequency, wszName, wszPublicKey) {
        wszId := wszId is String ? StrPtr(wszId) : wszId
        wszIdType := wszIdType is String ? StrPtr(wszIdType) : wszIdType
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszPublicKey := wszPublicKey is String ? StrPtr(wszPublicKey) : wszPublicKey

        result := DllCall("msdrm.dll\DRMSetRevocationPoint", "uint", hIssuanceLicense, "int", fDelete, "ptr", wszId, "ptr", wszIdType, "ptr", wszURL, "ptr", pstFrequency, "ptr", wszName, "ptr", wszPublicKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows an issuance license to store arbitrary name-value pairs for use by the content-consuming application.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {BOOL} fDelete A flag that indicates whether to add or delete this name-value pair.   <b>FALSE</b> indicates add; <b>TRUE</b> indicates delete.
     * @param {PWSTR} wszName The name of the data.
     * @param {PWSTR} wszValue The value of the data.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetapplicationspecificdata
     */
    static DRMSetApplicationSpecificData(hIssuanceLicense, fDelete, wszName, wszValue) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        result := DllCall("msdrm.dll\DRMSetApplicationSpecificData", "uint", hIssuanceLicense, "int", fDelete, "ptr", wszName, "ptr", wszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Allows an application to specify names and descriptions of the license in multiple (human) languages.
     * @param {Integer} hIssuanceLicense A handle to an issuance license.
     * @param {BOOL} fDelete Flag indicating whether the existing item should be deleted:  <b>TRUE</b> indicates it should be deleted; <b>FALSE</b> indicates it should be added.
     * @param {Integer} lcid A locale ID for this name and description. If <i>lcid</i> is given as <b>NULL</b> or zero, the name and description given become the default license name and description. There may be only one name and description for any LCID (locale identifier).
     * @param {PWSTR} wszName A license name, in the language specified by this locale.
     * @param {PWSTR} wszDescription An optional license description, in the language specified by this locale.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetnameanddescription
     */
    static DRMSetNameAndDescription(hIssuanceLicense, fDelete, lcid, wszName, wszDescription) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszDescription := wszDescription is String ? StrPtr(wszDescription) : wszDescription

        result := DllCall("msdrm.dll\DRMSetNameAndDescription", "uint", hIssuanceLicense, "int", fDelete, "uint", lcid, "ptr", wszName, "ptr", wszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Specifies the number of days from issuance that can pass before an end�user license must be renewed.
     * @param {Integer} hIssuanceLicense The handle of the issuance license in which to  set the interval time.
     * @param {Integer} cDays An unsigned integer  value that specifies the interval period, in days. For example, if you specify 30, the end–user license must be renewed within 30 days of the day  it was issued.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmsetintervaltime
     */
    static DRMSetIntervalTime(hIssuanceLicense, cDays) {
        result := DllCall("msdrm.dll\DRMSetIntervalTime", "uint", hIssuanceLicense, "uint", cDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains an issuance license template from an existing issuance license.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to create a template from.
     * @param {Pointer<Integer>} puIssuanceLicenseTemplateLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszIssuanceLicenseTemplate</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszIssuanceLicenseTemplate</i> buffer.
     * @param {PWSTR} wszIssuanceLicenseTemplate A pointer to a null-terminated Unicode string that receives the issuance license template XrML. The size of this buffer is specified by the <i>puIssuanceLicenseTemplateLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIssuanceLicenseTemplateLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetissuancelicensetemplate
     */
    static DRMGetIssuanceLicenseTemplate(hIssuanceLicense, puIssuanceLicenseTemplateLength, wszIssuanceLicenseTemplate) {
        wszIssuanceLicenseTemplate := wszIssuanceLicenseTemplate is String ? StrPtr(wszIssuanceLicenseTemplate) : wszIssuanceLicenseTemplate

        puIssuanceLicenseTemplateLengthMarshal := puIssuanceLicenseTemplateLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetIssuanceLicenseTemplate", "uint", hIssuanceLicense, puIssuanceLicenseTemplateLengthMarshal, puIssuanceLicenseTemplateLength, "ptr", wszIssuanceLicenseTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Acquires a signed issuance license online or offline, or produces an unsigned issuance license that can be signed later.
     * @param {Integer} hEnv A handle to a secure environment created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function. The handle is required for offline signing and optional for online signing. Applications that do not use a lockbox should pass <b>NULL</b> for this parameter.
     * @param {Integer} hIssuanceLicense A handle to an issuance license to sign, created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer<Integer>} pbSymKey The content key used to encrypt the document. If this value is <b>NULL</b>, the <i>uFlags</i> parameter must specify <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>. These <i>uFlags</i> values cause <i>pbSymKey</i> to be ignored.
     * @param {Integer} cbSymKey The size, in bytes, of the content key. Currently, this parameter can only be 16 unless the <i>uFlags</i> parameter specifies <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>, in which case this parameter can be zero.
     * @param {PWSTR} wszSymKeyType The key type. The value <b>AES</b> specifies the Advanced Encryption Standard (AES) algorithm with the  electronic code book (ECB) cipher mode. If you are using Windows 7, the value <b>AES_CBC4K</b> can be used to specify the AES algorithm with cipher-block chaining (CBC) cipher mode. See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmencrypt">DRMEncrypt</a> code examples for more information.
     * @param {PWSTR} wszClientLicensorCertificate A pointer to null-terminated Unicode string that contains a client licensor certificate obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a> function. If you are attempting online signing, this parameter should be <b>NULL</b>. If you are developing a server application that does not use a lockbox and  if you are using the <b>DRM_SERVER_ISSUANCELICENSE</b> flag in <i>uFlags</i>, pass in the server license certificate chain. The server licensor certificate chain can be retrieved by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/-getlicensorcertificate">GetLicensorCertificate</a> SOAP method; however, to make the chain usable, it must be reordered by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmconstructcertificatechain">DRMConstructCertificateChain</a> function.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to the callback function used to notify the application of an asynchronous request's progress. For the signature of the callback function you must provide, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {PWSTR} wszURL A pointer to a null-terminated Unicode string that contains the URL of an AD RMS licensing server that was obtained by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> function. This string takes the form "<i>ADRMSLicensingServerURL</i>/_wmcs/Licensing". This parameter value is required for online license requests; you can use <b>NULL</b> for offline license requests. This URL is entered in the signed issuance license as the default silent license acquisition URL, which is where an application will automatically go to acquire an end-user license if none is specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetsignedissuancelicense
     */
    static DRMGetSignedIssuanceLicense(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, wszClientLicensorCertificate, pfnCallback, wszURL, pvContext) {
        wszSymKeyType := wszSymKeyType is String ? StrPtr(wszSymKeyType) : wszSymKeyType
        wszClientLicensorCertificate := wszClientLicensorCertificate is String ? StrPtr(wszClientLicensorCertificate) : wszClientLicensorCertificate
        wszURL := wszURL is String ? StrPtr(wszURL) : wszURL

        pbSymKeyMarshal := pbSymKey is VarRef ? "char*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMGetSignedIssuanceLicense", "uint", hEnv, "uint", hIssuanceLicense, "uint", uFlags, pbSymKeyMarshal, pbSymKey, "uint", cbSymKey, "ptr", wszSymKeyType, "ptr", wszClientLicensorCertificate, "ptr", pfnCallback, "ptr", wszURL, pvContextMarshal, pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Acquires a signed issuance license offline.
     * @param {Integer} hEnv A handle to a secure environment created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drminitenvironment">DRMInitEnvironment</a> function. The handle is required for offline signing. Applications that do not use a lockbox should pass <b>NULL</b> for this parameter.
     * @param {Integer} hIssuanceLicense A handle to an issuance license to sign, created by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateissuancelicense">DRMCreateIssuanceLicense</a> function.
     * @param {Integer} uFlags 
     * @param {Pointer} pbSymKey The content key used to encrypt the document. If this value is <b>NULL</b>, the <i>uFlags</i> parameter must specify <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>. These <i>uFlags</i> values cause <i>pbSymKey</i> to be ignored.
     * @param {Integer} cbSymKey The size, in bytes, of the content key. Currently, this parameter can only be 16 unless the <i>uFlags</i> parameter specifies <b>DRM_AUTO_GENERATE_KEY</b> or <b>DRM_REUSE_KEY</b>, in which case this parameter can be zero.
     * @param {PWSTR} wszSymKeyType The key type. The value <b>AES</b> specifies the Advanced Encryption Standard (AES) algorithm with the  electronic code book (ECB) cipher mode. If you are using Windows 7, the value <b>AES_CBC4K</b> can be used to specify the AES algorithm with cipher-block chaining (CBC) cipher mode. See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmencrypt">DRMEncrypt</a> code examples for more information.
     * @param {Pointer<Void>} pvReserved Reserved for future use.
     * @param {Integer} hEnablingPrincipal A handle to an enabling principal in the end-user license that should be bound. Create this handle by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function by passing in the rights account certificate. This parameter is required.
     * @param {Integer} hBoundLicenseCLC A handle to the bound license corresponding to the client licensor certificate created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>. This can be created by binding the <i>wszClientLicensorCertificate</i> to the <b>ISSUE</b> right using the <i>hEnablingPrincipal</i> handle. This parameter is required.
     * @param {Pointer<DRMCALLBACK>} pfnCallback A pointer to the callback function used to notify the application of an asynchronous request's progress. For the signature of the callback function you must provide, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is sent in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-callback-function">Creating a Callback Function</a>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetsignedissuancelicenseex
     * @since windows6.1
     */
    static DRMGetSignedIssuanceLicenseEx(hEnv, hIssuanceLicense, uFlags, pbSymKey, cbSymKey, wszSymKeyType, pvReserved, hEnablingPrincipal, hBoundLicenseCLC, pfnCallback, pvContext) {
        wszSymKeyType := wszSymKeyType is String ? StrPtr(wszSymKeyType) : wszSymKeyType

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMGetSignedIssuanceLicenseEx", "uint", hEnv, "uint", hIssuanceLicense, "uint", uFlags, "ptr", pbSymKey, "uint", cbSymKey, "ptr", wszSymKeyType, pvReservedMarshal, pvReserved, "uint", hEnablingPrincipal, "uint", hBoundLicenseCLC, "ptr", pfnCallback, pvContextMarshal, pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a previously created DRMPUBHANDLE.
     * @param {Integer} hPub A handle to a publishing object.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmclosepubhandle
     */
    static DRMClosePubHandle(hPub) {
        result := DllCall("msdrm.dll\DRMClosePubHandle", "uint", hPub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Makes a copy of a DRMPUBHANDLE.
     * @param {Integer} hPubIn The <b>DRMPUBHANDLE</b> to make a copy of.
     * @param {Pointer<Integer>} phPubOut A pointer to a <b>DRMPUBHANDLE</b> value that receives the duplicate handle. When this handle is no longer needed, release it  by passing it to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> function.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmduplicatepubhandle
     */
    static DRMDuplicatePubHandle(hPubIn, phPubOut) {
        phPubOutMarshal := phPubOut is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMDuplicatePubHandle", "uint", hPubIn, phPubOutMarshal, phPubOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains information about a user.
     * @param {Integer} hUser The handle of the user to obtain information for.
     * @param {Pointer<Integer>} puUserNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserName</i> buffer.
     * @param {PWSTR} wszUserName A pointer to a null-terminated Unicode string that receives the user name as a fully qualified SMTP email address. This is not enforced or used to check identities; it is only included to provide a human-readable identification. The size of this buffer is specified by the <i>puUserNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserNameLength</i> value.
     * @param {Pointer<Integer>} puUserIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserId</i> buffer.
     * @param {PWSTR} wszUserId A pointer to a null-terminated Unicode string that receives the  user's ID. The size of this buffer is specified by the <i>puUserIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserIdLength</i> value.
     * @param {Pointer<Integer>} puUserIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszUserIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszUserIdType</i> buffer.
     * @param {PWSTR} wszUserIdType A pointer to a null-terminated Unicode string that receives the type of ID used to identify the user (such as Passport, Windows, or other). The size of this buffer is specified by the <i>puUserIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puUserIdTypeLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetuserinfo
     */
    static DRMGetUserInfo(hUser, puUserNameLength, wszUserName, puUserIdLength, wszUserId, puUserIdTypeLength, wszUserIdType) {
        wszUserName := wszUserName is String ? StrPtr(wszUserName) : wszUserName
        wszUserId := wszUserId is String ? StrPtr(wszUserId) : wszUserId
        wszUserIdType := wszUserIdType is String ? StrPtr(wszUserIdType) : wszUserIdType

        puUserNameLengthMarshal := puUserNameLength is VarRef ? "uint*" : "ptr"
        puUserIdLengthMarshal := puUserIdLength is VarRef ? "uint*" : "ptr"
        puUserIdTypeLengthMarshal := puUserIdTypeLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUserInfo", "uint", hUser, puUserNameLengthMarshal, puUserNameLength, "ptr", wszUserName, puUserIdLengthMarshal, puUserIdLength, "ptr", wszUserId, puUserIdTypeLengthMarshal, puUserIdTypeLength, "ptr", wszUserIdType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains information about a previously created right.
     * @param {Integer} hRight The handle of the right to retrieve information from.
     * @param {Pointer<Integer>} puRightNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszRightName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszRightName</i> buffer.
     * @param {PWSTR} wszRightName A pointer to a null-terminated Unicode string that receives the name of the right. The size of this buffer is specified by the <i>puRightNameLength</i> parameter. If this information is not required, set this parameter to <b>NULL</b>.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puRightNameLength</i> value.
     * @param {Pointer<SYSTEMTIME>} pstFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the starting validity time, in UTC time, of the right. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the ending validity time, in UTC time, of the right. If this information is not required, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetrightinfo
     */
    static DRMGetRightInfo(hRight, puRightNameLength, wszRightName, pstFrom, pstUntil) {
        wszRightName := wszRightName is String ? StrPtr(wszRightName) : wszRightName

        puRightNameLengthMarshal := puRightNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetRightInfo", "uint", hRight, puRightNameLengthMarshal, puRightNameLength, "ptr", wszRightName, "ptr", pstFrom, "ptr", pstUntil, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves custom name-value pairs attached to a right.
     * @param {Integer} hRight The handle of the right to retrieve information from.
     * @param {Integer} uIndex The zero-based index of the name-value pair to retrieve.
     * @param {Pointer<Integer>} puExtendedInfoNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszExtendedInfoName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszExtendedInfoName</i> buffer.
     * @param {PWSTR} wszExtendedInfoName A pointer to a null-terminated Unicode string that receives the name of the item. The size of this buffer is specified by the <i>puExtendedInfoNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puExtendedInfoNameLength</i> value.
     * @param {Pointer<Integer>} puExtendedInfoValueLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszExtendedInfoValue</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszExtendedInfoValue</i> buffer.
     * @param {PWSTR} wszExtendedInfoValue A pointer to a null-terminated Unicode string that receives the value associated with the name. The size of this buffer is specified by the <i>puExtendedInfoValueLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puExtendedInfoValueLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetrightextendedinfo
     */
    static DRMGetRightExtendedInfo(hRight, uIndex, puExtendedInfoNameLength, wszExtendedInfoName, puExtendedInfoValueLength, wszExtendedInfoValue) {
        wszExtendedInfoName := wszExtendedInfoName is String ? StrPtr(wszExtendedInfoName) : wszExtendedInfoName
        wszExtendedInfoValue := wszExtendedInfoValue is String ? StrPtr(wszExtendedInfoValue) : wszExtendedInfoValue

        puExtendedInfoNameLengthMarshal := puExtendedInfoNameLength is VarRef ? "uint*" : "ptr"
        puExtendedInfoValueLengthMarshal := puExtendedInfoValueLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetRightExtendedInfo", "uint", hRight, "uint", uIndex, puExtendedInfoNameLengthMarshal, puExtendedInfoNameLength, "ptr", wszExtendedInfoName, puExtendedInfoValueLengthMarshal, puExtendedInfoValueLength, "ptr", wszExtendedInfoValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a specific user from an issuance license.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to retrieve the user from.
     * @param {Integer} uIndex The zero-based index of the user in the issuance license to retrieve. To enumerate all the users in the issuance license, create a loop starting at zero and incrementing by one. When the function returns <b>E_DRM_NO_MORE_DATA</b>, there are no more users in the issuance license.
     * @param {Pointer<Integer>} phUser A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle to the requested user. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetusers
     */
    static DRMGetUsers(hIssuanceLicense, uIndex, phUser) {
        phUserMarshal := phUser is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUsers", "uint", hIssuanceLicense, "uint", uIndex, phUserMarshal, phUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves user/right pairs from an issuance license.
     * @param {Integer} hIssuanceLicense The handle of the issuance license to retrieve the user rights from.
     * @param {Integer} hUser The handle of a user in the issuance license to retrieve the rights for.
     * @param {Integer} uIndex The zero-based index that indicates which right to retrieve for the specified user. To enumerate all the rights assigned to a user in the issuance license, create a loop starting at zero and incrementing by one. When the function returns <b>E_DRM_NO_MORE_DATA</b>, there are no more rights assigned to that user.
     * @param {Pointer<Integer>} phRight A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle to the requested right. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetuserrights
     */
    static DRMGetUserRights(hIssuanceLicense, hUser, uIndex, phRight) {
        phRightMarshal := phRight is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUserRights", "uint", hIssuanceLicense, "uint", hUser, "uint", uIndex, phRightMarshal, phRight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves metadata from an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the metadata from.
     * @param {Pointer<Integer>} puContentIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentId</i> buffer (required). This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentId</i> buffer.
     * @param {PWSTR} wszContentId A pointer to a null-terminated Unicode string that receives the GUID that identifies the content. The size of this buffer is specified by the <i>puContentIdLength</i> parameter.
     * 
     * To determine the required size of  this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentIdLength</i> value.
     * @param {Pointer<Integer>} puContentIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentIdType</i> buffer  (required). This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentIdType</i> buffer.
     * @param {PWSTR} wszContentIdType A pointer to a null-terminated Unicode string that receives the type of GUID used to identify the content. The size of this buffer is specified by the <i>puContentIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentIdTypeLength</i> value.
     * @param {Pointer<Integer>} puSKUIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszSKUId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszSKUId</i> buffer.
     * @param {PWSTR} wszSKUId A pointer to a null-terminated Unicode string that receives the GUID that identifies the SKU of the content. The size of this buffer is specified by the <i>puSKUIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puSKUIdLength</i> value.
     * @param {Pointer<Integer>} puSKUIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszSKUIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszSKUIdType</i> buffer.
     * @param {PWSTR} wszSKUIdType A pointer to a null-terminated Unicode string that receives the type of SKU ID used to identify content. The size of this buffer is specified by the <i>puSKUIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puSKUIdTypeLength</i> value.
     * @param {Pointer<Integer>} puContentTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentType</i> buffer.
     * @param {PWSTR} wszContentType A pointer to a null-terminated Unicode string that receives the Multipurpose Internet Mail Extensions (MIME) type of the content. The size of this buffer is specified by the <i>puContentTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentTypeLength</i> value.
     * @param {Pointer<Integer>} puContentNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszContentName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszContentName</i> buffer.
     * @param {PWSTR} wszContentName A pointer to a null-terminated Unicode string that receives the name of the content. The size of this buffer is specified by the <i>puContentNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puContentNameLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetmetadata
     */
    static DRMGetMetaData(hIssuanceLicense, puContentIdLength, wszContentId, puContentIdTypeLength, wszContentIdType, puSKUIdLength, wszSKUId, puSKUIdTypeLength, wszSKUIdType, puContentTypeLength, wszContentType, puContentNameLength, wszContentName) {
        wszContentId := wszContentId is String ? StrPtr(wszContentId) : wszContentId
        wszContentIdType := wszContentIdType is String ? StrPtr(wszContentIdType) : wszContentIdType
        wszSKUId := wszSKUId is String ? StrPtr(wszSKUId) : wszSKUId
        wszSKUIdType := wszSKUIdType is String ? StrPtr(wszSKUIdType) : wszSKUIdType
        wszContentType := wszContentType is String ? StrPtr(wszContentType) : wszContentType
        wszContentName := wszContentName is String ? StrPtr(wszContentName) : wszContentName

        puContentIdLengthMarshal := puContentIdLength is VarRef ? "uint*" : "ptr"
        puContentIdTypeLengthMarshal := puContentIdTypeLength is VarRef ? "uint*" : "ptr"
        puSKUIdLengthMarshal := puSKUIdLength is VarRef ? "uint*" : "ptr"
        puSKUIdTypeLengthMarshal := puSKUIdTypeLength is VarRef ? "uint*" : "ptr"
        puContentTypeLengthMarshal := puContentTypeLength is VarRef ? "uint*" : "ptr"
        puContentNameLengthMarshal := puContentNameLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetMetaData", "uint", hIssuanceLicense, puContentIdLengthMarshal, puContentIdLength, "ptr", wszContentId, puContentIdTypeLengthMarshal, puContentIdTypeLength, "ptr", wszContentIdType, puSKUIdLengthMarshal, puSKUIdLength, "ptr", wszSKUId, puSKUIdTypeLengthMarshal, puSKUIdTypeLength, "ptr", wszSKUIdType, puContentTypeLengthMarshal, puContentTypeLength, "ptr", wszContentType, puContentNameLengthMarshal, puContentNameLength, "ptr", wszContentName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a name-value pair of arbitrary application-specific information.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to obtain the data from.
     * @param {Integer} uIndex The zero-based index of the name-value pair in the array of stored name-value pairs to retrieve.
     * @param {Pointer<Integer>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {PWSTR} wszName A pointer to a Unicode character buffer that receives the name portion of the name-value pair. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<Integer>} puValueLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszValue</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszValue</i> buffer.
     * @param {PWSTR} wszValue A pointer to a Unicode character buffer that receives the value portion of the name-value pair. The size of this buffer is specified by the <i>puValueLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puValueLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetapplicationspecificdata
     */
    static DRMGetApplicationSpecificData(hIssuanceLicense, uIndex, puNameLength, wszName, puValueLength, wszValue) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszValue := wszValue is String ? StrPtr(wszValue) : wszValue

        puNameLengthMarshal := puNameLength is VarRef ? "uint*" : "ptr"
        puValueLengthMarshal := puValueLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetApplicationSpecificData", "uint", hIssuanceLicense, "uint", uIndex, puNameLengthMarshal, puNameLength, "ptr", wszName, puValueLengthMarshal, puValueLength, "ptr", wszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves various information from an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to retrieve information from.
     * @param {Pointer<SYSTEMTIME>} pstTimeFrom A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the starting validity time, in UTC time, of the license. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Pointer<SYSTEMTIME>} pstTimeUntil A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the ending validity time, in UTC time, of the license. If this information is not required, set this parameter to <b>NULL</b>.
     * @param {Integer} uFlags A value of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_distribution_point_info">DRM_DISTRIBUTION_POINT_INFO</a> enumeration that specifies the type of service provided by this distribution point (such as publishing or license acquisition). Only one flag can be used.
     * @param {Pointer<Integer>} puDistributionPointNameLength A pointer to a UINT value that, on entry, contains the length, in characters, of the <i>wszDistributionPointName</i> buffer. This size must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDistributionPointName</i> buffer.
     * 
     * If the <i>wszDistributionPointName</i> string is not required, set this parameter to <b>NULL</b>.
     * @param {PWSTR} wszDistributionPointName A pointer to a null-terminated Unicode string that receives the name of a website that can distribute end-user licenses. The size of this buffer is specified by the <i>puDistributionPointNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDistributionPointNameLength</i> value.
     * @param {Pointer<Integer>} puDistributionPointURLLength A pointer to a UINT value that, on entry, contains the length, in characters, of the <i>wszDistributionPointURL</i> buffer. This size must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDistributionPointURL</i> buffer.
     * 
     * If the <i>wszDistributionPointURL</i> string is not required, set this parameter to <b>NULL</b>.
     * @param {PWSTR} wszDistributionPointURL A pointer to a null-terminated Unicode string that receives the URL of a website that can distribute end-user licenses. The size of this buffer is specified by the <i>puDistributionPointURLLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDistributionPointURLLength</i> value.
     * @param {Pointer<Integer>} phOwner A pointer to a <b>DRMPUBHANDLE</b> value that receives the handle of the issuance license owner. If this information is not required, set this parameter to <b>NULL</b>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmclosepubhandle">DRMClosePubHandle</a> to close the handle.
     * @param {Pointer<BOOL>} pfOfficial A pointer to  a Boolean value that specifies whether the issuance license is based on an official template. A nonzero value indicates that the license is based on an official template. Official templates are created and signed by the AD RMS server. Unofficial templates are created by the client from scratch or by adapting an official template. If this information is not required, set this parameter to <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/creating-a-license-from-a-template">Creating a License From a Template</a>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetissuancelicenseinfo
     */
    static DRMGetIssuanceLicenseInfo(hIssuanceLicense, pstTimeFrom, pstTimeUntil, uFlags, puDistributionPointNameLength, wszDistributionPointName, puDistributionPointURLLength, wszDistributionPointURL, phOwner, pfOfficial) {
        wszDistributionPointName := wszDistributionPointName is String ? StrPtr(wszDistributionPointName) : wszDistributionPointName
        wszDistributionPointURL := wszDistributionPointURL is String ? StrPtr(wszDistributionPointURL) : wszDistributionPointURL

        puDistributionPointNameLengthMarshal := puDistributionPointNameLength is VarRef ? "uint*" : "ptr"
        puDistributionPointURLLengthMarshal := puDistributionPointURLLength is VarRef ? "uint*" : "ptr"
        phOwnerMarshal := phOwner is VarRef ? "uint*" : "ptr"
        pfOfficialMarshal := pfOfficial is VarRef ? "int*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetIssuanceLicenseInfo", "uint", hIssuanceLicense, "ptr", pstTimeFrom, "ptr", pstTimeUntil, "uint", uFlags, puDistributionPointNameLengthMarshal, puDistributionPointNameLength, "ptr", wszDistributionPointName, puDistributionPointURLLengthMarshal, puDistributionPointURLLength, "ptr", wszDistributionPointURL, phOwnerMarshal, phOwner, pfOfficialMarshal, pfOfficial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves information about the revocation point for an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the information from.
     * @param {Pointer<Integer>} puIdLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszId</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszId</i> buffer.
     * @param {PWSTR} wszId A pointer to a null-terminated Unicode string that receives the GUID that identifies the revocation point. The size of this buffer is specified by the <i>puIdLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIdLength</i> value.
     * @param {Pointer<Integer>} puIdTypeLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszIdType</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszIdType</i> buffer.
     * @param {PWSTR} wszIdType A pointer to a null-terminated Unicode string that receives the type of the revocation point identifier. The size of this buffer is specified by the <i>puIdTypeLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puIdTypeLength</i> value.
     * @param {Pointer<Integer>} puURLLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszURL</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszURL</i> buffer.
     * @param {PWSTR} wszRL A pointer to a null-terminated Unicode string that receives the URL where a revocation list can be obtained. The size of this buffer is specified by the <i>puURLLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puURLLength</i> value.
     * @param {Pointer<SYSTEMTIME>} pstFrequency A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that receives the frequency that the revocation list must be refreshed. This parameter is required and cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {PWSTR} wszName A pointer to a null-terminated Unicode string that receives the human-readable name for the revocation location. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<Integer>} puPublicKeyLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszPublicKey</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszPublicKey</i> buffer.
     * @param {PWSTR} wszPublicKey A pointer to a null-terminated Unicode string that receives the optional public key to identify a revocation list outside the content's chain of trust. The size of this buffer is specified by the <i>puPublicKeyLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puPublicKeyLength</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetrevocationpoint
     */
    static DRMGetRevocationPoint(hIssuanceLicense, puIdLength, wszId, puIdTypeLength, wszIdType, puURLLength, wszRL, pstFrequency, puNameLength, wszName, puPublicKeyLength, wszPublicKey) {
        wszId := wszId is String ? StrPtr(wszId) : wszId
        wszIdType := wszIdType is String ? StrPtr(wszIdType) : wszIdType
        wszRL := wszRL is String ? StrPtr(wszRL) : wszRL
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszPublicKey := wszPublicKey is String ? StrPtr(wszPublicKey) : wszPublicKey

        puIdLengthMarshal := puIdLength is VarRef ? "uint*" : "ptr"
        puIdTypeLengthMarshal := puIdTypeLength is VarRef ? "uint*" : "ptr"
        puURLLengthMarshal := puURLLength is VarRef ? "uint*" : "ptr"
        puNameLengthMarshal := puNameLength is VarRef ? "uint*" : "ptr"
        puPublicKeyLengthMarshal := puPublicKeyLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetRevocationPoint", "uint", hIssuanceLicense, puIdLengthMarshal, puIdLength, "ptr", wszId, puIdTypeLengthMarshal, puIdTypeLength, "ptr", wszIdType, puURLLengthMarshal, puURLLength, "ptr", wszRL, "ptr", pstFrequency, puNameLengthMarshal, puNameLength, "ptr", wszName, puPublicKeyLengthMarshal, puPublicKeyLength, "ptr", wszPublicKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets a usage policy that requires, or denies, access to content based on application name, version, or other application characteristics.
     * @param {Integer} hIssuanceLicense The handle of the issuance license that the usage policy is contained in.
     * @param {Integer} uIndex The zero-based index of the policy to retrieve.
     * @param {Pointer<Integer>} peUsagePolicyType A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type">DRM_USAGEPOLICY_TYPE</a> value that receives one of the <b>DRM_USAGEPOLICY_TYPE</b> values that specifies the type of usage policy (name, public key, and so on). If a usage policy of type <b>DRM_USAGEPOLICY_TYPE_BYNAME</b> is chosen, then application versions between, and including, the minimum and maximum versions specified in  <i>wszMinVersion</i> and <i>wszMaxVersion</i>, respectively, will be included or excluded.
     * @param {Pointer<BOOL>} pfExclusion A pointer to a <b>BOOL</b> value that receives a value the specifies whether the policy is an exclusion policy. <b>TRUE</b> indicates that the application is prohibited from exercising the rights. <b>FALSE</b> indicates that the application is required to exercise the rights.
     * @param {Pointer<Integer>} puNameLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {PWSTR} wszName A pointer to a null-terminated Unicode string that receives the name of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> value.
     * @param {Pointer<Integer>} puMinVersionLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszMinVersion</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszMinVersion</i> buffer.
     * @param {PWSTR} wszMinVersion A pointer to a null-terminated Unicode string that receives the minimum version of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puMinVersionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puMinVersionLength</i> value.
     * 
     * This will be a version string in a form similar to "1.0.1" or "1.00.0000".
     * @param {Pointer<Integer>} puMaxVersionLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszMaxVersion</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszMaxVersion</i> buffer.
     * @param {PWSTR} wszMaxVersion A pointer to a null-terminated Unicode string that receives the maximum version of the application required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>puMaxVersionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puMaxVersionLength</i> value.
     * 
     * This will be a version string in a form similar to "1.0.1" or "1.00.0000".
     * @param {Pointer<Integer>} puPublicKeyLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszPublicKey</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszPublicKey</i> buffer.
     * @param {PWSTR} wszPublicKey A pointer to a null-terminated Unicode string that receives the public key used to sign the digest of the application required to exercise or prohibited from exercising rights. The key is a well-formed XrML node. The size of this buffer is specified by the <i>puPublicKeyLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puPublicKeyLength</i> value.
     * @param {Pointer<Integer>} puDigestAlgorithmLength A pointer to a <b>UINT</b> value that, on entry, contains the length, in characters, of the <i>wszDigestAlgorithm</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this value contains the number of characters, including the terminating null character, that were copied to the <i>wszDigestAlgorithm</i> buffer.
     * @param {PWSTR} wszDigestAlgorithm A pointer to a null-terminated Unicode string that receives the algorithm used to create the application digest that was specified in <i>pbDigest</i>. The size of this buffer is specified by the <i>puDigestAlgorithmLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDigestAlgorithmLength</i> value.
     * @param {Pointer<Integer>} pcbDigest A pointer to a <b>UINT</b> value that, on entry, contains the length, in bytes, of the <i>pbDigest</i> buffer.
     * 
     * After the function returns, this value contains the number of bytes copied to the <i>pbDigest</i> buffer.
     * @param {Pointer<Integer>} pbDigest A pointer to a buffer that receives the application digest that is required to exercise or prohibited from exercising rights. The size of this buffer is specified by the <i>pcbDigest</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in bytes, in the <i>pcbDigest</i> value.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetusagepolicy
     */
    static DRMGetUsagePolicy(hIssuanceLicense, uIndex, peUsagePolicyType, pfExclusion, puNameLength, wszName, puMinVersionLength, wszMinVersion, puMaxVersionLength, wszMaxVersion, puPublicKeyLength, wszPublicKey, puDigestAlgorithmLength, wszDigestAlgorithm, pcbDigest, pbDigest) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszMinVersion := wszMinVersion is String ? StrPtr(wszMinVersion) : wszMinVersion
        wszMaxVersion := wszMaxVersion is String ? StrPtr(wszMaxVersion) : wszMaxVersion
        wszPublicKey := wszPublicKey is String ? StrPtr(wszPublicKey) : wszPublicKey
        wszDigestAlgorithm := wszDigestAlgorithm is String ? StrPtr(wszDigestAlgorithm) : wszDigestAlgorithm

        peUsagePolicyTypeMarshal := peUsagePolicyType is VarRef ? "int*" : "ptr"
        pfExclusionMarshal := pfExclusion is VarRef ? "int*" : "ptr"
        puNameLengthMarshal := puNameLength is VarRef ? "uint*" : "ptr"
        puMinVersionLengthMarshal := puMinVersionLength is VarRef ? "uint*" : "ptr"
        puMaxVersionLengthMarshal := puMaxVersionLength is VarRef ? "uint*" : "ptr"
        puPublicKeyLengthMarshal := puPublicKeyLength is VarRef ? "uint*" : "ptr"
        puDigestAlgorithmLengthMarshal := puDigestAlgorithmLength is VarRef ? "uint*" : "ptr"
        pcbDigestMarshal := pcbDigest is VarRef ? "uint*" : "ptr"
        pbDigestMarshal := pbDigest is VarRef ? "char*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetUsagePolicy", "uint", hIssuanceLicense, "uint", uIndex, peUsagePolicyTypeMarshal, peUsagePolicyType, pfExclusionMarshal, pfExclusion, puNameLengthMarshal, puNameLength, "ptr", wszName, puMinVersionLengthMarshal, puMinVersionLength, "ptr", wszMinVersion, puMaxVersionLengthMarshal, puMaxVersionLength, "ptr", wszMaxVersion, puPublicKeyLengthMarshal, puPublicKeyLength, "ptr", wszPublicKey, puDigestAlgorithmLengthMarshal, puDigestAlgorithmLength, "ptr", wszDigestAlgorithm, pcbDigestMarshal, pcbDigest, pbDigestMarshal, pbDigest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a language specific name and description from an issuance license.
     * @param {Integer} hIssuanceLicense A handle to the issuance license to get the information from.
     * @param {Integer} uIndex The zero-based index of the name and description pair to retrieve.
     * @param {Pointer<Integer>} pulcid A pointer to a <b>UINT</b> that receives the locale ID of the name and description pair.
     * @param {Pointer<Integer>} puNameLength A pointer to a <b>UINT</b> that, on input, contains the length, in characters, of the <i>wszName</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszName</i> buffer.
     * @param {PWSTR} wszName A pointer to a null-terminated Unicode string that receives the name. The size of this buffer is specified by the <i>puNameLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puNameLength</i> parameter.
     * @param {Pointer<Integer>} puDescriptionLength A pointer to a <b>UINT</b> that, on input, contains the length, in characters, of the <i>wszDescription</i> buffer. This length must include the terminating null character.
     * 
     * After the function returns, this <b>UINT</b> contains the number of characters, including the terminating null character, that were copied to the <i>wszDescription</i> buffer.
     * @param {PWSTR} wszDescription A pointer to a null-terminated Unicode string that receives the description. The size of this buffer is specified by the <i>puDescriptionLength</i> parameter.
     * 
     * To determine the required size of this buffer, pass <b>NULL</b> for this parameter. The function will place the size, in characters, including the terminating null character, in the <i>puDescriptionLength</i> parameter.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetnameanddescription
     */
    static DRMGetNameAndDescription(hIssuanceLicense, uIndex, pulcid, puNameLength, wszName, puDescriptionLength, wszDescription) {
        wszName := wszName is String ? StrPtr(wszName) : wszName
        wszDescription := wszDescription is String ? StrPtr(wszDescription) : wszDescription

        pulcidMarshal := pulcid is VarRef ? "uint*" : "ptr"
        puNameLengthMarshal := puNameLength is VarRef ? "uint*" : "ptr"
        puDescriptionLengthMarshal := puDescriptionLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetNameAndDescription", "uint", hIssuanceLicense, "uint", uIndex, pulcidMarshal, pulcid, puNameLengthMarshal, puNameLength, "ptr", wszName, puDescriptionLengthMarshal, puDescriptionLength, "ptr", wszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves an owner license created by calling the DRMGetSignedIssuanceLicense.
     * @param {Integer} hIssuanceLicense A handle to a signed issuance license.
     * @param {Pointer<Integer>} puOwnerLicenseLength An unsigned integer that contains the length, in characters, of the owner license retrieved by this function. The terminating null character is included in the length.
     * @param {PWSTR} wszOwnerLicense A null-terminated string that contains the owner license in XrML format. For example XrML owner license, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/owner-license-xml-example">Owner License XML Example</a>.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetownerlicense
     */
    static DRMGetOwnerLicense(hIssuanceLicense, puOwnerLicenseLength, wszOwnerLicense) {
        wszOwnerLicense := wszOwnerLicense is String ? StrPtr(wszOwnerLicense) : wszOwnerLicense

        puOwnerLicenseLengthMarshal := puOwnerLicenseLength is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetOwnerLicense", "uint", hIssuanceLicense, puOwnerLicenseLengthMarshal, puOwnerLicenseLength, "ptr", wszOwnerLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the number of days from issuance that can pass before an end�user license must be renewed.
     * @param {Integer} hIssuanceLicense The handle of the issuance license from which the interval time can be retrieved.
     * @param {Pointer<Integer>} pcDays A pointer to a <b>UINT</b> that specifies the interval period, in days. For example, if the value is  30, the end–user license must be renewed within 30 days of the day  it was issued.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmgetintervaltime
     */
    static DRMGetIntervalTime(hIssuanceLicense, pcDays) {
        pcDaysMarshal := pcDays is VarRef ? "uint*" : "ptr"

        result := DllCall("msdrm.dll\DRMGetIntervalTime", "uint", hIssuanceLicense, pcDaysMarshal, pcDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Repairs a client machine by deleting certificates previously created for the machine or user.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmrepair
     */
    static DRMRepair() {
        result := DllCall("msdrm.dll\DRMRepair", "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Registers a window in the protected environment.
     * @param {Integer} hEnv A handle to the secure environment.
     * @param {HWND} hwnd A handle to the window to be registered.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmregisterprotectedwindow
     * @since windows6.0.6000
     */
    static DRMRegisterProtectedWindow(hEnv, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("msdrm.dll\DRMRegisterProtectedWindow", "uint", hEnv, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Indicates whether a window is associated with a protected environment.
     * @param {HWND} hwnd The window handle.
     * @param {Pointer<BOOL>} pfProtected A pointer to a <b>BOOL</b> that indicates whether the window is associated with a protected environment.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmiswindowprotected
     * @since windows6.0.6000
     */
    static DRMIsWindowProtected(hwnd, pfProtected) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pfProtectedMarshal := pfProtected is VarRef ? "int*" : "ptr"

        result := DllCall("msdrm.dll\DRMIsWindowProtected", "ptr", hwnd, pfProtectedMarshal, pfProtected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Asynchronously retrieves issuance license templates from a server.
     * @param {Integer} hClient A handle to a client session. The handle is obtained by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a> function. When you call  <b>DRMCreateClientSession</b>, you must specify a callback function that AD RMS can use to return the result of an operation. A string that contains the templates  is sent to the callback function in a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-issuance-license-template">DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE</a> message.
     * @param {Integer} uFlags Specifies options for the function call. This parameter can be a combination of one or more of the following flags.
     * @param {Pointer<Void>} pvReserved Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {Integer} cTemplates Reserved for future use. This value must be zero.
     * @param {Pointer<PWSTR>} pwszTemplateIds Reserved for future use. This parameter must be <b>NULL</b>.
     * @param {PWSTR} wszUrl A null-terminated Unicode string that contains the template acquisition URL. You can retrieve this value by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetservicelocation">DRMGetServiceLocation</a> and setting the <i>uServiceType</i> parameter to <b>DRM_SERVICE_TYPE_CLIENTLICENSOR</b>.
     * @param {Pointer<Void>} pvContext A 32-bit, application-defined value that is returned in the <i>pvContext</i> parameter of the callback function. This value can be a pointer to data, a pointer to an event handle, or whatever else the custom callback function is designed to handle. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrmdefs/nc-msdrmdefs-drmcallback">Callback Prototype</a>.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msdrm/nf-msdrm-drmacquireissuancelicensetemplate
     * @since windows6.0.6000
     */
    static DRMAcquireIssuanceLicenseTemplate(hClient, uFlags, pvReserved, cTemplates, pwszTemplateIds, wszUrl, pvContext) {
        wszUrl := wszUrl is String ? StrPtr(wszUrl) : wszUrl

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
        pwszTemplateIdsMarshal := pwszTemplateIds is VarRef ? "ptr*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("msdrm.dll\DRMAcquireIssuanceLicenseTemplate", "uint", hClient, "uint", uFlags, pvReservedMarshal, pvReserved, "uint", cTemplates, pwszTemplateIdsMarshal, pwszTemplateIds, "ptr", wszUrl, pvContextMarshal, pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
