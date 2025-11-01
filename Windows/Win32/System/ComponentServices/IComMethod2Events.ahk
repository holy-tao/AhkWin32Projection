#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if an object's method has been called, returned, or generated an exception.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icommethod2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComMethod2Events extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComMethod2Events
     * @type {Guid}
     */
    static IID => Guid("{fb388aaa-567d-4024-af8e-6e93ee748573}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMethodCall2", "OnMethodReturn2", "OnMethodException2"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} dwThread 
     * @param {Integer} iMeth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodcall2
     */
    OnMethodCall2(pInfo, oid, guidCid, guidRid, dwThread, iMeth) {
        result := ComCall(3, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", dwThread, "uint", iMeth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} dwThread 
     * @param {Integer} iMeth 
     * @param {HRESULT} hresult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodreturn2
     */
    OnMethodReturn2(pInfo, oid, guidCid, guidRid, dwThread, iMeth, hresult) {
        result := ComCall(4, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", dwThread, "uint", iMeth, "int", hresult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} oid 
     * @param {Pointer<Guid>} guidCid 
     * @param {Pointer<Guid>} guidRid 
     * @param {Integer} dwThread 
     * @param {Integer} iMeth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icommethod2events-onmethodexception2
     */
    OnMethodException2(pInfo, oid, guidCid, guidRid, dwThread, iMeth) {
        result := ComCall(5, this, "ptr", pInfo, "uint", oid, "ptr", guidCid, "ptr", guidRid, "uint", dwThread, "uint", iMeth, "HRESULT")
        return result
    }
}
