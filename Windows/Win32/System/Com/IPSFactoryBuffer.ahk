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
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IRpcProxyBuffer>} ppProxy 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateProxy(pUnkOuter, riid, ppProxy, ppv) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr", ppProxy, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} pUnkServer 
     * @param {Pointer<IRpcStubBuffer>} ppStub 
     * @returns {HRESULT} 
     */
    CreateStub(riid, pUnkServer, ppStub) {
        result := ComCall(4, this, "ptr", riid, "ptr", pUnkServer, "ptr", ppStub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
