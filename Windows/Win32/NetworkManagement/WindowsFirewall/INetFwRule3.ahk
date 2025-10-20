#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwRule2.ahk

/**
 * Allows an application or service to access all the properties of INetFwRule2 and to provide access to the requirements of app containers.
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwrule3
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwRule3 extends INetFwRule2{
    /**
     * The interface identifier for INetFwRule3
     * @type {Guid}
     */
    static IID => Guid("{b21563ff-d696-4222-ab46-4e89b73ab34a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * 
     * @param {Pointer<BSTR>} wszPackageId 
     * @returns {HRESULT} 
     */
    get_LocalAppPackageId(wszPackageId) {
        result := ComCall(45, this, "ptr", wszPackageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszPackageId 
     * @returns {HRESULT} 
     */
    put_LocalAppPackageId(wszPackageId) {
        wszPackageId := wszPackageId is String ? BSTR.Alloc(wszPackageId).Value : wszPackageId

        result := ComCall(46, this, "ptr", wszPackageId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} wszUserOwner 
     * @returns {HRESULT} 
     */
    get_LocalUserOwner(wszUserOwner) {
        result := ComCall(47, this, "ptr", wszUserOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszUserOwner 
     * @returns {HRESULT} 
     */
    put_LocalUserOwner(wszUserOwner) {
        wszUserOwner := wszUserOwner is String ? BSTR.Alloc(wszUserOwner).Value : wszUserOwner

        result := ComCall(48, this, "ptr", wszUserOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} wszUserAuthList 
     * @returns {HRESULT} 
     */
    get_LocalUserAuthorizedList(wszUserAuthList) {
        result := ComCall(49, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     */
    put_LocalUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(50, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} wszUserAuthList 
     * @returns {HRESULT} 
     */
    get_RemoteUserAuthorizedList(wszUserAuthList) {
        result := ComCall(51, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     */
    put_RemoteUserAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(52, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} wszUserAuthList 
     * @returns {HRESULT} 
     */
    get_RemoteMachineAuthorizedList(wszUserAuthList) {
        result := ComCall(53, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} wszUserAuthList 
     * @returns {HRESULT} 
     */
    put_RemoteMachineAuthorizedList(wszUserAuthList) {
        wszUserAuthList := wszUserAuthList is String ? BSTR.Alloc(wszUserAuthList).Value : wszUserAuthList

        result := ComCall(54, this, "ptr", wszUserAuthList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lOptions 
     * @returns {HRESULT} 
     */
    get_SecureFlags(lOptions) {
        result := ComCall(55, this, "int*", lOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lOptions 
     * @returns {HRESULT} 
     */
    put_SecureFlags(lOptions) {
        result := ComCall(56, this, "int", lOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
