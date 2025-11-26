#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used exclusively in lightweight client-side handlers that require access to some of the internal interfaces on the proxy.
 * @remarks
 * 
 * Handlers that need access to some of the internal interfaces on the proxy manager have to go through the <b>IInternalUnknown</b> interface. This prevents the handlers from blindly delegating and exposing the aggregatee's internal interfaces outside of the aggregate. These interfaces include <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imultiqi">IMultiQI</a>. If the handler wants to expose <b>IClientSecurity</b> or <b>IMultiQI</b>, the handler should implement these interfaces itself and delegate to the proxy manager's implementation of these interfaces when appropriate.
 * 
 * For the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> interface, if the client tries to set the security on an interface that the handler has exposed, the handler should set the security on the underlying network interface proxy.
 * 
 * 
 * 
 * For the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imultiqi">IMultiQI</a> interface, the handler should fill in the interfaces it knows about and then forward the call to the proxy manager to fill in the rest of the interfaces.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iinternalunknown
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IInternalUnknown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternalUnknown
     * @type {Guid}
     */
    static IID => Guid("{00000021-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInternalInterface"]

    /**
     * Retrieves pointers to the supported internal interfaces on an object.
     * @param {Pointer<Guid>} riid The identifier of the internal interface being requested.
     * @returns {Pointer<Void>} The address of a pointer variable that receives the interface pointer requested in the <i>riid</i> parameter. Upon successful return, *<i>ppv</i> contains the requested interface pointer to the object. If the object does not support the interface, *<i>ppv</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iinternalunknown-queryinternalinterface
     */
    QueryInternalInterface(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
