#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcStubBuffer.ahk
#Include .\IUnknown.ahk

/**
 * Provides custom methods for the creation of COM object proxies and stubs. This interface is not marshalable.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipsfactorybuffer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPSFactoryBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPSFactoryBuffer
     * @type {Guid}
     */
    static IID => Guid("{d5f569d0-593b-101a-b569-08002b2dbf7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProxy", "CreateStub"]

    /**
     * Creates a proxy for the specified remote interface.
     * @param {IUnknown} pUnkOuter A controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface; used for aggregation.
     * @param {Pointer<Guid>} riid The identifier of the interface to proxy.
     * @param {Pointer<IRpcProxyBuffer>} ppProxy A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcproxybuffer">IRpcProxyBuffer</a> interface to control marshaling.
     * @param {Pointer<Pointer<Void>>} ppv A pointer to the interface specified by <i>riid</i>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipsfactorybuffer-createproxy
     */
    CreateProxy(pUnkOuter, riid, ppProxy, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", ppProxy, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Creates a stub for the remote use of the specified interface.
     * @param {Pointer<Guid>} riid The identifier of the interface for which a stub is to be created.
     * @param {IUnknown} pUnkServer A controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface; used for aggregation.
     * @returns {IRpcStubBuffer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a> interface pointer to control marshaling.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipsfactorybuffer-createstub
     */
    CreateStub(riid, pUnkServer) {
        result := ComCall(4, this, "ptr", riid, "ptr", pUnkServer, "ptr*", &ppStub := 0, "HRESULT")
        return IRpcStubBuffer(ppStub)
    }
}
