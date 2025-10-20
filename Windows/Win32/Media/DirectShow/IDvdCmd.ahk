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
     * 
     * @returns {HRESULT} 
     */
    WaitForStart() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForEnd() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
