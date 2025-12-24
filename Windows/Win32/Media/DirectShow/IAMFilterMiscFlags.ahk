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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMiscFlags"]

    /**
     * The GetMiscFlags method returns the filter's type, either source or renderer.
     * @returns {Integer} This method returns a member of the <a href="/windows/desktop/api/strmif/ne-strmif-_am_filter_misc_flags">_AM_FILTER_MISC_FLAGS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamfiltermiscflags-getmiscflags
     */
    GetMiscFlags() {
        result := ComCall(3, this, "uint")
        return result
    }
}
