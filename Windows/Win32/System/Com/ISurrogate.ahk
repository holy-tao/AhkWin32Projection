#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ISurrogate (objidlbase.h) interface is used to dynamically load new DLL servers into an existing surrogate and free the surrogate when it is no longer needed.
 * @remarks
 * A surrogate is an EXE process into which a DLL server can be loaded to give the DLL server the advantages of an EXE server without the coding overhead. It can also allow independent DLL servers to be located together within a single process, reducing the total number of processes needed. DLL servers are easy to write using standard development tools, like Microsoft Visual Studio, and running them in a surrogate process provides the benefits of an executable implementation, including fault isolation, the ability to serve multiple clients simultaneously, and allowing the server to provide services to remote clients in a distributed environment.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-isurrogate
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISurrogate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurrogate
     * @type {Guid}
     */
    static IID => Guid("{00000022-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadDllServer", "FreeSurrogate"]

    /**
     * The ISurrogate::LoadDllServer (objidlbase.h) method loads a DLL server into the implementing surrogate.
     * @remarks
     * Upon receiving a load request through <b>LoadDllServer</b>, the surrogate must perform the following steps:
     * 
     * <ol>
     * <li>Create a class factory object that supports <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a>.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> to register the new class factory object as the class factory for the requested CLSID.</li>
     * </ol>
     * This class factory's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iclassfactory-createinstance">IClassFactory::CreateInstance</a> will create an instance of the requested CLSID method by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> to get the class factory which creates an actual object for the given CLSID.
     * @param {Pointer<Guid>} Clsid The CLSID of the DLL server to be loaded.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isurrogate-loaddllserver
     */
    LoadDllServer(Clsid) {
        result := ComCall(3, this, "ptr", Clsid, "HRESULT")
        return result
    }

    /**
     * The ISurrogate::FreeSurrogate (objidlbase.h) method unloads a DLL server.
     * @remarks
     * COM calls <b>FreeSurrogate</b> when there are no more DLL servers running in the surrogate process. When <b>FreeSurrogate</b> is called, the method must properly revoke all of the class factories registered in the surrogate, and then cause the surrogate process to exit.
     * 
     * Surrogate processes must call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cofreeunusedlibraries">CoFreeUnusedLibraries</a> function periodically to unload DLL servers that are no longer in use. The surrogate process assumes this responsibility, which would normally be the client's responsibility. <b>CoFreeUnusedLibraries</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllcanunloadnow">DllCanUnloadNow</a> function on any loaded DLL servers. Because <b>CoFreeUnusedLibraries</b> depends on the existence and proper implementation of <b>DllCanUnloadNow</b> in DLL servers, it is not guaranteed to unload all DLL servers that should be unloaded --not every server implements <b>DllCanUnloadNow</b>, and this function is unreliable for free-threaded DLLs. Additionally, the surrogate has no way of being informed when all DLL servers are gone. COM, however, can determine when all DLL servers have been unloaded, and will then call the <b>FreeSurrogate</b> method.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isurrogate-freesurrogate
     */
    FreeSurrogate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
