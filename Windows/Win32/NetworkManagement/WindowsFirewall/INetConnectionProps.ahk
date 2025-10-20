#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the INetConnectionProps interface to retrieve the properties for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetconnectionprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetConnectionProps extends IDispatch{
    /**
     * The interface identifier for INetConnectionProps
     * @type {Guid}
     */
    static IID => Guid("{f4277c95-ce5b-463d-8167-5662d9bcaa72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGuid 
     * @returns {HRESULT} 
     */
    get_Guid(pbstrGuid) {
        result := ComCall(7, this, "ptr", pbstrGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(8, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(9, this, "ptr", pbstrDeviceName, "int")
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
        result := ComCall(10, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(pMediaType) {
        result := ComCall(11, this, "int*", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    get_Characteristics(pdwFlags) {
        result := ComCall(12, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
