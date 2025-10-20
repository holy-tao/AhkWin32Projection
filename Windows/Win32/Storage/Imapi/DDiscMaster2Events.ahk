#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notification when a CD or DVD device is added to or removed from the computer.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-ddiscmaster2events
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscMaster2Events extends IDispatch{
    /**
     * The interface identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static IID => Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static CLSID => Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} object 
     * @param {BSTR} uniqueId 
     * @returns {HRESULT} 
     */
    NotifyDeviceAdded(object, uniqueId) {
        uniqueId := uniqueId is String ? BSTR.Alloc(uniqueId).Value : uniqueId

        result := ComCall(7, this, "ptr", object, "ptr", uniqueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} object 
     * @param {BSTR} uniqueId 
     * @returns {HRESULT} 
     */
    NotifyDeviceRemoved(object, uniqueId) {
        uniqueId := uniqueId is String ? BSTR.Alloc(uniqueId).Value : uniqueId

        result := ComCall(8, this, "ptr", object, "ptr", uniqueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
