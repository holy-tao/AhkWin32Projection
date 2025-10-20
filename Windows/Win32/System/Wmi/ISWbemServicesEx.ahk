#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISWbemServices.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemServicesEx extends ISWbemServices{
    /**
     * The interface identifier for ISWbemServicesEx
     * @type {Guid}
     */
    static IID => Guid("{d2f68443-85dc-427e-91d8-366554cc754c}")

    /**
     * The class identifier for SWbemServicesEx
     * @type {Guid}
     */
    static CLSID => Guid("{62e522dc-8cf3-40a8-8b2e-37d595651e40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<ISWbemObjectEx>} objWbemObject 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<ISWbemObjectPath>} objWbemObjectPath 
     * @returns {HRESULT} 
     */
    Put(objWbemObject, iFlags, objWbemNamedValueSet, objWbemObjectPath) {
        result := ComCall(26, this, "ptr", objWbemObject, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemObjectPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemSink>} objWbemSink 
     * @param {Pointer<ISWbemObjectEx>} objWbemObject 
     * @param {Integer} iFlags 
     * @param {Pointer<IDispatch>} objWbemNamedValueSet 
     * @param {Pointer<IDispatch>} objWbemAsyncContext 
     * @returns {HRESULT} 
     */
    PutAsync(objWbemSink, objWbemObject, iFlags, objWbemNamedValueSet, objWbemAsyncContext) {
        result := ComCall(27, this, "ptr", objWbemSink, "ptr", objWbemObject, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr", objWbemAsyncContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
