#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a plug-in component for the enhanced video renderer (EVR) to work with protected media.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-ievrtrustedvideoplugin
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IEVRTrustedVideoPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEVRTrustedVideoPlugin
     * @type {Guid}
     */
    static IID => Guid("{83a4ce40-7710-494b-a893-a472049af630}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInTrustedVideoMode", "CanConstrict", "SetConstriction", "DisableImageExport"]

    /**
     * Queries whether the plug-in has any transient vulnerabilities at this time.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the plug-in has no transient vulnerabilities at the moment and can receive protected content. If <b>FALSE</b>, the plug-in has a transient vulnerability. If the method fails, the EVR treats the value as <b>FALSE</b> (untrusted).
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrtrustedvideoplugin-isintrustedvideomode
     */
    IsInTrustedVideoMode() {
        result := ComCall(3, this, "int*", &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * Queries whether the plug-in can limit the effective video resolution.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the plug-in can limit the effective video resolution. Otherwise, the plug-in cannot limit the video resolution. If the method fails, the EVR treats the value as <b>FALSE</b> (not supported).
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrtrustedvideoplugin-canconstrict
     */
    CanConstrict() {
        result := ComCall(4, this, "int*", &pYes := 0, "HRESULT")
        return pYes
    }

    /**
     * Limits the effective video resolution.
     * @param {Integer} dwKPix Maximum number of source pixels that may appear in the final video image, in thousands of pixels. If the value is zero, the video is disabled. If the value is MAXDWORD (0xFFFFFFFF), video constriction is removed and the video may be rendered at full resolution.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrtrustedvideoplugin-setconstriction
     */
    SetConstriction(dwKPix) {
        result := ComCall(5, this, "uint", dwKPix, "HRESULT")
        return result
    }

    /**
     * Enables or disables the ability of the plug-in to export the video image.
     * @param {BOOL} bDisable Boolean value. Specify <b>TRUE</b> to disable image exporting, or <b>FALSE</b> to enable it.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-ievrtrustedvideoplugin-disableimageexport
     */
    DisableImageExport(bDisable) {
        result := ComCall(6, this, "int", bDisable, "HRESULT")
        return result
    }
}
