#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that retireves system id data.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsystemid
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSystemId extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSystemId
     * @type {Guid}
     */
    static IID => Guid("{fff4af3a-1fc1-4ef9-a29b-d26c49e2f31a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "Setup"]

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @param {Pointer<Pointer<Integer>>} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsystemid-getdata
     */
    GetData(size, data) {
        sizeMarshal := size is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, sizeMarshal, size, "ptr*", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stage 
     * @param {Integer} cbIn 
     * @param {Pointer} pbIn 
     * @param {Pointer<Integer>} pcbOut 
     * @param {Pointer<Pointer<Integer>>} ppbOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsystemid-setup
     */
    Setup(stage, cbIn, pbIn, pcbOut, ppbOut) {
        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", stage, "uint", cbIn, "ptr", pbIn, pcbOutMarshal, pcbOut, "ptr*", ppbOut, "HRESULT")
        return result
    }
}
