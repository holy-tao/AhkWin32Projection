#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IHostDataModelAccess extends IUnknown{
    /**
     * The interface identifier for IHostDataModelAccess
     * @type {Guid}
     */
    static IID => Guid("{f2bce54e-4835-4f8a-836e-7981e29904d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDataModelManager>} manager 
     * @param {Pointer<IDebugHost>} host 
     * @returns {HRESULT} 
     */
    GetDataModel(manager, host) {
        result := ComCall(3, this, "ptr", manager, "ptr", host, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
