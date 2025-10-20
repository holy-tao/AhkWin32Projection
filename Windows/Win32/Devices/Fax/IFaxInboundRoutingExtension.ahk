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
     * 
     * @param {Pointer<BSTR>} pbstrFriendlyName 
     * @returns {HRESULT} 
     */
    get_FriendlyName(pbstrFriendlyName) {
        result := ComCall(7, this, "ptr", pbstrFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrImageName 
     * @returns {HRESULT} 
     */
    get_ImageName(pbstrImageName) {
        result := ComCall(8, this, "ptr", pbstrImageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUniqueName 
     * @returns {HRESULT} 
     */
    get_UniqueName(pbstrUniqueName) {
        result := ComCall(9, this, "ptr", pbstrUniqueName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(plMajorVersion) {
        result := ComCall(10, this, "int*", plMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(plMinorVersion) {
        result := ComCall(11, this, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMajorBuild 
     * @returns {HRESULT} 
     */
    get_MajorBuild(plMajorBuild) {
        result := ComCall(12, this, "int*", plMajorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMinorBuild 
     * @returns {HRESULT} 
     */
    get_MinorBuild(plMinorBuild) {
        result := ComCall(13, this, "int*", plMinorBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbDebug 
     * @returns {HRESULT} 
     */
    get_Debug(pbDebug) {
        result := ComCall(14, this, "ptr", pbDebug, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(15, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plInitErrorCode 
     * @returns {HRESULT} 
     */
    get_InitErrorCode(plInitErrorCode) {
        result := ComCall(16, this, "int*", plInitErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvMethods 
     * @returns {HRESULT} 
     */
    get_Methods(pvMethods) {
        result := ComCall(17, this, "ptr", pvMethods, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
