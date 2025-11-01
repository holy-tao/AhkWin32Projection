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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Info", "GetStream", "CreateStream", "WriteData", "ReadData", "EndRecord", "DeleteStream"]

    /**
     * 
     * @param {Pointer} pfi 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-info
     */
    Info(pfi, lSize) {
        result := ComCall(3, this, "ptr", pfi, "int", lSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppStream 
     * @param {Integer} fccType 
     * @param {Integer} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-getstream
     */
    GetStream(ppStream, fccType, lParam) {
        result := ComCall(4, this, "ptr*", ppStream, "uint", fccType, "int", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppStream 
     * @param {Pointer<AVISTREAMINFOW>} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-createstream
     */
    CreateStream(ppStream, psi) {
        result := ComCall(5, this, "ptr*", ppStream, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ckid 
     * @param {Pointer} lpData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-writedata
     */
    WriteData(ckid, lpData, cbData) {
        result := ComCall(6, this, "uint", ckid, "ptr", lpData, "int", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ckid 
     * @param {Pointer} lpData 
     * @param {Pointer<Integer>} lpcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-readdata
     */
    ReadData(ckid, lpData, lpcbData) {
        lpcbDataMarshal := lpcbData is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", ckid, "ptr", lpData, lpcbDataMarshal, lpcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-iavifile-endrecord
     */
    EndRecord() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fccType 
     * @param {Integer} lParam 
     * @returns {HRESULT} 
     */
    DeleteStream(fccType, lParam) {
        result := ComCall(9, this, "uint", fccType, "int", lParam, "HRESULT")
        return result
    }
}
