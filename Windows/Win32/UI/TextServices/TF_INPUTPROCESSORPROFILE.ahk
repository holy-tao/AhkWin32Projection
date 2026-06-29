#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Input\KeyboardAndMouse\HKL.ahk" { HKL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * This structure contains data for the input processor profile.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_inputprocessorprofile
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_INPUTPROCESSORPROFILE {
    #StructPack 8

    /**
     * The type of this profile. This is one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TF_PROFILETYPE_INPUTPROCESSOR</td>
     * <td>This is a text service.</td>
     * </tr>
     * <tr>
     * <td>TF_PROFILETYPE_KEYBOARDLAYOUT</td>
     * <td>This is a keyboard layout.</td>
     * </tr>
     * </table>
     */
    dwProfileType : UInt32

    /**
     * The language id for this profile.
     */
    langid : UInt16

    /**
     * The CLSID of the text service. This is CLSID_NULL if this profile is a keyboard layout.
     */
    clsid : Guid

    /**
     * The guidProfile of the text services. This is GUID_NULL if this profile is a keyboard layout.
     */
    guidProfile : Guid

    /**
     * The category of this text service. This category is GUID_TFCAT_TIP_KEYBOARD, GUID_TFCAT_TIP_SPEECH, GUID_TFCAT_TIP_HANDWRITING or something in GUID_TFCAT_CATEGORY_OF_TIP.
     */
    catid : Guid

    /**
     * The keyboard layout handle of the substitute for this text service. This can be <b>NULL</b> if the text service does not have a substitute or this profile is a keyboard layout.
     */
    hklSubstitute : HKL

    /**
     * The flag to specify the capability of text service. This is the combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_DISABLEONTRANSITORY</td>
     * <td>This text service profile is disabled on transitory context.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_SECUREMODESUPPORT</td>
     * <td>This text service supports the secure mode. This is categorized in GUID_TFCAT_TIPCAP_SECUREMODE.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_UIELEMENTENABLED</td>
     * <td>This text service supports the UIElement. This is categorized in GUID_TFCAT_TIPCAP_UIELEMENTENABLED.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_COMLESSSUPPORT</td>
     * <td>This text service can be activated without COM. This is categorized in GUID_TFCAT_TIPCAP_COMLESS.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_WOW16SUPPORT</td>
     * <td>This text service can be activated on 16bit task. This is categorized in GUID_TFCAT_TIPCAP_WOW16.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_IMMERSIVESUPPORT</td>
     * <td><b>Starting with Windows 8:</b> This text service has been tested to run properly in a Windows Store app.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_CAPS_SYSTRAYSUPPORT</td>
     * <td><b>Starting with Windows 8:</b> This text service supports inclusion in the System Tray.  This is used for text services that do not set the TF_IPP_CAPS_IMMERSIVESUPPORT flag but  are still compatible with the System Tray.</td>
     * </tr>
     * </table>
     */
    dwCaps : UInt32

    /**
     * The keyboard layout handle. This is <b>NULL</b> if this profile is a text service.
     */
    hkl : HKL

    /**
     * The flag for this profile. This is a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TF_IPP_FLAG_ACTIVE</td>
     * <td>This profile is now active.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_FLAG_ENABLED</td>
     * <td>This profile is enabled.</td>
     * </tr>
     * <tr>
     * <td>TF_IPP_FLAG_SUBSTITUTEDBYINPUTPROCESSOR</td>
     * <td>This profile is substituted by a text service.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
