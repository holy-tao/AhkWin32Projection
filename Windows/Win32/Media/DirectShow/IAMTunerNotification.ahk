#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This callback interface has been deprecated, because the TV Tuner filter does not implement the callback mechanism. .
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtunernotification
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTunerNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMTunerNotification
     * @type {Guid}
     */
    static IID => Guid("{211a8760-03ac-11d1-8d13-00aa00bd8339}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEvent"]

    /**
     * 
     * @param {Integer} Event 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtunernotification-onevent
     */
    OnEvent(Event) {
        result := ComCall(3, this, "int", Event, "HRESULT")
        return result
    }
}
