#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes an event class that notifies subscribers whenever a method on the object that implements it either is called or returns from a call.
 * @remarks
 * 
 * To send method events to the COM+ tracker property, you need to obtain a handle to it and you need to obtain its GUID, which is defined as follows.
 * 
 * <pre class="syntax" xml:space="preserve"><code>GUID guidTrkPropPolicy = {0xecabaeb3, 0x7f19, 0x11d2, {0x97, 0x8e, 0x00, 0x00, 0xf8, 0x75, 0x7e, 0x2a}}
 * </code></pre>
 * To obtain a handle to the COM+ tracker property, call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icontext-getproperty">IContext::GetProperty</a> method with the <i>rGuid</i> argument set equal to this GUID.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isendmethodevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISendMethodEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISendMethodEvents
     * @type {Guid}
     */
    static IID => Guid("{2732fd59-b2b4-4d44-878c-8b8f09626008}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMethodCall", "SendMethodReturn"]

    /**
     * Generated when a method is called through a component interface.
     * @param {Pointer<Void>} pIdentity A pointer to the interface used to call the method.
     * @param {Pointer<Guid>} riid The ID of the interface used to call the method.
     * @param {Integer} dwMeth The method called.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isendmethodevents-sendmethodcall
     */
    SendMethodCall(pIdentity, riid, dwMeth) {
        pIdentityMarshal := pIdentity is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pIdentityMarshal, pIdentity, "ptr", riid, "uint", dwMeth, "HRESULT")
        return result
    }

    /**
     * Generated when a method called through a component interface returns control to the caller.
     * @param {Pointer<Void>} pIdentity A pointer to the interface used to call the method.
     * @param {Pointer<Guid>} riid The ID of the interface used to call the method.
     * @param {Integer} dwMeth The method called.
     * @param {HRESULT} hrCall The result returned by the method call.
     * @param {HRESULT} hrServer The result returned by the DCOM call to the server on which the component lives.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isendmethodevents-sendmethodreturn
     */
    SendMethodReturn(pIdentity, riid, dwMeth, hrCall, hrServer) {
        pIdentityMarshal := pIdentity is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pIdentityMarshal, pIdentity, "ptr", riid, "uint", dwMeth, "int", hrCall, "int", hrServer, "HRESULT")
        return result
    }
}
