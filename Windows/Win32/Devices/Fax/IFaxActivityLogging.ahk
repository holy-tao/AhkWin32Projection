#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxActivityLogging interface defines a configuration object used by a fax client application to retrieve and set options for activity logging.
 * @remarks
 * 
  * A default implementation of <b>IFaxActivityLogging</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxactivitylogging">FaxActivityLogging</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxactivitylogging
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxActivityLogging extends IDispatch{
    /**
     * The interface identifier for IFaxActivityLogging
     * @type {Guid}
     */
    static IID => Guid("{1e29078b-5a69-497b-9592-49b7e7faddb5}")

    /**
     * The class identifier for FaxActivityLogging
     * @type {Guid}
     */
    static CLSID => Guid("{f0a0294e-3bbd-48b8-8f13-8c591a55bdbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbLogIncoming 
     * @returns {HRESULT} 
     */
    get_LogIncoming(pbLogIncoming) {
        result := ComCall(7, this, "ptr", pbLogIncoming, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bLogIncoming 
     * @returns {HRESULT} 
     */
    put_LogIncoming(bLogIncoming) {
        result := ComCall(8, this, "short", bLogIncoming, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbLogOutgoing 
     * @returns {HRESULT} 
     */
    get_LogOutgoing(pbLogOutgoing) {
        result := ComCall(9, this, "ptr", pbLogOutgoing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bLogOutgoing 
     * @returns {HRESULT} 
     */
    put_LogOutgoing(bLogOutgoing) {
        result := ComCall(10, this, "short", bLogOutgoing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDatabasePath 
     * @returns {HRESULT} 
     */
    get_DatabasePath(pbstrDatabasePath) {
        result := ComCall(11, this, "ptr", pbstrDatabasePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDatabasePath 
     * @returns {HRESULT} 
     */
    put_DatabasePath(bstrDatabasePath) {
        bstrDatabasePath := bstrDatabasePath is String ? BSTR.Alloc(bstrDatabasePath).Value : bstrDatabasePath

        result := ComCall(12, this, "ptr", bstrDatabasePath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
