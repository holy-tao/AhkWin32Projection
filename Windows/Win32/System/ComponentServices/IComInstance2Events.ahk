#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if an object is created or released by a client.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icominstance2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComInstance2Events extends IUnknown{
    /**
     * The interface identifier for IComInstance2Events
     * @type {Guid}
     */
    static IID => Guid("{20e3bf07-b506-4ad5-a50c-d2ca5b9c158e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} tsid 
     * @param {Integer} CtxtID 
     * @param {Integer} ObjectID 
     * @param {Pointer<Guid>} guidPartition 
     * @returns {HRESULT} 
     */
    OnObjectCreate2(pInfo, guidActivity, clsid, tsid, CtxtID, ObjectID, guidPartition) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "ptr", clsid, "ptr", tsid, "uint", CtxtID, "uint", ObjectID, "ptr", guidPartition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} CtxtID 
     * @returns {HRESULT} 
     */
    OnObjectDestroy2(pInfo, CtxtID) {
        result := ComCall(4, this, "ptr", pInfo, "uint", CtxtID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
