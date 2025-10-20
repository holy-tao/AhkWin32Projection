#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber of an object's creation or release.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icominstanceevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComInstanceEvents extends IUnknown{
    /**
     * The interface identifier for IComInstanceEvents
     * @type {Guid}
     */
    static IID => Guid("{683130a7-2e50-11d2-98a5-00c04f8ee1c4}")

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
     * @returns {HRESULT} 
     */
    OnObjectCreate(pInfo, guidActivity, clsid, tsid, CtxtID, ObjectID) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "ptr", clsid, "ptr", tsid, "uint", CtxtID, "uint", ObjectID, "int")
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
    OnObjectDestroy(pInfo, CtxtID) {
        result := ComCall(4, this, "ptr", pInfo, "uint", CtxtID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
