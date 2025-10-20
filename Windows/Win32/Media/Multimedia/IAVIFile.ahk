#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIFile interface supports opening and manipulating files and file headers, and creating and obtaining stream interfaces. Uses IUnknown::QueryInterface, IUnknown::AddRef, and IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavifile
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIFile extends IUnknown{
    /**
     * The interface identifier for IAVIFile
     * @type {Guid}
     */
    static IID => Guid("{00020020-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} pfi 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    Info(pfi, lSize) {
        result := ComCall(3, this, "ptr", pfi, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppStream 
     * @param {Integer} fccType 
     * @param {Integer} lParam 
     * @returns {HRESULT} 
     */
    GetStream(ppStream, fccType, lParam) {
        result := ComCall(4, this, "ptr", ppStream, "uint", fccType, "int", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppStream 
     * @param {Pointer<AVISTREAMINFOW>} psi 
     * @returns {HRESULT} 
     */
    CreateStream(ppStream, psi) {
        result := ComCall(5, this, "ptr", ppStream, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ckid 
     * @param {Pointer} lpData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    WriteData(ckid, lpData, cbData) {
        result := ComCall(6, this, "uint", ckid, "ptr", lpData, "int", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ckid 
     * @param {Pointer} lpData 
     * @param {Pointer<Int32>} lpcbData 
     * @returns {HRESULT} 
     */
    ReadData(ckid, lpData, lpcbData) {
        result := ComCall(7, this, "uint", ckid, "ptr", lpData, "int*", lpcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndRecord() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fccType 
     * @param {Integer} lParam 
     * @returns {HRESULT} 
     */
    DeleteStream(fccType, lParam) {
        result := ComCall(9, this, "uint", fccType, "int", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
