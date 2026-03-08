#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostMalloc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostMalloc
     * @type {Guid}
     */
    static IID => Guid("{1831991c-cc53-4a31-b218-04e910446479}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alloc", "DebugAlloc", "Free"]

    /**
     * Allocates a block of memory of the specified size.
     * @remarks
     * The memory block returned by <b>AllocADsMem</b> is initialized to zero.
     * 
     * For more information and a code example that shows how to use the <b>AllocADsMem</b> function, see <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a>.
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/adshlp/nf-adshlp-allocadsmem
     */
    Alloc(cbSize, eCriticalLevel) {
        result := ComCall(3, this, "ptr", cbSize, "int", eCriticalLevel, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @param {Pointer<Integer>} pszFileName 
     * @param {Integer} iLineNo 
     * @returns {Pointer<Void>} 
     */
    DebugAlloc(cbSize, eCriticalLevel, pszFileName, iLineNo) {
        pszFileNameMarshal := pszFileName is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", cbSize, "int", eCriticalLevel, pszFileNameMarshal, pszFileName, "int", iLineNo, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * The FreeAddrInfoEx function (ws2tcpip.h) frees address information that the GetAddrInfoEx function dynamically allocates in addrinfoex structures.
     * @remarks
     * The 
     * <b>FreeAddrInfoEx</b> function frees <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-addrinfoexw">addrinfoex</a> structures dynamically allocated by the  <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexa">GetAddrInfoEx</a> function. The <b>FreeAddrInfoEx</b> function frees the initial 
     * <b>addrinfoex</b> structure pointed to in the <i>pAddrInfo</i> parameter, including any buffers to which structure members point, then continues freeing any 
     * <b>addrinfoex</b> structures linked by the <b>ai_next</b> member of the <b>addrinfoex</b> structure. The 
     * <b>FreeAddrInfoEx</b> function continues freeing linked structures until a <b>NULL</b> <b>ai_next</b> member is encountered.
     * 
     * When UNICODE or _UNICODE is defined, <b>FreeAddrInfoEx</b> is defined to <b>FreeAddrInfoExW</b>, the Unicode version of the function, and <b>ADDRINFOEX</b> is defined to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-addrinfoexw">addrinfoexW</a> structure. When UNICODE or _UNICODE is not defined, <b>FreeAddrInfoEx</b> is defined to <b>FreeAddrInfoExA</b>, the ANSI version of the function, and <b>ADDRINFOEX</b> is defined to the <b>addrinfoexA</b> structure. 
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: The <b>FreeAddrInfoExW</b> function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-freeaddrinfoex
     */
    Free(pMem) {
        pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pMemMarshal, pMem, "HRESULT")
        return result
    }
}
