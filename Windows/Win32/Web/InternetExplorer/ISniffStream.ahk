#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISniffStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISniffStream
     * @type {Guid}
     */
    static IID => Guid("{4ef17940-30e0-11d0-b724-00aa006c1a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Peek"]

    /**
     * Initializes the trace.
     * @remarks
     * Exstrace.dll is an optional component that installs with the Simple Mail Transfer Protocol (SMTP) and the Network News Transfer Protocol (NNTP).
     * 
     * This function has no associated import library or header file; you must call it using the [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) and [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) functions.
     * @param {IStream} pStream 
     * @returns {HRESULT} This function has no parameters.
     * 
     * 
     * This function returns **TRUE** if the function succeeds; otherwise, it returns **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DevNotes/-initasynctrace
     */
    Init(pStream) {
        result := ComCall(3, this, "ptr", pStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads data from the specified console input buffer without removing it from the buffer.
     * @remarks
     * If the number of records requested exceeds the number of records available in the buffer, the number available is read. If no data is available, the function returns immediately.
     * 
     * [!INCLUDE [setting-codepage-mode-remarks](./includes/setting-codepage-mode-remarks.md)]
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} nBytes 
     * @param {Pointer<Integer>} pnBytesRead 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call [**GetLastError**](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/console/ocs/docs/peekconsoleinput
     */
    Peek(pBuffer, nBytes, pnBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pnBytesReadMarshal := pnBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pBufferMarshal, pBuffer, "uint", nBytes, pnBytesReadMarshal, pnBytesRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
