#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The **COLORMATCHSETUP** structure contains information that the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function uses to initialize the **ColorManagement** dialog box. (Unicode)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-colormatchsetupw
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class COLORMATCHSETUPW extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Size of the structure. Should be set to **sizeof** ( **COLORMATCHSETUP** ).
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Version of the **COLORMATCHSETUP** structure. This should be set to COLOR\_MATCH\_VERSION.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A set of bit flags used to initialize the dialog box. If set to 0 on entry, all controls assume their default states.
     * 
     * When the dialog box returns, these flags are set to indicate the user's input.
     * 
     * This member can be set using a combination of the following flags.
     * 
     * | Flag | Meaning |
     * |-|-|
     * | CMS\_DISABLEICM | If set on entry, this flag indicates that the "Enable Color Management" check box is cleared, disabling all other controls. If set on exit, it means that the user does not wish color management performed. |
     * | CMS\_ENABLEPROOFING | If set on entry, this flag indicates that the Proofing controls are to be enabled, and the Proofing check box is checked. If set on exit, it means that the user wishes to perform color management for a different target device than the selected printer. |
     * | CMS\_SETRENDERINTENT | If set on entry, this flag indicates that the **dwRenderIntent** member contains the value to use to initialize the Rendering Intent control. Otherwise, the control defaults to Picture rendering. This flag is set on exit if WCS is enabled. |
     * | CMS\_SETPROOFINTENT | Ignored unless CMS\_ENABLEPROOFING is also set. If set on entry, and CMS\_ENABLEPROOFING is also set, this flag indicates that the **dwProofingIntent** member is to be used to initialize the Target Rendering Intent control. Otherwise, the control defaults to Picture rendering. This flag is set on exit if proofing is enabled. |
     * | CMS\_SETMONITORPROFILE | If set on entry, this flag indicates that the color management profile named in the **pMonitorProfile** member is to be the initial selection in the monitor profile control. If the specified profile is not associated with the monitor, this flag is ignored, and the default profile for the monitor is used. |
     * | CMS\_SETPRINTERPROFILE | If set on entry, this flag indicates that the color management profile named in the **pPrinterProfile** member is to be the initial selection in the printer profile control. If the specified profile is not associated with the printer, this flag is ignored, and the default profile for the printer is used. |
     * | CMS\_SETTARGETPROFILE | If set on entry, this flag indicates that the color profile named in the **pTargetProfile** member is to be the initial selection in the target profile control. If the specified profile is not installed, this flag is ignored, and the default profile for the printer is used. If the printer has no default profile, then the first profile in alphabetical order will be displayed. |
     * | CMS\_USEHOOK | This flag specifies that the **lpfnHook** member contains the address of a hook procedure, and the **lParam** member contains a value to be passed to the hook procedure when the WM\_INITDIALOG message is sent. |
     * | CMS\_MONITOROVERFLOW | This flag is set on exit if color management is to be enabled and the buffer size given in **ccMonitorProfile** is insufficient for the selected profile name. **GetLastError** returns ERROR\_INSUFFICIENT\_BUFFER in such a case. |
     * | CMS\_PRINTERROVERFLOW | This flag is set on exit if color management is to be enabled and the buffer size given in **ccPrinterProfile** is insufficient for the selected profile name. **GetLastError** returns ERROR\_INSUFFICIENT\_BUFFER in such a case. |
     * | CMS\_TARGETOVERFLOW | This flag is set on exit if proofing is to be enabled and the buffer size given in **ccTargetProfile** is insufficient for the selected profile name. **GetLastError** returns ERROR\_INSUFFICIENT\_BUFFER in such a case. |
     * | CMS\_USEAPPLYCALLBACK | If set on entry, this flag indicates that the **SetupColorMatching** function should call the function [**PCMSCALLBACKW**](/windows/win32/api/icm/nc-icm-pcmscallbackw). The address of the callback function is contained in *lpfnApplyCallback*. |
     * | CMS\_USEDESCRIPTION | If set on entry, this flag instructs the **SetupColorMatching** function to retrieve the profile description contained in the profile description tags (See ICC Profile Format Specification v3.4). It will insert them into the **Monitor Profile**, **Printer Profile**, **Emulated Device Profile** edit boxes in the **Color Management** common dialog box. |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The window handle to the owner of the dialog box, or **NULL** if the dialog box has no owner.
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to an application-specified string which describes the source profile of the item for which color management is to be performed. If this is **NULL**, the Image Source control displays the name of the Windows default color profile.
     * @type {Pointer<PWSTR>}
     */
    pSourceName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to a string naming the monitor to be used for color management. If this is not the name of a valid monitor, the first enumerated monitor is used.
     * @type {Pointer<PWSTR>}
     */
    pDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to a string naming the printer on which the image is to be rendered. If this is not a valid printer name, the default printer is used and named in the dialog.
     * @type {Pointer<PWSTR>}
     */
    pPrinterName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The type of color management desired. Valid values are:
     * 
     * INTENT\_PERCEPTUAL
     * 
     * INTENT\_SATURATION
     * 
     * INTENT\_RELATIVE\_COLORIMETRIC
     * 
     * INTENT\_ABSOLUTE\_COLORIMETRIC
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @type {Integer}
     */
    dwRenderIntent {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The type of color management desired for the proofed image. Valid values are:
     * 
     * INTENT\_PERCEPTUAL
     * 
     * INTENT\_SATURATION
     * 
     * INTENT\_RELATIVE\_COLORIMETRIC
     * 
     * INTENT\_ABSOLUTE\_COLORIMETRIC
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @type {Integer}
     */
    dwProofingIntent {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Pointer to a buffer in which to place the name of the user-selected monitor profile. If the CMS\_SETMONITORPROFILE flag is used, this flag can also be used to select a profile other than the monitor default when the dialog is first displayed.
     * @type {Pointer<PWSTR>}
     */
    pMonitorProfile {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size of the buffer pointed to by the **pMonitorProfile** member, in characters. If the buffer is not large enough to hold the selected name, the name is truncated to this size, and ERROR\_INSUFFICIENT\_BUFFER is returned. A buffer of MAX\_PATH size always works.
     * @type {Integer}
     */
    ccMonitorProfile {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Points to a buffer in which to place the name of the user-selected printer profile. If the CMS\_SETPRINTERPROFILE flag is used, this flag can also be used to select a profile other than the printer default when the dialog is first displayed.
     * @type {Pointer<PWSTR>}
     */
    pPrinterProfile {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The size of the buffer pointed to by the **pPrinterProfile** member, in characters. If the buffer is not large enough to hold the selected name, the name is truncated to this size, and ERROR\_INSUFFICIENT\_BUFFER is returned. A buffer of MAX\_PATH size always works.
     * @type {Integer}
     */
    ccPrinterProfile {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Points to a buffer in which to place the name of the user-selected target profile for proofing. If the CMS\_SETTARGETPROFILE flag is used, this flag can also be used to select a profile other than the printer default when the dialog is first displayed.
     * @type {Pointer<PWSTR>}
     */
    pTargetProfile {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The size of the buffer pointed to by the **pTargetProfile** member, in characters. If the buffer is not large enough to hold the selected name, the name is truncated to this size, and ERROR\_INSUFFICIENT\_BUFFER is returned. A buffer of MAX\_PATH size always works.
     * @type {Integer}
     */
    ccTargetProfile {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * If the CMS\_USEHOOK flag is set, this member is the address of a dialog procedure (see [DialogProc](https://msdn.microsoft.com/windows/desktop/37c1b0b2-cf81-45d9-9a4e-9e5f7fa58dfd) ) that can filter or handle messages for the dialog. The hook procedure receives no messages issued before WM\_INITDIALOG. It is called on the WM\_INITDIALOG message after the system-provided dialog procedure has processed the message. On all other messages, the hook procedure receives the message before the system-provided procedure. If the hook procedure returns **TRUE** to these messages, the system-provided procedure is not called.
     * 
     * The hook procedure may call the [EndDialog](https://msdn.microsoft.com/windows/desktop/925e8aa8-9d8d-4bec-a19e-ba24e78b2d10) function.
     * @type {Pointer<DLGPROC>}
     */
    lpfnHook {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * If the CMS\_USEHOOK flag is set, this member is passed to the application-provided hook procedure as the *lParam* parameter when the WM\_INITDIALOG message is processed.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Contains a pointer to a callback function that is invoked when the **Apply** button of the Color Management dialog box is selected. If no callback function is provided, this member should be set to **NULL**. See [**PCMSCALLBACKW**](/windows/win32/api/icm/nc-icm-pcmscallbackw).
     * @type {Pointer<PCMSCALLBACKW>}
     */
    lpfnApplyCallback {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Contains a value that will be passed to the function **ApplyCallbackFunction** through its *lParam* parameter. The meaning and content of the value is specified by the application.
     * @type {Pointer}
     */
    lParamApplyCallback {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
