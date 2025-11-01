#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used to dynamically load new DLL servers into an existing surrogate and free the surrogate when it is no longer needed.
 * @remarks
 * 
  * A surrogate is an EXE process into which a DLL server can be loaded to give the DLL server the advantages of an EXE server without the coding overhead. It can also allow independent DLL servers to be located together within a single process, reducing the total number of processes needed. DLL servers are easy to write using standard development tools, like Microsoft Visual Studio, and running them in a surrogate process provides the benefits of an executable implementation, including fault isolation, the ability to serve multiple clients simultaneously, and allowing the server to provide services to remote clients in a distributed environment.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isurrogate
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
     * 
     * @param {Pointer<Guid>} Clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isurrogate-loaddllserver
     */
    LoadDllServer(Clsid) {
        result := ComCall(3, this, "ptr", Clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isurrogate-freesurrogate
     */
    FreeSurrogate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
