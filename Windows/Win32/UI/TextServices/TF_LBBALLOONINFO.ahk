#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\TfLBBalloonStyle.ahk" { TfLBBalloonStyle }

/**
 * The TF_LBBALLOONINFO structure contains information about a language bar balloon item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ns-ctfutb-tf_lbballooninfo
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_LBBALLOONINFO {
    #StructPack 8

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbballoonstyle">TfLBBalloonStyle</a> values that specify the type of balloon to display.
     */
    style : TfLBBalloonStyle

    /**
     * Contains a <b>BSTR</b> that contains the string for the balloon. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    bstrText : BSTR

}
