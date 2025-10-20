#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPServices interface is implemented by Windows Media Player. It provides methods to retrieve the current stream state and current stream time.
 * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nn-wmpservices-iwmpservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPServices extends IUnknown{
    /**
     * The interface identifier for IWMPServices
     * @type {Guid}
     */
    static IID => Guid("{afb6b76b-1e20-4198-83b3-191db6e0b149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int64>} prt 
     * @returns {HRESULT} 
     */
    GetStreamTime(prt) {
        result := ComCall(3, this, "int64*", prt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetStreamState(pState) {
        result := ComCall(4, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
