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
     * 
     * @param {Pointer<UInt32>} size 
     * @param {Pointer<Byte>} data 
     * @returns {HRESULT} 
     */
    GetData(size, data) {
        result := ComCall(3, this, "uint*", size, "char*", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} stage 
     * @param {Integer} cbIn 
     * @param {Pointer} pbIn 
     * @param {Pointer<UInt32>} pcbOut 
     * @param {Pointer<Byte>} ppbOut 
     * @returns {HRESULT} 
     */
    Setup(stage, cbIn, pbIn, pcbOut, ppbOut) {
        result := ComCall(4, this, "uint", stage, "uint", cbIn, "ptr", pbIn, "uint*", pcbOut, "char*", ppbOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
