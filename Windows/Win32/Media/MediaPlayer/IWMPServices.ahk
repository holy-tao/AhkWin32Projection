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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamTime", "GetStreamState"]

    /**
     * The IWMPServices::GetStreamTime method retrieves a structure indicating the current stream time.
     * @param {Pointer<Integer>} prt Pointer to a <b>REFERENCE_TIME</b> structure.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpservices-getstreamtime
     */
    GetStreamTime(prt) {
        prtMarshal := prt is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtMarshal, prt, "HRESULT")
        return result
    }

    /**
     * The IWMPServices::GetStreamState method retrieves information about the current play state of the stream.
     * @param {Pointer<Integer>} pState A pointer to a <b>WMPServices_StreamState</b> enumeration value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wmpservices/nf-wmpservices-iwmpservices-getstreamstate
     */
    GetStreamState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pStateMarshal, pState, "HRESULT")
        return result
    }
}
