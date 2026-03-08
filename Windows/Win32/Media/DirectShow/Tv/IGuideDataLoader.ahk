#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideDataLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuideDataLoader
     * @type {Guid}
     */
    static IID => Guid("{4764ff7c-fa95-4525-af4d-d32236db9e38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Terminate"]

    /**
     * Initializes the trace.
     * @remarks
     * Exstrace.dll is an optional component that installs with the Simple Mail Transfer Protocol (SMTP) and the Network News Transfer Protocol (NNTP).
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {IGuideData} pGuideStore 
     * @returns {HRESULT} This function has no parameters.
     * 
     * 
     * This function returns **TRUE** if the function succeeds; otherwise, it returns **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/DevNotes/-initasynctrace
     */
    Init(pGuideStore) {
        result := ComCall(3, this, "ptr", pGuideStore, "HRESULT")
        return result
    }

    /**
     * Eliminates the cache and ends asynchronous I/O with the DLL.
     * @returns {HRESULT} Returns <b>TRUE</b> if the function succeeds; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/filehc/nf-filehc-terminatecache
     */
    Terminate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
