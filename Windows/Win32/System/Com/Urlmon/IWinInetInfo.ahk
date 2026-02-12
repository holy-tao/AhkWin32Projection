#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9d6-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryOption"]

    /**
     * Determines whether the specified function in a delay-loaded DLL is available on the system.
     * @remarks
     * A delay-loaded DLL is statically linked but not actually loaded into memory until the running application references a symbol exported by that DLL. Applications often delay load DLLs that contain functions the application might call only rarely or not at all, because the DLL is only loaded when it is needed instead of being loaded at application startup like other statically linked DLLs. This helps improve application performance, especially during initialization. A delay-load DLL is specified at link time with the <a href="https://docs.microsoft.com/cpp/build/reference/delayload-delay-load-import">/DELAYLOAD (Delay Load Import)</a> linker option. 
     * 
     * Applications that target multiple versions of Windows or multiple Windows device families also rely on delay-loaded DLLs to make visible extra features when they are available.
     * 
     * A desktop application can use delayed loading as an alternative to runtime dynamic linking that uses  <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a> to load a DLL and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to get a pointer to a function. A Windows Store app cannot use <b>LoadLibrary</b> or <b>LoadLibraryEx</b>, so to get the benefits to runtime dynamic linking, a Windows Store app must use the delayed loading mechanism.
     * 
     * To check whether a function in a delay-loaded DLL is available on the system, the application calls <b>QueryOptionalDelayLoadedAPI</b> with the specified function. If <b>QueryOptionalDelayLoadedAPI</b> succeeds, the application can safely call the specified function.
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @returns {HRESULT} TRUE if the specified function is available on the system. If the specified function is not available on the system, this function returns FALSE. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/libloaderapi2/nf-libloaderapi2-queryoptionaldelayloadedapi
     */
    QueryOption(dwOption, pBuffer, pcbBuf) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwOption, pBufferMarshal, pBuffer, pcbBufMarshal, pcbBuf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
