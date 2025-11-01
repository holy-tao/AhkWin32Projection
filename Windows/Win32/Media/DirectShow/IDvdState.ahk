#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdState interface caches the current state.The object that implements this interface is called a DVD bookmark. You can use it to save and restore the DVD state, which includes the playback location, the user's parental level, and the DVD region.
 * @remarks
 * 
  * To get the current DVD state information from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a>, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getstate">IDvdInfo2::GetState</a>. To restore the state, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setstate">IDvdControl2::SetState</a>.
  * 
  * The DVD bookmark object also implements <b>IPersistStream</b> and <b>IPersistMemory</b>. You can use these interfaces to persist the state. You can also create an empty bookmark object by calling <b>CoCreateInstance</b>. The object's CLSID is CLSID_DVDState, defined in uuids.h.
  * 
  * Prior to Windows Vista, a bookmark can be used only on the same computer where it was created. Starting in Windows Vista, the DVD Navigator is able to create bookmarks that can be used other computers. To enable this feature, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> with the DVD_EnablePortableBookmarks flag, before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getstate">GetState</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setstate">SetState</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdstate
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdState extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdState
     * @type {Guid}
     */
    static IID => Guid("{86303d6d-1c4a-4087-ab42-f711167048ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDiscID", "GetParentalLevel"]

    /**
     * 
     * @param {Pointer<Integer>} pullUniqueID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdstate-getdiscid
     */
    GetDiscID(pullUniqueID) {
        pullUniqueIDMarshal := pullUniqueID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pullUniqueIDMarshal, pullUniqueID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulParentalLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdstate-getparentallevel
     */
    GetParentalLevel(pulParentalLevel) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulParentalLevelMarshal, pulParentalLevel, "HRESULT")
        return result
    }
}
