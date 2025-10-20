#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to ITfReverseConversion objects, which are used to perform reverse conversions.
 * @remarks
 * 
  * A reverse conversion provides the keystroke sequences required to create the specified string.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfreverseconversionmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfReverseConversionMgr extends IUnknown{
    /**
     * The interface identifier for ITfReverseConversionMgr
     * @type {Guid}
     */
    static IID => Guid("{b643c236-c493-41b6-abb3-692412775cc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Integer} dwflag 
     * @param {Pointer<ITfReverseConversion>} ppReverseConversion 
     * @returns {HRESULT} 
     */
    GetReverseConversion(langid, guidProfile, dwflag, ppReverseConversion) {
        result := ComCall(3, this, "ushort", langid, "ptr", guidProfile, "uint", dwflag, "ptr", ppReverseConversion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
