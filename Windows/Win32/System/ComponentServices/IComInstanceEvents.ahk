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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnObjectCreate", "OnObjectDestroy"]

    /**
     * Generated when an object is created by a client.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Pointer<Guid>} clsid The CLSID of the object being created.
     * @param {Pointer<Guid>} tsid The transaction stream identifier, which is unique for correlation to objects.
     * @param {Integer} CtxtID The context identifier for this object.
     * @param {Integer} ObjectID The initial just-in-time (JIT) activated object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icominstanceevents-onobjectcreate
     */
    OnObjectCreate(pInfo, guidActivity, clsid, tsid, CtxtID, ObjectID) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "ptr", clsid, "ptr", tsid, "uint", CtxtID, "uint", ObjectID, "HRESULT")
        return result
    }

    /**
     * Generated when an object is released by a client.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The context identifier of the object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icominstanceevents-onobjectdestroy
     */
    OnObjectDestroy(pInfo, CtxtID) {
        result := ComCall(4, this, "ptr", pInfo, "uint", CtxtID, "HRESULT")
        return result
    }
}
