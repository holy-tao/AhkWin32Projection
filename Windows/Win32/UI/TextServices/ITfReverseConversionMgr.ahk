#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfReverseConversion.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReverseConversion"]

    /**
     * Retrieves an ITfReverseConversion object that can perform reverse conversions.
     * @param {Integer} langid The language ID of the profile to which the target strings belong.
     * @param {Pointer<Guid>} guidProfile The GUID of the profile to which the target strings belong.
     * @param {Integer} dwflag <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_COMLESS"></a><a id="tf_rcm_comless"></a><dl>
     * <dt><b>TF_RCM_COMLESS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Activate the reverse conversion interface without COM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_VKEY"></a><a id="tf_rcm_vkey"></a><dl>
     * <dt><b>TF_RCM_VKEY</b></dt>
     * <dt> 0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output should be an array of virtual key codes (instead of chracter key codes). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_HINT_READING_LENGTH"></a><a id="tf_rcm_hint_reading_length"></a><dl>
     * <dt><b>TF_RCM_HINT_READING_LENGTH</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reverse conversion should prioritize the order of entries in the output list based on the length of input sequence, with the shortest sequences first. It is possible that an input sequence with a low collision count might be much higher than an input sequence with a similar (but slightly higher) collision count. The interpretation of this flag varies depending on the IME. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_RCM_HINT_COLLISION_"></a><a id="tf_rcm_hint_collision_"></a><dl>
     * <dt><b>TF_RCM_HINT_COLLISION </b></dt>
     * <dt> 0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reverse conversion should prioritize the order of entries in the output list based on the collision count, with the entries containing the lowest number of collisions first.    If an input sequence corresponds to many more characters than a slightly longer input sequence, it might  be preferable to use the longer input sequence instead.  The IME determines whether this flag will affect the reverse conversion output.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ITfReverseConversion} A pointer to the address of the ITfReverseConversion object that can perform the specified reverse conversion.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfreverseconversionmgr-getreverseconversion
     */
    GetReverseConversion(langid, guidProfile, dwflag) {
        result := ComCall(3, this, "ushort", langid, "ptr", guidProfile, "uint", dwflag, "ptr*", &ppReverseConversion := 0, "HRESULT")
        return ITfReverseConversion(ppReverseConversion)
    }
}
