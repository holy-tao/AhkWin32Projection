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
     * 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {HRESULT} 
     */
    Create(lParam1, lParam2) {
        result := ComCall(3, this, "ptr", lParam1, "ptr", lParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} psi 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    Info(psi, lSize) {
        result := ComCall(4, this, "ptr", psi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Integer} lFlags 
     * @returns {Integer} 
     */
    FindSample(lPos, lFlags) {
        result := ComCall(5, this, "int", lPos, "int", lFlags, "int")
        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Pointer} lpFormat 
     * @param {Pointer<Int32>} lpcbFormat 
     * @returns {HRESULT} 
     */
    ReadFormat(lPos, lpFormat, lpcbFormat) {
        result := ComCall(6, this, "int", lPos, "ptr", lpFormat, "int*", lpcbFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPos 
     * @param {Pointer} lpFormat 
     * @param {Integer} cbFormat 
     * @returns {HRESULT} 
     */
    SetFormat(lPos, lpFormat, cbFormat) {
        result := ComCall(7, this, "int", lPos, "ptr", lpFormat, "int", cbFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @param {Pointer} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Int32>} plBytes 
     * @param {Pointer<Int32>} plSamples 
     * @returns {HRESULT} 
     */
    Read(lStart, lSamples, lpBuffer, cbBuffer, plBytes, plSamples) {
        result := ComCall(8, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "int*", plBytes, "int*", plSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @param {Pointer} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} plSampWritten 
     * @param {Pointer<Int32>} plBytesWritten 
     * @returns {HRESULT} 
     */
    Write(lStart, lSamples, lpBuffer, cbBuffer, dwFlags, plSampWritten, plBytesWritten) {
        result := ComCall(9, this, "int", lStart, "int", lSamples, "ptr", lpBuffer, "int", cbBuffer, "uint", dwFlags, "int*", plSampWritten, "int*", plBytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lSamples 
     * @returns {HRESULT} 
     */
    Delete(lStart, lSamples) {
        result := ComCall(10, this, "int", lStart, "int", lSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fcc 
     * @param {Pointer} lp 
     * @param {Pointer<Int32>} lpcb 
     * @returns {HRESULT} 
     */
    ReadData(fcc, lp, lpcb) {
        result := ComCall(11, this, "uint", fcc, "ptr", lp, "int*", lpcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fcc 
     * @param {Pointer} lp 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    WriteData(fcc, lp, cb) {
        result := ComCall(12, this, "uint", fcc, "ptr", lp, "int", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lpInfo 
     * @param {Integer} cbInfo 
     * @returns {HRESULT} 
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(13, this, "ptr", lpInfo, "int", cbInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
