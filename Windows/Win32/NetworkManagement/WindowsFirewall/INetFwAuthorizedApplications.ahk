#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwAuthorizedApplications interface provides access to a collection of applications authorized open ports in the firewall.
 * @remarks
 * 
  * An instance of this interface is retrieved through the
  * <a href="https://docs.microsoft.com/windows/desktop/api/netfw/nf-netfw-inetfwprofile-get_authorizedapplications">AuthorizedApplications</a> property of the INetFwProfile interface. 
  * 
  * All
  * configuration changes take effect immediately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwauthorizedapplications
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwAuthorizedApplications extends IDispatch{
    /**
     * The interface identifier for INetFwAuthorizedApplications
     * @type {Guid}
     */
    static IID => Guid("{644efd52-ccf9-486c-97a2-39f352570b30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwAuthorizedApplication>} app 
     * @returns {HRESULT} 
     */
    Add(app) {
        result := ComCall(8, this, "ptr", app, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @returns {HRESULT} 
     */
    Remove(imageFileName) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(9, this, "ptr", imageFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} imageFileName 
     * @param {Pointer<INetFwAuthorizedApplication>} app 
     * @returns {HRESULT} 
     */
    Item(imageFileName, app) {
        imageFileName := imageFileName is String ? BSTR.Alloc(imageFileName).Value : imageFileName

        result := ComCall(10, this, "ptr", imageFileName, "ptr", app, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} newEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(newEnum) {
        result := ComCall(11, this, "ptr", newEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
