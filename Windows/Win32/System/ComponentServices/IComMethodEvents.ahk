#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if an object's method has been called, returned, or generated an exception.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icommethodevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComMethodEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComMethodEvents
     * @type {Guid}
     */
    static IID => Guid("{683130a9-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMethodCall", "OnMethodReturn", "OnMethodException"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} iMeth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodcall
     */
    OnMethodCall(pInfo, oid, guidCid, guidRid, iMeth) {
        result := ComCall(3, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", iMeth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} iMeth 
     * @param {HRESULT} hresult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodreturn
     */
    OnMethodReturn(pInfo, oid, guidCid, guidRid, iMeth, hresult) {
        result := ComCall(4, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", iMeth, "int", hresult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} iMeth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethodevents-onmethodexception
     */
    OnMethodException(pInfo, oid, guidCid, guidRid, iMeth) {
        result := ComCall(5, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", iMeth, "HRESULT")
        return result
    }
}
