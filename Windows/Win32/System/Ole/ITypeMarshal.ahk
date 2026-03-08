#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeMarshal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeMarshal
     * @type {Guid}
     */
    static IID => Guid("{0000002d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Size", "Marshal", "Unmarshal", "Free"]

    /**
     * Represents an ordered pair of floating-point numbers that specify a height and width.
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.foundation/ns-windows-foundation-size
     */
    Size(pvType, dwDestContext, pvDestContext) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint*", &pSize := 0, "HRESULT")
        return pSize
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwDestContext 
     * @param {Pointer<Void>} pvDestContext 
     * @param {Integer} cbBufferLength 
     * @param {Pointer} pBuffer 
     * @returns {Integer} 
     */
    Marshal(pvType, dwDestContext, pvDestContext, cbBufferLength, pBuffer) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pvDestContextMarshal := pvDestContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvTypeMarshal, pvType, "uint", dwDestContext, pvDestContextMarshal, pvDestContext, "uint", cbBufferLength, "ptr", pBuffer, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @param {Pointer<Void>} pvType 
     * @param {Integer} dwFlags 
     * @param {Integer} cbBufferLength 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     */
    Unmarshal(pvType, dwFlags, cbBufferLength, pBuffer, pcbRead) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pvTypeMarshal, pvType, "uint", dwFlags, "uint", cbBufferLength, pBufferMarshal, pBuffer, pcbReadMarshal, pcbRead, "HRESULT")
        return result
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
     * @param {Pointer<Void>} pvType 
     * @returns {HRESULT} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/ws2tcpip/nf-ws2tcpip-freeaddrinfoex
     */
    Free(pvType) {
        pvTypeMarshal := pvType is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pvTypeMarshal, pvType, "HRESULT")
        return result
    }
}
