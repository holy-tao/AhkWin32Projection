#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPortMappingProps interface provides methods that retrieve and set the properties of a network connection port mapping.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingportmappingprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPortMappingProps extends IDispatch{
    /**
     * The interface identifier for INetSharingPortMappingProps
     * @type {Guid}
     */
    static IID => Guid("{24b7e9b5-e38f-4685-851b-00892cf5f940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pucIPProt 
     * @returns {HRESULT} 
     */
    get_IPProtocol(pucIPProt) {
        result := ComCall(8, this, "char*", pucIPProt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pusPort 
     * @returns {HRESULT} 
     */
    get_ExternalPort(pusPort) {
        result := ComCall(9, this, "int*", pusPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pusPort 
     * @returns {HRESULT} 
     */
    get_InternalPort(pusPort) {
        result := ComCall(10, this, "int*", pusPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pdwOptions 
     * @returns {HRESULT} 
     */
    get_Options(pdwOptions) {
        result := ComCall(11, this, "int*", pdwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTargetName 
     * @returns {HRESULT} 
     */
    get_TargetName(pbstrTargetName) {
        result := ComCall(12, this, "ptr", pbstrTargetName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTargetIPAddress 
     * @returns {HRESULT} 
     */
    get_TargetIPAddress(pbstrTargetIPAddress) {
        result := ComCall(13, this, "ptr", pbstrTargetIPAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     */
    get_Enabled(pbool) {
        result := ComCall(14, this, "ptr", pbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
