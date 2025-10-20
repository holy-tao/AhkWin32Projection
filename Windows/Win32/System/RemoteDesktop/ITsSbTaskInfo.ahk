#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties that the Remote Desktop Connection Broker uses to set a plugin’s queue.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbtaskinfo
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbTaskInfo extends IUnknown{
    /**
     * The interface identifier for ITsSbTaskInfo
     * @type {Guid}
     */
    static IID => Guid("{523d1083-89be-48dd-99ea-04e82ffa7265}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_TargetId(pName) {
        result := ComCall(3, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pStartTime 
     * @returns {HRESULT} 
     */
    get_StartTime(pStartTime) {
        result := ComCall(4, this, "ptr", pStartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pEndTime 
     * @returns {HRESULT} 
     */
    get_EndTime(pEndTime) {
        result := ComCall(5, this, "ptr", pEndTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pDeadline 
     * @returns {HRESULT} 
     */
    get_Deadline(pDeadline) {
        result := ComCall(6, this, "ptr", pDeadline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pIdentifier 
     * @returns {HRESULT} 
     */
    get_Identifier(pIdentifier) {
        result := ComCall(7, this, "ptr", pIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pLabel 
     * @returns {HRESULT} 
     */
    get_Label(pLabel) {
        result := ComCall(8, this, "ptr", pLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pContext 
     * @returns {HRESULT} 
     */
    get_Context(pContext) {
        result := ComCall(9, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPlugin 
     * @returns {HRESULT} 
     */
    get_Plugin(pPlugin) {
        result := ComCall(10, this, "ptr", pPlugin, "int")
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
        result := ComCall(11, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
