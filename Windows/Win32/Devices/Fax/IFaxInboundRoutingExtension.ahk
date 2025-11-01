#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRoutingExtension interface defines a configuration object used by a fax client application to retrieve information about a fax routing extension registered with the fax service.
 * @remarks
 * 
  * A default implementation of <b>IFaxInboundRoutingExtension</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension">FaxInboundRoutingExtension</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundroutingextension
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRoutingExtension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxInboundRoutingExtension
     * @type {Guid}
     */
    static IID => Guid("{885b5e08-c26c-4ef9-af83-51580a750be1}")

    /**
     * The class identifier for FaxInboundRoutingExtension
     * @type {Guid}
     */
    static CLSID => Guid("{1d7dfb51-7207-4436-a0d9-24e32ee56988}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FriendlyName", "get_ImageName", "get_UniqueName", "get_MajorVersion", "get_MinorVersion", "get_MajorBuild", "get_MinorBuild", "get_Debug", "get_Status", "get_InitErrorCode", "get_Methods"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_friendlyname
     */
    get_FriendlyName(pbstrFriendlyName) {
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrImageName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_imagename
     */
    get_ImageName(pbstrImageName) {
        result := ComCall(8, this, "ptr", pbstrImageName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUniqueName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_uniquename
     */
    get_UniqueName(pbstrUniqueName) {
        result := ComCall(9, this, "ptr", pbstrUniqueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorversion
     */
    get_MajorVersion(plMajorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plMajorVersionMarshal, plMajorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorversion
     */
    get_MinorVersion(plMinorVersion) {
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_majorbuild
     */
    get_MajorBuild(plMajorBuild) {
        plMajorBuildMarshal := plMajorBuild is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plMajorBuildMarshal, plMajorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMinorBuild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_minorbuild
     */
    get_MinorBuild(plMinorBuild) {
        plMinorBuildMarshal := plMinorBuild is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plMinorBuildMarshal, plMinorBuild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_debug
     */
    get_Debug(pbDebug) {
        result := ComCall(14, this, "ptr", pbDebug, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_status
     */
    get_Status(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plInitErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_initerrorcode
     */
    get_InitErrorCode(plInitErrorCode) {
        plInitErrorCodeMarshal := plInitErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plInitErrorCodeMarshal, plInitErrorCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvMethods 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingextension-get_methods
     */
    get_Methods(pvMethods) {
        result := ComCall(17, this, "ptr", pvMethods, "HRESULT")
        return result
    }
}
