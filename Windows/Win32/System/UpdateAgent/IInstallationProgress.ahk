#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the progress of an asynchronous installation or uninstallation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinstallationprogress
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInstallationProgress extends IDispatch{
    /**
     * The interface identifier for IInstallationProgress
     * @type {Guid}
     */
    static IID => Guid("{345c8244-43a3-4e32-a368-65f073b76f36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdateIndex(retval) {
        result := ComCall(7, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_CurrentUpdatePercentComplete(retval) {
        result := ComCall(8, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_PercentComplete(retval) {
        result := ComCall(9, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @param {Pointer<IUpdateInstallationResult>} retval 
     * @returns {HRESULT} 
     */
    GetUpdateResult(updateIndex, retval) {
        result := ComCall(10, this, "int", updateIndex, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
