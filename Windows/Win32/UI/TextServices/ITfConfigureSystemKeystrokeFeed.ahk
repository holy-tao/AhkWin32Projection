#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfConfigureSystemKeystrokeFeed interface is implemented by the TSF manager to enable and disable the processing of keystrokes.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfconfiguresystemkeystrokefeed
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfConfigureSystemKeystrokeFeed extends IUnknown{
    /**
     * The interface identifier for ITfConfigureSystemKeystrokeFeed
     * @type {Guid}
     */
    static IID => Guid("{0d2c969a-bc9c-437c-84ee-951c49b1a764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableSystemKeystrokeFeed() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableSystemKeystrokeFeed() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
