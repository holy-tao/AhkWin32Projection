#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMFilterMiscFlags interface queries whether a filter is a source filter or a renderer.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamfiltermiscflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMFilterMiscFlags extends IUnknown{
    /**
     * The interface identifier for IAMFilterMiscFlags
     * @type {Guid}
     */
    static IID => Guid("{2dd74950-a890-11d1-abe8-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetMiscFlags() {
        result := ComCall(3, this, "uint")
        return result
    }
}
