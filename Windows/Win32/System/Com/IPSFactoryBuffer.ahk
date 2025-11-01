#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IRpcProxyBuffer>} ppProxy 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipsfactorybuffer-createproxy
     */
    CreateProxy(pUnkOuter, riid, ppProxy, ppv) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", ppProxy, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} pUnkServer 
     * @param {Pointer<IRpcStubBuffer>} ppStub 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipsfactorybuffer-createstub
     */
    CreateStub(riid, pUnkServer, ppStub) {
        result := ComCall(4, this, "ptr", riid, "ptr", pUnkServer, "ptr*", ppStub, "HRESULT")
        return result
    }
}
