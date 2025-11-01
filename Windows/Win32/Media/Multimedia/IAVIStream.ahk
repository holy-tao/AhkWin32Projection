#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIStream interface supports creating and manipulating data streams within a file. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavistream
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAVIStream
     * @type {Guid}
     */
    static IID => Guid("{00020021-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Info", "FindSample", "ReadFormat", "SetFormat", "Read", "Write", "Delete", "ReadData", "WriteData", "SetInfo"]

    /**
     * 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-create
     */
    Create(lParam1, lParam2) {
        result := ComCall(3, this, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} psi 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-info
     */
    Info(psi, lSize) {
        result := ComCall(4, this, "ptr", psi, "int", lSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Integer} lFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-findsample
     */
    FindSample(lPos, lFlags) {
        result := ComCall(5, this, "int", lPos, "int", lFlags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Pointer} lpFormat 
     * @param {Pointer<Integer>} lpcbFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-readformat
     */
    ReadFormat(lPos, lpFormat, lpcbFormat) {
        result := ComCall(6, this, "int", lPos, "ptr", lpFormat, "int*", lpcbFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Pointer} lpFormat 
     * @param {Integer} cbFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-setformat
     */
    SetFormat(lPos, lpFormat, cbFormat) {
        result := ComCall(7, this, "int", lPos, "ptr", lpFormat, "int", cbFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @param {Pointer} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} plBytes 
     * @param {Pointer<Integer>} plSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-read
     */
    Read(lStart, lSamples, lpBuffer, cbBuffer, plBytes, plSamples) {
        result := ComCall(8, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "int*", plBytes, "int*", plSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @param {Pointer} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} plSampWritten 
     * @param {Pointer<Integer>} plBytesWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-write
     */
    Write(lStart, lSamples, lpBuffer, cbBuffer, dwFlags, plSampWritten, plBytesWritten) {
        result := ComCall(9, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "uint", dwFlags, "int*", plSampWritten, "int*", plBytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-delete
     */
    Delete(lStart, lSamples) {
        result := ComCall(10, this, "int", lStart, "int", lSamples, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fcc 
     * @param {Pointer} lp 
     * @param {Pointer<Integer>} lpcb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-readdata
     */
    ReadData(fcc, lp, lpcb) {
        result := ComCall(11, this, "uint", fcc, "ptr", lp, "int*", lpcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fcc 
     * @param {Pointer} lp 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavistream-writedata
     */
    WriteData(fcc, lp, cb) {
        result := ComCall(12, this, "uint", fcc, "ptr", lp, "int", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpInfo 
     * @param {Integer} cbInfo 
     * @returns {HRESULT} 
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(13, this, "ptr", lpInfo, "int", cbInfo, "HRESULT")
        return result
    }
}
