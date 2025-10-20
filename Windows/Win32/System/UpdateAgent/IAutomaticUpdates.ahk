#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the functionality of Automatic Updates.
 * @remarks
 * 
  * You can create an instance of this interface by using the AutomaticUpdates coclass. Use the Microsoft.Update.AutoUpdate program identifier to create the object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdates
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdates extends IDispatch{
    /**
     * The interface identifier for IAutomaticUpdates
     * @type {Guid}
     */
    static IID => Guid("{673425bf-c082-4c7c-bdfd-569464b8e0ce}")

    /**
     * The class identifier for AutomaticUpdates
     * @type {Guid}
     */
    static CLSID => Guid("{bfe18e9c-6d87-4450-b37c-e02f0b373803}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    DetectNow() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowSettingsDialog() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAutomaticUpdatesSettings>} retval 
     * @returns {HRESULT} 
     */
    get_Settings(retval) {
        result := ComCall(11, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_ServiceEnabled(retval) {
        result := ComCall(12, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableService() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
