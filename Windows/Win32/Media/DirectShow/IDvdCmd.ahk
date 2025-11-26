#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdCmd interface waits for DVD commands to start or end.The DVD Navigator creates synchronization objects that expose this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdcmd
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdCmd extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdCmd
     * @type {Guid}
     */
    static IID => Guid("{5a4a97e4-94ee-4a55-9751-74b5643aa27d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WaitForStart", "WaitForEnd"]

    /**
     * The WaitForStart method blocks the DVD Navigator until the command associated with this object begins.
     * @returns {HRESULT} Returns S_OK if successful or an <b>HRESULT</b> error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcmd-waitforstart
     */
    WaitForStart() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The WaitForEnd method blocks the DVD Navigator until the command associated with this object completes or is canceled.
     * @returns {HRESULT} Returns S_OK if successful or an <b>HRESULT</b> error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcmd-waitforend
     */
    WaitForEnd() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
