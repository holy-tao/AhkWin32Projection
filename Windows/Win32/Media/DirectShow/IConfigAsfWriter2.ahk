#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConfigAsfWriter.ahk

/**
 * The IConfigAsfWriter2 interface extends the IConfigAsfWriter interface, which configures the WM ASF Writer filter.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iconfigasfwriter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAsfWriter2 extends IConfigAsfWriter{
    /**
     * The interface identifier for IConfigAsfWriter2
     * @type {Guid}
     */
    static IID => Guid("{7989ccaa-53f0-44f0-884a-f3b03f6ae066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<IPin>} pPin 
     * @param {Pointer<UInt16>} pwStreamNum 
     * @returns {HRESULT} 
     */
    StreamNumFromPin(pPin, pwStreamNum) {
        result := ComCall(11, this, "ptr", pPin, "ushort*", pwStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParam 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @returns {HRESULT} 
     */
    SetParam(dwParam, dwParam1, dwParam2) {
        result := ComCall(12, this, "uint", dwParam, "uint", dwParam1, "uint", dwParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParam 
     * @param {Pointer<UInt32>} pdwParam1 
     * @param {Pointer<UInt32>} pdwParam2 
     * @returns {HRESULT} 
     */
    GetParam(dwParam, pdwParam1, pdwParam2) {
        result := ComCall(13, this, "uint", dwParam, "uint*", pdwParam1, "uint*", pdwParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetMultiPassState() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
